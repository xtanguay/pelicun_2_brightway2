# -*- coding: utf-8 -*-
"""
Created on Tue Aug 20 14:09:13 2024

@author: xtang
"""

import openseespy.opensees as ops
import numpy as np
from collections import defaultdict 

class Elements():
    def create_generic_element_data(Nodes) : 
        
        """
        Identifies a local xz plane vector with regards to the global axies (XYZ) for a regular building
        Marks i-j node pairs for individual elements 
        """
        
        ## Assumes elements are defined from 1 to roof (thus column-wise). Beam elements are then handled in Y axis, followed by X axis
         
        # Extract floor heights : 
        flr_lvl = np.unique(Nodes[:,3])
        # Split nodes into a list of array according to corresponding floor :
        floor_nodes =  list(Nodes[Nodes[:,3]==i,0] for i in flr_lvl[:])
        
        
        # Plan geometry : 
        X_rows = np.unique(Nodes[:,1]).shape[0]
        Y_rows= np.unique(Nodes[:,2]).shape[0]
         
        # Column element count : 
        col_count = floor_nodes[0].shape[0]*(flr_lvl.shape[0]-1)
        
        # Y axis total beam count : 
        Y_beam_count = X_rows*(Y_rows-1)*(len(flr_lvl)-1)   
         
        # Initialize some variables
        vecxz = []
        elem_joints = []
        generic_elem_type = defaultdict(list)
        
        col_ID = 1
        Y_beam_ID = col_count+1
        X_beam_ID = col_count+Y_beam_count+1
           
        for lvl, floor in enumerate(floor_nodes[1:]) : # Skip the ground level
         
        # Define columns :
            # Note : will set all columns with local +y axis in the direction of -Xg        
        
            for key,val in enumerate(floor) :  #  Each node corresponds to a column
                # Eletag     : Transformtag (assumes 1 transform per element)    
                # Xg, Yg, Zg : defines a vector matching the local XZ plane of the element, according to the global coordinates of the model
                            # Eletag, Xg, Yg, Zg
                vecxz.append([col_ID,  0, -1,  0])
                
                # Create a mapping of these elements with their associated nodes :
                Node_i = int(floor_nodes[lvl][key])
                Node_j = int(val)
                
                elem_joints.append([col_ID,Node_i,Node_j])
                generic_elem_type[col_ID] = 'Column'

                col_ID+=1
        
         
        # Define Y axis beams : 
            for m in range(0,X_rows) : 
                for n in range(0,Y_rows-1) : 
                    # Eletag     : Transformtag (assumes 1 transform per element)
                    # Xg, Yg, Zg : defines a vector matching the local XZ plane of the element, according to the global coordinates of the model
                                # Eletag, Xg, Yg, Zg
                    vecxz.append([Y_beam_ID,  0,  0,  -1])
                    
                    # Create a mapping of these elements with their associated nodes : 
                    Node_i = int(floor[m*Y_rows + n].item())
                    Node_j = int(floor[m*Y_rows + n+1].item())
                    
                    elem_joints.append([Y_beam_ID,Node_i,Node_j])
                    generic_elem_type[Y_beam_ID] = 'Beam-Y'
            
                    Y_beam_ID += 1 
                    
            
        # Define X axis beams : 
            for m in range(0,Y_rows) : 
                for n in range(0,X_rows-1) : 
                    # Eletag     : Transformtag (assumes 1 transform per element)
                    # Xg, Yg, Zg : defines a vector matching the local XZ plane of the element, according to the global coordinates of the model
                                # Eletag, Xg, Yg, Zg
                    vecxz.append([X_beam_ID,  0,  -1,  0])
                             
                    # Create a mapping of these elements with their associated nodes : 
                    Node_i = int(floor[n*Y_rows +m].item())
                    Node_j = int(floor[(n+1)*Y_rows+m].item())
                   
                    elem_joints.append([X_beam_ID,Node_i,Node_j])              
                    generic_elem_type[X_beam_ID] = 'Beam-X'
                    
                    X_beam_ID += 1 
         
        
        # Convert to numpy array : 
        vecxz = np.array(vecxz)
        vecxz = vecxz[vecxz[:,0].argsort()]
        
        elem_joints = np.array(elem_joints)
        elem_joints = elem_joints[elem_joints[:,0].argsort()]
        
        return vecxz, elem_joints, generic_elem_type


    def transforms(vecxz_array) :
        
        # type      : PDelta transformation from local coordinates to global coordinates
        # transfTag : Unique identifier
        # vec xz    : X,Y and Z components used to define the X-Z plane of the local coordinate system. Y axis is taken as cross-product of vec xz with the x-axis 
        
        ### Reminder : the local X axis is defined by an element's node i -> j. The vec XZ is passing in the local plane XZ, built in reference to the true global axis plane.
        
        for row_id in range(vecxz_array.shape[0]) : 
            trnsf_data = vecxz_array[row_id]            
                    #          type,    transfTag,       vec xz   
            ops.geomTransf('PDelta',trnsf_data[0].item(),trnsf_data[1].item(),trnsf_data[2].item(),trnsf_data[3].item())
       
        return

    def create_elements(vecxz,elem_joints,generic_elem_type):
        
        # Check if there is enough information regarding geometric transformations :
        if vecxz.shape[0] != elem_joints.shape[0] :
            print('Geometric transformations do no match the number of elements')
            return 
        
        # Sort arrays by element IDs
        vecxz =  vecxz[vecxz[:,0].argsort()]
        elem_joints = elem_joints[elem_joints[:,0].argsort()]   

        
        # Find how many elements will be created :
        ele_count = elem_joints.shape[0]
        
        # Start creating elements, according to generic data : 
        for ele in range(ele_count) : 
            
            if vecxz[ele,0] != elem_joints[ele,0] :
                print('Failed!')
                print(vecxz[ele,0],elem_joints[ele,0])
        

            ele_tag = elem_joints[ele,0].item()
            trnsf_tag = vecxz[ele,0].item()
            Node_i = elem_joints[ele,1].item()
            Node_j = elem_joints[ele,2].item()
      
            # Add a check if this user-defined or within an array
            ele_type = generic_elem_type[ele+1] #careful to 0 indexed iteration
        
            # Define columns : 
            if ele_type == 'Column' : 
                ops.element('elasticBeamColumn', ele_tag, Node_i, Node_j, 1, 1, 1, 1, 1, 1, trnsf_tag)
                pass
            # Define beams-Y axis: 
            elif ele_type == 'Beam-Y' : 

                ops.element('elasticBeamColumn', ele_tag, Node_i, Node_j, 1, 1, 1, 1, 1, 1, trnsf_tag)

            # Define beams-X axis : 
            elif ele_type == 'Beam-X' : 
                ops.element('elasticBeamColumn', ele_tag, Node_i, Node_j, 1, 1, 1, 1, 1, 1, trnsf_tag)    
        
        
        
    
    
    
    
    
    
    
