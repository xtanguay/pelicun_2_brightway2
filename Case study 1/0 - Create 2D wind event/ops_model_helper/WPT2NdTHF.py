# -*- coding: utf-8 -*-
"""
Created on Thu Aug 22 10:06:03 2024

Wind pressure taps to Node time history files

- Open and manage a raw Tokyo Polytechnique wind pressure timeseries
- Convert wind pressure timeseries to nodal load timeseries 
- Convert nodal load timeseries to a single master node (X,Y timeseries) with resulting moment about Z axis of the node  


@author: xtang
"""

import os 
import sys
from scipy.io import loadmat
import numpy as np
import xarray as xr
from math import ceil
import copy

#%%


class WPT2NdTHF():
    def extract_wnd_data(fp = None) :
        """
        Assumes the wind pressure files are stored locally, in a sub-directory named "Wind_records"

        Returns :
        Dictionary of the raw wind records.
        """ 
        wnd_data = {}

        # Find the files :
        if fp != None :
            cwd = fp
        else : 
            cwd = os.path.dirname(__file__)
        wind_records_path = os.path.join(cwd,"Wind_records")
        
        if not os.path.isdir(wind_records_path) : 
            print(f'Wind timeseries should be stored in the local subdirectory :\n {wind_records_path}')
            sys.exit(1)
        

        files_dir = os.listdir(wind_records_path)
        files = [f for f in files_dir if os.path.splitext(f)[1]== '.mat']

        if len(files) == 0 : 
            print('No wind records to process!')
            sys.exit(1)
            
        for file in files : 
            filepath = os.path.join(wind_records_path,file)        
            # Opening the file : 
            mat = loadmat(filepath)        

            wnd_data[file[:-4]] = mat
     
        return(wnd_data)


    def remesh_wnd_pressures(wnd_records,x_refine = 10,y_refine = 10):

        """
        Takes raw Tokyo Polytechnique University records and processes them to refine the meshing and normalize the coordinates.
        Accepts re-meshing equal to 1 (no refining). 

        Returns :
        Dictionnary of pre-meshing data (with an interpolation framing) & the remeshed data (without the interpolation framing).

        """

        record_surface_data = {}

        for record in wnd_records.keys():

        # Format wind record data : 
            wnd_coord_data = wnd_records[record]['Location_of_measured_points']
            model_geom = (wnd_records[record]['Building_breadth'][0][0],wnd_records[record]['Building_depth'][0][0],wnd_records[record]['Building_height'][0][0])

        # Split coordinates according to surface : 
            surface_data = {}
            surface_ids = np.unique(wnd_coord_data[3,:])
        
            for surface in surface_ids : 
                surface_data[surface] = wnd_coord_data[:,wnd_coord_data[3,:]==surface]
            
        # Translate & normalize surface data according to X and Y axies : 
            # Coordinate X = 0 corresponds to surface 1, left corner. 
            # Surfaces unfold from windward, windward right side, leeward back and windward left side
            X_correction = 0
            Y_dim = model_geom[2]
            for surface in surface_ids : 
                if surface %2 == 0 : 
                    # Even number
                    X_dim = model_geom[1]
                else : # Odd number
                    X_dim = model_geom[0]               
                    
                # Translate 
                surface_data[surface][0,:] = surface_data[surface][0,:]-np.array([X_correction]) 
                # Normalize 
                surface_data[surface][0,:] = surface_data[surface][0,:]/np.array([X_dim])
                surface_data[surface][1,:] = surface_data[surface][1,:]/np.array([Y_dim])
                
                # Update iteration variables : 
                X_correction += X_dim
                
        # Pressure taps remeshing (interpolation) : 
            for surface in surface_ids :
                
                # Build a cross-array with refined influence coefficients on each surface : 
                    # Current number of samples (note : +2 to reach the edges, as taps typically are not on the edges) : 
                nX = len(np.unique(surface_data[surface][0])) +2 
                X_coords = np.unique(surface_data[surface][0])
                X_coords = np.insert(X_coords,0,0)
                X_coords = np.append(X_coords,1)          
                
                nY = len(np.unique(surface_data[surface][1])) +2            
                Y_coords = np.unique(surface_data[surface][1])
                Y_coords = np.insert(Y_coords,0,0)
                Y_coords = np.append(Y_coords,1)
                           
                tap_ids = []
                influence_matrices = []
                for tap_data in np.ndenumerate(surface_data[surface][2]):
                    tap_id = int(tap_data[1].item())
                    tap_X = surface_data[surface][0,tap_data[0][0]]
                    tap_Y = surface_data[surface][1,tap_data[0][0]]
                    
                    # Create matrix for the coefficient(s) of influence : 
                    influence_matrix = np.zeros((nY,nX))
                    
                    # Taking (0,0) as the coordinate of origin (thus the extended array)
                    rel_x_id = np.where(X_coords==tap_X)[0][0] 
                    rel_y_id = np.where(Y_coords==tap_Y)[0][0]
                    
                    influence_matrix[rel_y_id,rel_x_id] = 1 
                    
                    # Ensure edge cases have influence coefficients (the wind pressure is not set to 0): 
                    # X axis
                    if (rel_x_id == X_coords.shape[0] -2) : # Recall X_coords and Y_coords are extended by +2 relative to initial tap array
                        influence_matrix[rel_y_id,rel_x_id+1] = 1 
                    if (rel_x_id == 1) : 
                        influence_matrix[rel_y_id,rel_x_id-1] = 1
                    # Y axis 
                    if (rel_y_id == Y_coords.shape[0]-2) : 
                        influence_matrix[rel_y_id+1,rel_x_id] = 1 
                    if (rel_y_id == 1) : 
                        influence_matrix[rel_y_id-1,rel_x_id] = 1   

                    # When reaching a corner :
                    if (rel_x_id == X_coords.shape[0]-2) and (rel_y_id == Y_coords.shape[0]-2) : # Max X and Max Y
                        influence_matrix[rel_y_id+1,rel_x_id+1] = 1

                    if (rel_x_id == X_coords.shape[0]-2) and (rel_y_id == 1) : # Max X and Min Y 
                        influence_matrix[rel_y_id-1,rel_x_id+1]=1
                        
                    if (rel_y_id == Y_coords.shape[0]-2) and (rel_x_id == 1) : # Min X and Max Y 
                        influence_matrix[rel_y_id+1,rel_x_id-1] = 1     
                        
                    if (rel_y_id == 1) and (rel_x_id == 1) : # Min X and Min Y 
                        influence_matrix[rel_y_id-1,rel_x_id-1] = 1     

                    # Move the numpy 2D array in a data array                      
                    # If surface 3 or 4, the X dimension is reversed in TPU models vs structural 3D models
                    # After the flip, the X dimension always match a consistent axis convention with regards to a 3D model.                    
                    if surface in [3.0,4.0] :         
                        influence_matrix = np.flip(influence_matrix,axis =1)

                    da = xr.DataArray(
                        influence_matrix,
                        coords = [Y_coords,X_coords],
                        dims = ['Y','X']
                        )
                    
                    # Store the results in lists : 
                    tap_ids.append(str(tap_id))
                    influence_matrices.append(da)

                # Concatenate all influence coefficient matrices as a new dimension on Xarray
                influence_arrays = xr.DataArray(None,coords = (X_coords,Y_coords),dims=('X','Y'))               
                influence_arrays = xr.concat(influence_matrices,dim=tap_ids)
                influence_arrays = influence_arrays.rename({'concat_dim':'tap_id'})
                surface_data[f"{record}-B-{int(surface)}"]  = influence_arrays             

                # Set this variable to start, even if there is no refinement to come:
                refined_inf_arr = influence_arrays

                # Increase the resolution of the influence coefficients :
                r_nX = (nX-2)*x_refine # Current number of taps, ignoring the 0 and 1 bounds, times refinement. 
                r_x_spacing = 1.0/r_nX # taps are equally spaced, with a half space before and after (thus spacing = lenght/[number of taps])
                refined_x = np.linspace(X_coords[0]+r_x_spacing/2,X_coords[-1]-r_x_spacing/2,r_nX)
                refined_x = np.insert(refined_x,0,0)
                refined_x = np.append(refined_x,1)
                              
                # Increase the resolution of the influence coefficients :
                r_nY = (nY-2)*y_refine # Current number of taps, ignoring the 0 and 1 bounds, times refinement. 
                r_y_spacing = 1.0/r_nY # taps are equally spaced, with a half space before and after (thus spacing = lenght/[number of taps])
                refined_y = np.linspace(Y_coords[0]+r_y_spacing/2,Y_coords[-1]-r_y_spacing/2,r_nY)
                refined_y = np.insert(refined_y,0,0)
                refined_y = np.append(refined_y,1)


                # Perform the interpolation
                refined_inf_arr = influence_arrays.interp(Y= refined_y,
                                                          X = refined_x)

                # Remove the interpolation framing :
                refined_inf_arr = refined_inf_arr.where(refined_inf_arr.X < 1, drop = True)
                refined_inf_arr = refined_inf_arr.where(refined_inf_arr.Y < 1, drop = True)
                refined_inf_arr = refined_inf_arr.where(refined_inf_arr.X > 0, drop = True)                
                refined_inf_arr = refined_inf_arr.where(refined_inf_arr.Y > 0, drop = True)
                
                # Store the interpolation result
                surface_data[f"{record}-R-{int(surface)}"]  = refined_inf_arr   

                record_surface_data[record] = surface_data        
        return record_surface_data 
        

    def pressures_to_nodes(record_name,record_surface_data,nodes):
        """
        Takes results from remesh_wnd_pressures() and assigns the pressure tap readings to exposed nodes (max X, max Y, min X, min Y).
        Assumes simple static in both X and Y (the centerline of a remeshed tap's bounding area is used to derive reduction coefficients). 


        Returns :
        Dictionary mapping the relative contribution of a tap to the surface pressure, according to a Node's tributary area.  
        """

        
        surface_node_tap = {}


        surface_data = record_surface_data[record_name]
     
        # Find surface numbers : 
        for key in surface_data.keys():
            if not isinstance(key,float):     
                continue

            surface_node_tap[key] = {}

            # Find corresponding nodes
                #Edge coordinates : 
            min_x = nodes[:,1].min()
            max_x = nodes[:,1].max()        
            
            min_y = nodes[:,2].min()
            max_y = nodes[:,2].max()
            
            max_z = nodes[:,3].max()
            surface_node_tap['h_build'] = max_z
            #surface_node_tap['length'] = max(max_x,max_y)

            
                # Windward face :
            if key == 1.0 : 
                exposed_nodes = nodes[nodes[:,2]==min_y]
                # Right side from windward face 
            elif key == 2.0 : 
                exposed_nodes = nodes[nodes[:,1]==max_x]  
                # Leeward face
            elif key == 3.0 : 
                exposed_nodes = nodes[nodes[:,2]==max_y]                   
                # Left side from windward face 
            elif key == 4.0 : 
                exposed_nodes = nodes[nodes[:,1]==min_x]           
                
            # Node layout : find story spacing and bay spacing (normalized to 1): 
            X_coords = np.unique(exposed_nodes[:,1])/max_x
            Y_coords = np.unique(exposed_nodes[:,2])/max_y
            Z_coords = np.unique(exposed_nodes[:,3])/max_z
            
            delta_Xs = np.diff(X_coords)
            delta_Ys = np.diff(Y_coords)
            delta_Zs = np.diff(Z_coords)

            # Retrieve surface pressure coefficients and tributary area per data point : 
            pressure_data_path = record_name+'-R-'+str(int(key))
            pressure_data = surface_data[pressure_data_path]


            # Set a grid with intermediate and edge points : 
            x_pressures = pressure_data.coords['X'].to_numpy()
            dx_pressures = np.diff(x_pressures)
            dx_pressures = np.insert(dx_pressures,0,0)
            x_pressure_edges = np.cumsum(dx_pressures)
            x_pressure_edges = np.append(x_pressure_edges,1)

            
            y_pressures = pressure_data.coords['Y'].to_numpy()
            dy_pressures = np.diff(y_pressures)
            dy_pressures = np.insert(dy_pressures,0,0)
            y_pressure_edges = np.cumsum(dy_pressures)
            y_pressure_edges = np.append(y_pressure_edges,1)
                        
            # Assign coefficients for each node : 
            for node in exposed_nodes : 
                        
                node_id = int(node[0].item())

                node_X = node[1]/max_x       
                node_Y = node[2]/max_y
                node_Z = node[3]/max_z     
                
                
                node_X_index = np.where(X_coords == node_X)[0][0]
                node_Y_index = np.where(Y_coords == node_Y)[0][0]
                node_Z_index = np.where(Z_coords == node_Z)[0][0]
                
                tributary_area_rect = np.zeros([3,3])


                for i, pair in enumerate(zip((delta_Zs,delta_Ys,delta_Xs),(node_Z_index,node_Y_index,node_X_index),(node_Z,node_Y,node_X))) : # 3 dimensions, with z axis as first
                    # Skip dimension if out of plane     
                    if len(pair[0]) == 0 : 
                        continue
                    
                    # Find forward node (if available) : 
                    if pair[1] == len(pair[0]+1) : 
                        f_delta = np.nan # Edge
                    else : 
                        f_delta = pair[0][pair[1]]
                    
                    # Find backward node (if available) : 
                    if pair[1] == 0 : 
                        b_delta = np.nan 
                    else : 
                        b_delta = pair[0][pair[1]-1]      
                
                    # Building a rectangular mapping of extents for the tributary area :
                    tributary_area_rect[i,0] = -b_delta+pair[2]
                    tributary_area_rect[i,1] = f_delta+pair[2]
                    tributary_area_rect[i,2] = pair[2]

                # Remove the empty companion row (X or Y axis which is not relevant)
                tributary_area_rect = tributary_area_rect[np.where(~(tributary_area_rect==0).all(axis=1))]
                
                # Node tributary area bounding box :                        
                b_box = tributary_area_rect[:2,:2]

                b_box[0,np.isnan(b_box[0,:])] = tributary_area_rect[0,2]
                b_box[1,np.isnan(b_box[1,:])] = tributary_area_rect[1,2]

                # Assign coefficients based on distance along dx (or dy depending on the surface)
                    # Cut-out irrelevant data points (beyond influence line)

                    # X bounds & midpoints
                x_edges = x_pressure_edges[(x_pressure_edges> b_box[1,0]+1e-5) & (x_pressure_edges< b_box[1,1]-1e-5)]
                x_edges = np.append(x_edges,b_box[1,1])
                x_edges = np.insert(x_edges,0,b_box[1,0])
                x_mpts = x_edges[:-1]+np.diff(x_edges)/2

                    # Y bounds & midpoints
                y_edges = y_pressure_edges[(y_pressure_edges> b_box[0,0]+1e-5) & (y_pressure_edges< b_box[0,1]-1e-5)]
                y_edges = np.append(y_edges,b_box[0,1])
                y_edges = np.insert(y_edges,0,b_box[0,0])
                y_mpts = y_edges[:-1]+np.diff(y_edges)/2
                    # Indivdual tap tributary areas / Total tributary area
                Ai = np.diff(x_edges)[:,np.newaxis].T * np.diff(y_edges)[:,np.newaxis]
                rel_Ai = Ai/((b_box[0,1]-b_box[0,0])*(b_box[1,1]-b_box[1,0]))

                if key in [2.0 ,4.0]:
                    meter_x = max_y
                else :
                    meter_x = max_x
                A_bbox = ((b_box[0,1]-b_box[0,0])*meter_x)*((b_box[1,1]-b_box[1,0])*max_z)

   
                rel_x_lenght = np.diff(x_edges)/(b_box[1,1]-b_box[1,0])
                rel_y_lenght = np.diff(y_edges)/(b_box[0,1]-b_box[0,0])


                    # Find delta_xis and delta_yis (center of pressure reading to node cartesian distance) 
                delta_xis = x_mpts - tributary_area_rect[1,2]
                delta_yis = y_mpts - tributary_area_rect[0,2]

                    # Find dx & dy (cartesian distance from node going from 1 to 0 in influence - where 0 is at the edge of the tributary box)
                dx_backward = tributary_area_rect[1,2] - tributary_area_rect[1,0] 
                dx_forward = tributary_area_rect[1,1] - tributary_area_rect[1,2]

                dy_lower = tributary_area_rect[0,2] - tributary_area_rect[0,0] 
                dy_upper = tributary_area_rect[0,1] - tributary_area_rect[0,2]

                    # Apply influence coefficients such as : (1-abs(delta_xis)/dx)*value at each grid
                        # Define the modifier coefficients :

                if dx_forward != 0 :
                        # Find positive delta_xis :
                    p_delta_xis = np.where(delta_xis>= 0,delta_xis, dx_forward)
                    p_x_modifier = 1-np.absolute(p_delta_xis)/dx_forward

                else :
                    p_x_modifier = np.zeros_like(delta_xis)


                if dx_backward != 0 :
                        # Find negative delta_xis :
                    n_delta_xis = np.where(delta_xis< 0,delta_xis, dx_backward)
                    n_x_modifier = 1-np.absolute(n_delta_xis)/dx_backward
                else :
                    n_x_modifier = np.zeros_like(delta_xis)


                x_modifier = np.where(p_x_modifier != 0,p_x_modifier, n_x_modifier)


                if dy_lower != 0 :
                        # Find negative delta_yis :
                    n_delta_yis = np.where(delta_yis< 0,delta_yis, dy_lower)
                    n_y_modifier = 1-np.absolute(n_delta_yis)/dy_lower
                else :
                    n_y_modifier = np.zeros_like(delta_yis)

                if dy_upper != 0 :
                        # Find positive delta_yis :
                    p_delta_yis = np.where(delta_yis>= 0,delta_yis, dy_upper)
                    p_y_modifier = 1-np.absolute(p_delta_yis)/dy_upper

                else :
                    p_y_modifier = np.zeros_like(delta_yis)

                y_modifier = np.where(p_y_modifier != 0,p_y_modifier, n_y_modifier)

                # Relocate the modifiers according to the full X and Y dimensions : 
                # Index matching the X dimension :
                    # Use tolerances on float comparison : find when does the first overlap occurs :
                overlaps_x = x_pressures[(np.abs(x_mpts[:,None] - x_pressures) < 1e-5).any(0)]
                first_pressure_x_overlap_index = np.argwhere(x_pressures == overlaps_x[0]).item()

                overlaps_x_mpts = x_mpts[(np.abs(x_pressures[:,None] - x_mpts) < 1e-5).any(0)]
                first_x_mpts_overlap_index = np.argwhere(x_mpts == overlaps_x_mpts[0]).item()

                x_modifier_reindexed = np.zeros_like(x_pressures)
                x_modifier_reindexed[first_pressure_x_overlap_index:first_pressure_x_overlap_index+len(overlaps_x)] = x_modifier[first_x_mpts_overlap_index:first_x_mpts_overlap_index+len(overlaps_x)]

                    # Note : the above proceedure only checks for "matching" midpoints (i.e. excludes clipped edges)
                    # The below proceedure ensures clipped edges are found and properly included in the reindexed modifier.
                    # Find indexes of non-zero in x_modifier_reindexed
                nz_ind_x_modif_r = np.nonzero(x_modifier_reindexed)[0]

                if len(nz_ind_x_modif_r) != 0 : 
                    first_nz_x_modif_r = nz_ind_x_modif_r[0]
                    last_nz_x_modif_r = nz_ind_x_modif_r[-1]

                    if x_modifier_reindexed[first_nz_x_modif_r] != x_modifier[0] :
                    # The x_modifier first value is missing (i.e. is not on a matching X coord)
                        x_modifier_reindexed[first_nz_x_modif_r-1] = x_modifier[0]

                    if x_modifier_reindexed[last_nz_x_modif_r] != x_modifier[-1] :
                    # The x_modifier last value is missing (i.e. is not on a matching X coord)
                        x_modifier_reindexed[last_nz_x_modif_r+1] = x_modifier[-1]

                # Final check :
                if len(np.nonzero(x_modifier_reindexed)[0]) != len(np.nonzero(x_modifier)[0]) :
                    print('Need to check that X')

                # Index matching the Y dimension :
                    # Use tolerances on float comparison : find when does the first overlap occurs :
                overlaps_y = y_pressures[(np.abs(y_mpts[:,None] - y_pressures) < 1e-5).any(0)]
                first_pressure_y_overlap_index = np.argwhere(y_pressures == overlaps_y[0]).item()

                overlaps_y_mpts = y_mpts[(np.abs(y_pressures[:,None] - y_mpts) < 1e-5).any(0)]
                first_y_mpts_overlap_index = np.argwhere(y_mpts == overlaps_y_mpts[0]).item()

                y_modifier_reindexed = np.zeros_like(y_pressures)
                y_modifier_reindexed[first_pressure_y_overlap_index:first_pressure_y_overlap_index+len(overlaps_y)] = y_modifier[first_y_mpts_overlap_index:first_y_mpts_overlap_index+len(overlaps_y)]
            
                    # Note : the above proceedure only checks for "matching" midpoints (i.e. excludes clipped edges)
                    # The below proceedure ensures clipped edges are found and properly included in the reindexed modifier.
                    # Find indexes of non-zero in x_modifier_reindexed
                nz_ind_y_modif_r = np.nonzero(y_modifier_reindexed)[0]

                if len(nz_ind_y_modif_r) != 0 :
                    first_nz_y_modif_r = nz_ind_y_modif_r[0]
                    last_nz_y_modif_r = nz_ind_y_modif_r[-1]

                    if y_modifier_reindexed[first_nz_y_modif_r] != y_modifier[0] :
                    # The y_modifier first value is missing (i.e. is not on a matching Y coord)
                        y_modifier_reindexed[first_nz_y_modif_r-1] = y_modifier[0]

                    if y_modifier_reindexed[last_nz_y_modif_r] != y_modifier[-1] :
                    # The y_modifier last value is missing (i.e. is not on a matching Y coord)
                        y_modifier_reindexed[last_nz_y_modif_r+1] = y_modifier[-1]

                # Final check :
                if len(np.nonzero(y_modifier_reindexed)[0]) != len(np.nonzero(y_modifier)[0]) :
                    print('Need to check that Y')


                # Set the modifiers in xarrays :
                arr_x_modifier = xr.DataArray(x_modifier_reindexed,
                                            dims = ['X'],
                                            coords = [pressure_data['X'].values])
                arr_y_modifier = xr.DataArray(y_modifier_reindexed,
                                            dims = ['Y'],
                                            coords = [pressure_data['Y'].values])                
                
                # Apply the modifying coefficients                 
                Node_pcoeffs = pressure_data*arr_x_modifier*arr_y_modifier


                # Adjust for relative tributary area (some refined taps get incomplete tributary areas) :
                reindexed_rel_x_modifier = np.zeros_like(x_pressures)
                    # Check if there are x modifiers applicable here 
                nz_rel_x_area_mod = np.nonzero(x_modifier_reindexed)[0]                
                if len(nz_rel_x_area_mod) != 0 : 
                    reindexed_rel_x_modifier[nz_rel_x_area_mod] = rel_x_lenght

                reindexed_rel_y_modifier = np.zeros_like(y_pressures)
                    # Check if there are y modifiers applicable here 
                nz_rel_y_area_mod = np.nonzero(y_modifier_reindexed)[0]                
                if len(nz_rel_y_area_mod) != 0 :
                    reindexed_rel_y_modifier[nz_rel_y_area_mod] = rel_y_lenght

                # Set the relative area modifiers in xarrays :
                arr_rel_AX_modifier = xr.DataArray(reindexed_rel_x_modifier,
                                            dims = ['X'],
                                            coords = [pressure_data['X'].values])
                arr_rel_AY_modifier = xr.DataArray(reindexed_rel_y_modifier,
                                            dims = ['Y'],
                                            coords = [pressure_data['Y'].values]) 
                # Apply the relative area modifying coefficients 
                Node_pcoeffs =Node_pcoeffs*arr_rel_AX_modifier*arr_rel_AY_modifier
               
                # Per node, find the composite pressure reading :
                Node_tap_sum = Node_pcoeffs.sum(dim = ['X','Y'])
                
                # Summarize all node pressure taps :
                surface_node_tap[key][node_id] = dict(filter(lambda kv: kv[1] != 0 ,zip(Node_tap_sum['tap_id'].values,Node_tap_sum.data)))
                # Add details on the corresponding area used in the pressure tap meshing :                
                surface_node_tap[key][node_id]['area'] = A_bbox

                        

        return surface_node_tap

    def create_scaled_wind_nodal_forces(record_name,wnd_data,node_mapping,V_3sec, exposure_class = 'C') : 
        """
        For each node : 
            - Create a new recording from the TPU wind pressure coefficients by scaling and summing tap contributions
            - Scale the resulting time history recording according to tributary area, laws of similarity and atmospheric boundary layer 
            - Convert time history sign conventions to global coordinates (X/Y axies for surfaces 2 and 3 are modified).
            - Add a 20 seconds ramp up (avoid impact effects on wind simulation)
            
            wnd_data : dictionnary of recording loaded from "extract_wnd_data()"
            node_mapping : dictionnary of pressure taps contributing to individual nodes (taken from pressures_to_nodes) 
            
            Outputs : dictionnary grouping all time histories to their respective nodes on a surface
        """    
        
        pressure_recordings = wnd_data[record_name]['Wind_pressure_coefficients']
        node_data = node_mapping[record_name] 
        

        # Model scaling : 
            # Geometric scale
        wnd_model_height = wnd_data[record_name]['Building_height'][0].item()
        structural_model_height = node_mapping[record_name]['h_build']
        
        lambda_l = wnd_model_height/structural_model_height
        
            # Velocity scale         
        wnd_model_speed = float(wnd_data[record_name]['Uh_AverageWindSpeed'].item())    # meter per second
        
            # ASCE 7 - 22 : Wind scaling parameters according to exposure category :    
        ASCE_pwr_lw = {
            'B' : {                  # matches a z0 of 0.3 m (sub-urban/urban)
                'zg'        : 1000,  # Gradient height
                'alpha_bar' : 1/4.5, # Mean-hourly power law exponent 
                'b_bar'     : 0.47,  # Mean-hourly wind factor
                'alpha_hat' : 1/7.5, # Exposure power law exponent
                'b_hat'     : 0.84   # Exposure wind factor
                },
            
            'C' : {                  # matches a z0 of 0.03 m (open field such as airports)
                'zg'        : 750,   # Gradient height
                'alpha_bar' : 1/6.4, # Mean-hourly power law exponent 
                'b_bar'     : 0.66,  # Mean-hourly wind factor. Roughly equates to 1/1.525 (typical Durst Curve)
                'alpha_hat' : 1/9.8, # Exposure power law exponent
                'b_hat'     : 1.00   # Exposure wind factor
                }, 
                
            'D' : {                  # matches a z0 of 0.005 m (ocean / water surfaces)
               'zg'        : 590,    # Gradient height
               'alpha_bar' : 1/8.0,  # Mean-hourly power law exponent 
               'b_bar'     : 0.78,   # Mean-hourly wind factor
               'alpha_hat' : 1/11.5, # Exposure power law exponent
               'b_hat'     : 1.09    # Exposure wind factor
                } 
            }    
        
        
            # Notes : 
            # Incoming wind speed is assumed to be 3s gust wind speed (typically the provided value for hurricane wind speeds/ASCE maps)
            # The typical wind speed is provided for open terrains (exposure C as the baseline). 
            # The ASCE empirical power law curves (see Yeo et al 2023 on ASCE 7 - 22) use Ug as the common parameter between site exposures
        
            # Step 1) Convert basic 3s gust wind speed to (1) hourly wind speed at (2) gradient level : 
        Ug = ASCE_pwr_lw['C']['b_bar']*V_3sec*(ASCE_pwr_lw['C']['zg']/10)**(ASCE_pwr_lw['C']['alpha_bar'])
                
            # Step 2) Convert gradient wind speed to building height with appropriate exposure category : 
        U_build_top = ASCE_pwr_lw[exposure_class]['b_hat']*Ug*(structural_model_height/ASCE_pwr_lw[exposure_class]['zg'])**(ASCE_pwr_lw[exposure_class]['alpha_hat'])
                        
        lambda_v = wnd_model_speed/U_build_top
             
            # Time scale
        sample_dt = (wnd_data[record_name]['Sample_frequency'][0].item())**(-1) # seconds      
          
        lambda_t = lambda_l/lambda_v
        scaled_dt = sample_dt/lambda_t # true output timesteps, in seconds. 
        scaled_record_duration = scaled_dt*wnd_data[record_name]['Sample_period'][0].item()*wnd_data[record_name]['Sample_frequency'][0].item()/60 # in minutes (only to assist understanding how long the resulting record becomes)

        nodal_th_at_surface = {}
        
        for surface in node_data :
            # Skip this variable (not a surface)
            if surface == 'h_build' : 
                continue
            
            # Individual pressure gridpoints all have the following tributary area for this surface : 
            nodal_th_at_surface[surface] = {}
        
            for label in node_data[surface].keys() :

                # Get the full bounding box area (while also removing it from the list of taps)  :
                area  = node_data[surface][label].pop('area',None)                
                arr = np.array(list(node_data[surface][label].items()))


                tap_indexes = arr[:,0] .astype(int)  -1   # Zero indexed tap ids      
                factors = arr[:,1].astype(float)   # tap scaling factors

                # Select relevant time-history data : 
                th_data = pressure_recordings[:,tap_indexes]
        
                # Scale according to factors : 
                node_scaled_th = th_data*factors 
                
                # Add each recording over time : 
                node_th = node_scaled_th.sum(axis=1)

                # Pressures to forces : 
                    # Scale according to Bernoulli (1/2*rho*v^2)                
                node_f_th = 1/2*1.225*(U_build_top**2)*node_th*float(area)
                
                    # Correct sign conventions from local taps to global
                if surface in [2.0,3.0] : 
                    node_f_th = node_f_th*(-1)
                
                # Add ramps (before and after)
                ramp_duration = 200 # seconds
                steps = ceil(ramp_duration/scaled_dt+1)    # +1 enforces the last step to be equal to the first reading in the time history        
                    # Create a ramp-up in the record (avoid "impact" effects)
                f0 = 0
                f_start = node_f_th[0]

                ramp_start = np.linspace(f0,f_start,steps)
                ramped_node_f_th = np.concatenate([ramp_start[:-1],node_f_th]) # do not replicate the first reading
                
                    # Create a ramp down in the record
                f_end = node_f_th[-1]
                ramp_end = np.linspace(f_end,f0,steps)
                ramped_node_f_th = np.concatenate([ramped_node_f_th,ramp_end[1:]]) # do not replicate the final reading

                
                    # Add a free vibration at the end of the load history (f = 0)
                free_vibration_time = 300 # seconds
                free_vibration_steps = ceil(free_vibration_time/scaled_dt)
                free_vibration_history = np.linspace(0,0,free_vibration_steps)    
                ramped_node_f_th = np.concatenate([ramped_node_f_th,free_vibration_history])
                    # Unimplemented alternative :
                    # The OpenSees transient analysis script uses a "path" timeseries. If t_analysis > force time time history, free vibration occurs (f = 0.0)

                # Export nodal force time-history :             
                nodal_th_at_surface[surface][label] = ramped_node_f_th ### in Newtons
                
        nodal_th_at_surface['scaled_dt'] = scaled_dt ### in seconds
        nodal_th_at_surface['record_duration'] = scaled_record_duration ### in minutes
        
        return nodal_th_at_surface


    def create_stick_model_wnd_TH(floor_diaphragm_data,V_node_geometry,Node_coord,record_TH_data) : 
        
        # Get the diaphragm master nodes (typically coincides with the Center of rigidity)

        m_nodes = [x[1] for x in floor_diaphragm_data]
        m_node_coords = V_node_geometry[np.isin(V_node_geometry[:,0],m_nodes),:]   
        
        condensed_wnd_loads = {}
        final_th_data = {}    
        for surface in record_TH_data :

            if surface in ['scaled_dt','record_duration'] :
                final_th_data[surface] = record_TH_data[surface]
                continue
            
            condensed_wnd_loads[surface] = {}        
            
            # Get nodes/surface 
            surface_nodes = list(record_TH_data[surface].keys())

            # Get node coords
            relevant_node_coords = Node_coord[np.isin(Node_coord[:,0],surface_nodes),:]
                # Identify the dimension which is not relevant for the surface : 
            drop_dims = (relevant_node_coords == relevant_node_coords[0,:]).all(0)            
                # Get rid of the non relevant dimensions
                # Resultant format : node id, X or Y coord, Z coord
            relevant_node_coords = relevant_node_coords[:,~drop_dims]
            masked_m_node_coords = m_node_coords[:,~drop_dims]

            # Subset the nodes per floor :
            for floor in masked_m_node_coords : 
                # Master node
                z_coord = floor[-1]
                node_id = floor[0]
                xi = floor[1]
                
                # Slave nodes 
                floor_node_data = relevant_node_coords[relevant_node_coords[:,-1]==z_coord,:]
                floor_nodes = floor_node_data[:,0]
                
                # Distance between master node and slave node :
                if surface in [2.0,4.0] : 
                    floor_node_data[:,1] = xi - floor_node_data[:,1]
                else :     
                    floor_node_data[:,1] = floor_node_data[:,1]-xi         
                
                # Get force TH per floor & Mz TH per floor         
                lst_th = [record_TH_data[surface][x] for x in floor_nodes] 
                base_th = np.stack(lst_th,axis=1)
                
                # Forces on master node :
                F_th = np.sum(base_th,axis=1)
                # Moment on master node : 
                base_moment_th = base_th*floor_node_data[:,1].T
                Mz_th = np.sum(base_moment_th,axis=1)
            
                condensed_wnd_loads[surface][node_id.item()] = np.stack([F_th,Mz_th],axis =1) 
            
        # Combine surfaces (1+3), (2+4) :
        for surface in condensed_wnd_loads.keys(): 
            ax_id = 1
            if surface in [1.0,3.0] : 
                ax_id = 0

            d = copy.deepcopy(condensed_wnd_loads[surface])
            for k,v in d.items() :
                if k in final_th_data.keys() :
                    arr = np.zeros((v.shape[0],v.shape[1]+1))
                    arr[:,ax_id] = v[:,0]
                    arr[:,-1] = v[:,1]
                    final_th_data[k]+=arr
                else :
                    arr = np.zeros((v.shape[0],v.shape[1]+1))
                    arr[:,ax_id] = v[:,0]
                    arr[:,-1] = v[:,1]
                    final_th_data[k] = arr
        return final_th_data

    def create_unscaled_wind_nodal_forces(record_name,wnd_data,node_mapping, ramps = False, model_sized_forces = True) : 
        """
        For each node : 
            - Create a new recording from the TPU wind pressure coefficients by summing tap contributions
            - Scale the resulting time history recording according to tributary area 
            - Convert time history sign conventions to global coordinates (X/Y axies for surfaces 2 and 3 are modified).
            - If model_sized_forces == True : wind forces are relative to model scale. 

            
            wnd_data : dictionnary of recording loaded from "extract_wnd_data()"
            node_mapping : dictionnary of pressure taps contributing to individual nodes (taken from pressures_to_nodes) 
            
            Outputs : dictionnary grouping all time histories to their respective nodes on a surface
        """    
        wnd_model_speed = float(wnd_data[record_name]['Uh_AverageWindSpeed'].item())    # meter per second
        
        pressure_recordings = wnd_data[record_name]['Wind_pressure_coefficients']
        node_data = node_mapping[record_name] 
           

        # Geometric scale
        wnd_model_height = wnd_data[record_name]['Building_height'][0].item()
        structural_model_height = node_mapping[record_name]['h_build']
        lambda_l = wnd_model_height/structural_model_height


        nodal_th_at_surface = {}
        
        for surface in node_data :
            # Skip this variable (not a surface)
            if surface == 'h_build' : 
                continue
                        
            nodal_th_at_surface[surface] = {}
        
            for label in node_data[surface].keys() :

                # Get the full bounding box area (while also removing it from the list of taps)  :
                area  = node_data[surface][label].pop('area',None)                
                arr = np.array(list(node_data[surface][label].items()))

                tap_indexes = arr[:,0] .astype(int)  -1   # Zero indexed tap ids      
                factors = arr[:,1].astype(float)   # tap scaling factors

                # Select relevant time-history data : 
                th_data = pressure_recordings[:,tap_indexes]
        
                # Scale according to factors : 
                node_scaled_th = th_data*factors 
                
                # Add each recording over time : 
                node_th = node_scaled_th.sum(axis=1)

                # Pressures to forces : 
                    # Scale according to Bernoulli (1/2*rho*v^2)
                if model_sized_forces == True :
                    node_f_th = 1/2*1.225*(wnd_model_speed**2)*node_th*float(area)*(lambda_l**2)  # *area/lambda_l**2 yields forces at model scale, aknowledging relative tributary areas. 
                else :
                    node_f_th = 1/2*1.225*(wnd_model_speed**2)*node_th*float(area)
                    
                    # Correct sign conventions from local taps to global
                if surface in [2.0,3.0] : 
                    node_f_th = node_f_th*(-1)
                
                if ramps : 
                # Add ramps (before and after)
                    ramp_duration = 200 # seconds
                    steps = ceil(ramp_duration/scaled_dt+1)    # +1 enforces the last step to be equal to the first reading in the time history        
                    # Create a ramp-up in the record (avoid "impact" effects)
                    f0 = 0
                    f_start = node_f_th[0]

                    ramp_start = np.linspace(f0,f_start,steps)
                    ramped_node_f_th = np.concatenate([ramp_start[:-1],node_f_th]) # do not replicate the first reading
                
                    # Create a ramp down in the record
                    f_end = node_f_th[-1]
                    ramp_end = np.linspace(f_end,f0,steps)
                    ramped_node_f_th = np.concatenate([ramped_node_f_th,ramp_end[1:]]) # do not replicate the final reading

                
                    # Add a free vibration at the end of the load history (f = 0)
                    free_vibration_time = 300 # seconds
                    free_vibration_steps = ceil(free_vibration_time/scaled_dt)
                    free_vibration_history = np.linspace(0,0,free_vibration_steps)    
                    ramped_node_f_th = np.concatenate([ramped_node_f_th,free_vibration_history])
                    # Unimplemented alternative :
                    # The OpenSees transient analysis script uses a "path" timeseries. If t_analysis > force time time history, free vibration occurs (f = 0.0)
                    node_f_th = ramped_node_f_th

                # Export nodal force time-history :             
                nodal_th_at_surface[surface][label] = node_f_th ### in Newtons
                        
        return nodal_th_at_surface


    def scale_V3sec_to_VH(H_real,V_3sec,exposure_class = 'C'):
        # Model scaling : 

        structural_model_height = H_real
            # ASCE 7 - 22 : Wind scaling parameters according to exposure category :    
        ASCE_pwr_lw = {
            'B' : {                  # matches a z0 of 0.3 m (sub-urban/urban)
                'zg'        : 1000,  # Gradient height
                'alpha_bar' : 1/4.5, # Mean-hourly power law exponent 
                'b_bar'     : 0.47,  # Mean-hourly wind factor
                'alpha_hat' : 1/7.5, # Exposure power law exponent
                'b_hat'     : 0.84   # Exposure wind factor
                },
            
            'C' : {                  # matches a z0 of 0.03 m (open field such as airports)
                'zg'        : 750,   # Gradient height
                'alpha_bar' : 1/6.4, # Mean-hourly power law exponent 
                'b_bar'     : 0.66,  # Mean-hourly wind factor. Roughly equates to 1/1.525 (typical Durst Curve)
                'alpha_hat' : 1/9.8, # Exposure power law exponent
                'b_hat'     : 1.00   # Exposure wind factor
                }, 
                
            'D' : {                  # matches a z0 of 0.005 m (ocean / water surfaces)
               'zg'        : 590,    # Gradient height
               'alpha_bar' : 1/8.0,  # Mean-hourly power law exponent 
               'b_bar'     : 0.78,   # Mean-hourly wind factor
               'alpha_hat' : 1/11.5, # Exposure power law exponent
               'b_hat'     : 1.09    # Exposure wind factor
                } 
            }    
        
        
            # Notes : 
            # Incoming wind speed is assumed to be 3s gust wind speed (typically the provided value for hurricane wind speeds/ASCE maps)
            # The typical wind speed is provided for open terrains (exposure C as the baseline). 
            # The ASCE empirical power law curves (see Yeo et al 2023 on ASCE 7 - 22) use Ug as the common parameter between site exposures
        
            # Step 1) Convert basic 3s gust wind speed to (1) hourly wind speed at (2) gradient level : 
        Ug = ASCE_pwr_lw['C']['b_bar']*V_3sec*(ASCE_pwr_lw['C']['zg']/10)**(ASCE_pwr_lw['C']['alpha_bar'])
                
            # Step 2) Convert gradient wind speed to building height with appropriate exposure category : 
        U_build_top = ASCE_pwr_lw[exposure_class]['b_hat']*Ug*(structural_model_height/ASCE_pwr_lw[exposure_class]['zg'])**(ASCE_pwr_lw[exposure_class]['alpha_hat'])
                        
        
        return U_build_top
