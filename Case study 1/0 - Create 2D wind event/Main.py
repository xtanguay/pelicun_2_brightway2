# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 09:36:00 2024

@author: xtang
"""

#%%
# Library imports

import openseespy.opensees as ops
from math import asin, sqrt, ceil,pi
import os
import vfo.vfo as vfo1
import numpy as np
import matplotlib.pyplot as plt
#import xarray as xr
import random
import pickle
import pandas as pd
import opsvis
from ops_model_helper import * # This library is self built and contains the .py files of Geometry, Materials_sections, Elements, WPT2NdTHF, Recorders, and Loads


# To interact with plots (i.e. 3D), run "%matplotlib tk" in the console to activate interative plots (or change in ipython console graphics preferences)


# Local user defined functions

# N/A

#%%

# Units
m = 1 #meter
kPA = 1 # kN/m**2
MPA = 1000*kPA
kN = 1 # kilonewton
kip = 4.448222*kN
ft = 0.3048*m

#%%

# Define path variables :
main_file_path = os.path.realpath(__file__)
directory_path, filename = os.path.split(main_file_path)

results_dir = os.path.join(directory_path,'Results')
if not os.path.isdir(results_dir) : 
    os.makedirs(results_dir)


# Initiate the assessment

# Clear any previously defined assessment information
ops.wipe()

# Provide analysis information
ops.model('Basic', '-ndm', 3, '-ndf', 6)

# Define nodes & masses :
Generic_geometry = Geometry.create_generic_geom_data(5,5,19,BaywidthX = 30*ft,BaywidthY = 30*ft, Floorheight = 13*ft,UniqueFirstFloorHeight = 26*ft)


Node_coord,Node_masses = Geometry.Node_geom(Generic_geometry, masses = 2.4)

# Define node single point constraints
Geometry.Node_sp_const(Node_coord[Node_coord[:,3]==0 , 0]) #Prevent base nodes from movement, but not rotation

# Define multi-point constraints (i.e. diaphragms for same floor node displacements)
floor_diaphragm_data,V_node_geometry = Geometry.Add_centroid_nodes(Node_coord)
Geometry.Node_mp_const(floor_diaphragm_data)

# Define materials
Materials_sections.add_materials()

# Define sections 
Materials_sections.add_sections()

# Define geometric transformations
vecXZ, elem_joints,generic_elem_types = Elements.create_generic_element_data(Node_coord)
Elements.transforms(vecXZ)

# Define elements
Elements.create_elements(vecXZ, elem_joints,generic_elem_types)

# Eigen analysis
eigen = ops.eigen(10) # returns the angular frequency vector (w**2)
periods = (2*pi)/np.sqrt(np.asarray(eigen))              # T = (2*pi)/w

#### Display the active model 
opsvis.plot_model(axis_off=0,element_labels=0,node_labels=1,local_axes = False)
plt.axis('off')

#### Display the first 3 mode shapes :
display_modes = False
if display_modes == True : 
    for mode in range(1,3+1) :
        print(mode)
        opsvis.plot_mode_shape(mode,interpFlag = 0,fmt_nodes = {'color': 'blue', 'linestyle': 'None', 'linewidth': 1.2, 'marker': 's', 'markersize': 1},node_supports=False,endDispFlag=0)
        ax = plt.gca()
        ax.text2D(0,1,f'Mode {mode} : {periods[mode-1]:.0f} s',transform = ax.transAxes)
        plt.axis('off')
        plt.show()        



ops.loadConst('-time',0.0) # Reset time to 0 for transient loads but keep loads from gravity analysis constant   
ops.wipeAnalysis() # Clear analysis objects


# Import Wind load time histories
    # Load the wind load time series
wnd_data = WPT2NdTHF.extract_wnd_data(os.path.dirname(os.path.abspath(__file__)))

    # Remesh pressure coefficients along the surfaces
record_surface_data = WPT2NdTHF.remesh_wnd_pressures(wnd_data,x_refine = 3, y_refine = 3)

#### Import several wind speeds and edit so that each wind speed is provided with an output
V_mph = 100 # miles per hour
V_kmph = V_mph*1.609 # km per hour
V_mps = V_kmph*1000/3600 # meter per second


node_record_mapping = {}
node_force_records = {}
unscaled_node_force_records = {}

#%%


for record in wnd_data :     
    # Directory to processed records :
    processed_records_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)),'Results')   
    if not os.path.isdir(processed_records_dir) :
        os.makedirs(processed_records_dir)    

    processed_records = [os.path.splitext(x)[0] for x in os.listdir(processed_records_dir) if os.path.isdir(x)]
        
    # If the record is not in the directory : 
    if record not in processed_records : 
        # Map nodes to corresponding surface data 
        node_record_mapping[record] = WPT2NdTHF.pressures_to_nodes(record,record_surface_data,Node_coord)     
      
        # Create new nodal force time histories
        node_force_records[record] = WPT2NdTHF.create_scaled_wind_nodal_forces(record,wnd_data,node_record_mapping,V_mps,exposure_class = 'B')
        

        node_record_mapping[record] = WPT2NdTHF.pressures_to_nodes(record,record_surface_data,Node_coord)  ## Area is poped 
        unscaled_node_force_records[record] = WPT2NdTHF.create_unscaled_wind_nodal_forces(record,wnd_data,node_record_mapping) 

        # Add the record to the folder :
        fp = os.path.join(processed_records_dir,f'{record}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(node_force_records[record],f)    
        processed_records.append(record)
        
        # Add the unscaled record to the folder :
        fp = os.path.join(processed_records_dir,f'unscaled_{record}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(unscaled_node_force_records[record],f)    
        processed_records.append(record)
        
    # Also check if a stick model time history is available :
    # Directory to processed stick model records :
    processed_stick_models_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)),'Results','stick_model')
    if not os.path.isdir(processed_stick_models_dir) :
        os.makedirs(processed_stick_models_dir)
    
    processed_stick_models = [os.path.splitext(x)[0] for x in os.listdir(processed_stick_models_dir)]

    # If the record is not in the directory :
    if record not in processed_stick_models :

        # Retrieve the full scale building TH 
        record_TH_data_dir = os.path.join(processed_records_dir,f'{record}.pickle')
        with open(record_TH_data_dir,'rb') as f : 
            record_TH_data = pickle.load(f)  
        # Create the stick version of the time history
        final_stick_model_th = WPT2NdTHF.create_stick_model_wnd_TH(floor_diaphragm_data,V_node_geometry,Node_coord,record_TH_data)

        # Retrieve the full scale building TH 
        unscaled_record_TH_data_dir = os.path.join(processed_records_dir,f'unscaled_{record}.pickle')
        with open(unscaled_record_TH_data_dir,'rb') as f : 
            unscaled_record_TH_data = pickle.load(f)  
        # Create the stick version of the time history
        unscaled_final_stick_model_th = WPT2NdTHF.create_stick_model_wnd_TH(floor_diaphragm_data,V_node_geometry,Node_coord,unscaled_record_TH_data)

        # Add the record to the folder :
        fp = os.path.join(processed_stick_models_dir,f'{record}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(final_stick_model_th,f)    
        processed_stick_models.append(record)
        
        # Add the record to the folder :
        fp = os.path.join(processed_stick_models_dir,f'unscaled_{record}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(unscaled_final_stick_model_th,f)    
        processed_stick_models.append(record)        
        


# Also check if a stick model time history is available :
# Directory to processed stick model records :
processed_stick_models_dir = os.path.join(results_dir,'stick_model')
if not os.path.isdir(processed_stick_models_dir) :
    os.makedirs(processed_stick_models_dir)
 

processed_stick_models = [os.path.splitext(x)[0] for x in os.listdir(processed_stick_models_dir) if not os.path.isdir(os.path.join(processed_stick_models_dir,x))] 



# Each record corresponds to a wind direction
for record in wnd_data :   
    
    scaled_record_name = f'{record}'
    unscaled_record_name = f'unscaled_{record}'
        
    # If the record is not in the directory : 
    if scaled_record_name  not in processed_stick_models : 

        # Retrieve the full scale building TH 
        record_TH_data_dir = os.path.join(results_dir,f'{scaled_record_name}.pickle')
        with open(record_TH_data_dir,'rb') as f : 
            record_TH_data = pickle.load(f)  
        # Create the stick version of the time history
        final_stick_model_th = WPT2NdTHF.create_stick_model_wnd_TH(floor_diaphragm_data,V_node_geometry,Node_coord,record_TH_data)

        # Add the record to the folder :
        fp = os.path.join(processed_stick_models_dir,f'{scaled_record_name}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(final_stick_model_th,f)    
        processed_stick_models.append(scaled_record_name)

    if unscaled_record_name  not in processed_stick_models : 

        # Retrieve the full scale building TH 
        unscaled_record_TH_data_dir = os.path.join(results_dir,f'{unscaled_record_name}.pickle')
        with open(unscaled_record_TH_data_dir,'rb') as f : 
            unscaled_record_TH_data = pickle.load(f)  
        # Create the stick version of the time history
        unscaled_final_stick_model_th = WPT2NdTHF.create_stick_model_wnd_TH(floor_diaphragm_data,V_node_geometry,Node_coord,unscaled_record_TH_data)
        
        add_WEUQ = True
        
        if add_WEUQ == True: 
            unscaled_final_stick_model_th['metadata'] = {}
            unscaled_final_stick_model_th['metadata']['forces'] = ['Fx','Fy','Tz']            
            unscaled_final_stick_model_th['metadata']['D'] = wnd_data[record]['Building_depth'][0][0]
            unscaled_final_stick_model_th['metadata']['H'] = wnd_data[record]['Building_height'][0][0]            
            unscaled_final_stick_model_th['metadata']['B'] = wnd_data[record]['Building_breadth'][0][0]
            unscaled_final_stick_model_th['metadata']['fs'] = wnd_data[record]['Sample_frequency'][0][0]
            unscaled_final_stick_model_th['metadata']['Vref'] = float(wnd_data[record]['Uh_AverageWindSpeed'][0])
            freq = wnd_data[record]['Sample_frequency'][0][0] 
            max_t = wnd_data[record]['Sample_period'][0][0]            
            num = int(max_t * freq)            
            t_samples = np.linspace(0,max_t,num)    
            unscaled_final_stick_model_th['metadata']['t'] = t_samples            
            

        # Add the record to the folder :
        fp = os.path.join(processed_stick_models_dir,f'{unscaled_record_name}.pickle')
        with open(fp,'wb') as f : 
            pickle.dump(unscaled_final_stick_model_th,f)    
        processed_stick_models.append(unscaled_record_name)



























