# -*- coding: utf-8 -*-
"""
Created on Mon Aug 12 09:36:49 2024

@author: xtang
"""

import openseespy.opensees as ops
import numpy as np


# REMOVE ONCE READY 
ops.wipe()
class Geometry() :
    def create_generic_geom_data(numBayX,numBayY,num_floors,BaywidthX = 5,BaywidthY = 5, Floorheight = 3,UniqueFirstFloorHeight = None) : 
        """
        Creates basic arrays to describe the building geometry (if not made available from external files)
        Returns an array with the format XCrd, YCrd, ZCrd
        """

        max_x = numBayX*BaywidthX
        max_y = numBayY*BaywidthY
        
        x_range = np.linspace(0,max_x,(numBayX+1))
        y_range = np.linspace(0,max_y,(numBayY+1))  
        
        
        if UniqueFirstFloorHeight != None : 
            max_z = (num_floors-1)*Floorheight+UniqueFirstFloorHeight
            z_range = np.linspace(UniqueFirstFloorHeight,max_z,(num_floors))      
            z_range = np.insert(z_range,0,0)
            

        else : 
            max_z = num_floors*Floorheight
            z_range = np.linspace(0,max_z,(num_floors+1))      


        
        
        coord_list = []
        
        # X axis iterator
        for xi in x_range:
            
            # Y axis iterator 
            for yi in y_range:            
                
                # Z axis iterator
                for zi in z_range:
                            # Node Tag     # XCrd    # YCrd    #ZCrd     #ndf
                    #ops.node(Tag_counter,     xi,      yi,      zi,'-ndf',6  )
                    coord_list.append([xi,yi,zi])
                    
                    #Tag_counter+=1
        
        coord_array = np.array(coord_list)     
        return(coord_array)


    def Node_geom(coord_array, masses = None):
        """
        Create nodes from range of coordinates.
        Assign node masses according to provided masses or according to (an assumed)tributary area (optional inclusion)
        Returns arrays with the nodes formatted as #NodeTag, XCrd, YCrd, ZCrd & node masses formatted as #NodeTag, mass (applied in both X and Y directions) 
        
        coord_array : A numpy array with XCrd, YCrd, ZCrd as columns, rows as individual nodes   
        
        """
        
        #-------------------------------------------------------
        # Create nodes & assign masses (if provided)
        node_coord_list = []
        node_mass_list = []
        
        Tag_counter = 1 
        
        node_count = coord_array.shape[0]
        
        # Make sure the nodes are sorted properly (X, then Y then Z)
        # This ensures all nodes in a singular (X,Y) coordinate are consecutive in the Z direction 
        ind = np.lexsort((coord_array[:,2],coord_array[:,1],coord_array[:,0]))
        sorted_array = coord_array[ind]
        
        
        x_coords = np.unique(sorted_array[:,0])
        y_coords = np.unique(sorted_array[:,1])
        
        
        # Bay length in X
        delta_x = x_coords[-1]-x_coords[-2]
        
        # Bay length in Y
        delta_y = y_coords[-1]-y_coords[-2]    
        
        
        for i in range(node_count) : 
            nodeTag = i+1

            xi = sorted_array[i,0]
            yi = sorted_array[i,1]
            zi = sorted_array[i,2]
                    # Node Tag     # XCrd    # YCrd    #ZCrd     #ndf
            ops.node(nodeTag,         xi,       yi,      zi,  '-ndf',6)
            node_coord_list.append([nodeTag,xi,yi,zi])


            if masses != None : 
                if masses == 'from array':
                    node_mass = sorted_array[i,3]
                    ops.mass(nodeTag, node_mass, node_mass, 0.01, 1.0e-10, 1.0e-10, 1.0e-10)
                    
                else : # assumes a generic rectanguar floor plan structure 
                    uniform_load = masses # Sum of dead/live load per floor area (note : this neglects exterior walls)
                    area = delta_x*delta_y 
                    
                    if (xi==x_coords[0]) | (xi==x_coords[-1]) : 
                        area = area*0.5 # Edge node
                    if (yi==y_coords[0]) | (yi==y_coords[-1]) : 
                        area = area*0.5 # Edge node

                    node_mass = uniform_load*area

                    if zi != 0 : # Assumes fixed foundation
                        ops.mass(nodeTag,node_mass,node_mass,0.01, 1.0e-10, 1.0e-10, 1.0e-10)
                node_mass_list.append([nodeTag,node_mass])
                    
        # Format output variables :           
        node_array = np.array(node_coord_list)
        node_mass_array = np.array(node_mass_list)              
        
        return node_array, node_mass_array

    def Add_centroid_nodes(Node_coord):
        """
        Input : Node coords ([Node id, node x, node y , node z]) as a numpy array


        Returns
        list of tuples mapping a (new) floor centroid node to according slave nodes.

        """
        
        v_node_dict = {}
        floor_diaphragm_data = []
        
        coord_array = Node_coord[:,1:]
        v_node_coords = []

        # Plan geometry
        # Make sure the nodes are sorted properly (X, then Y then Z)
        # This ensures all nodes in a singular (X,Y) coordinate are consecutive in the Z direction  
        ind = np.lexsort((coord_array[:,2],coord_array[:,1],coord_array[:,0]))
        sorted_array = coord_array[ind]
            
        
        x_coords = np.unique(sorted_array[:,0])
        y_coords = np.unique(sorted_array[:,1])
        z_coords = np.unique(sorted_array[:,2])    
        
        center_X = (x_coords[-1]+x_coords[0])/2
        center_Y = (y_coords[-1]+y_coords[0])/2
        

        # Create virtual nodes (they only count as diaphragm/equal dof nodes)
        for i,level in enumerate(z_coords[1:]):
            # NodeTag
            v_node = (i+1)*(-1)  # declare a node tag (can be negative)

            # Virtual node data
            v_node_coords.append([v_node,center_X,center_Y,level])
            
            # Create new node
            ops.node(v_node,center_X,center_Y,level)
            # Free to move X,Y and rotate about Z (others restrained)
            ops.fix(v_node,0,0,1,1,1,0)
            
            # Keep track of virtual node number versus elevation
            v_node_dict[level] = v_node
            
        # Assemble floor diaphragm data (virtual nodes + equalDOF/diaphgragm)
        for i in z_coords[1:] : 
            s_nodes = list(Node_coord[Node_coord[:,3]==i,0].astype(int))  
            m_node = v_node_dict[i]        
                                     # Perp dir  MstrNode ,     SlvNodes
            floor_diaphragm_data.append((3,     int(m_node),    s_nodes))

        v_node_coords = np.array(v_node_coords)
        
        return floor_diaphragm_data,v_node_coords

        
    def Node_sp_const(node_array):
        
        for node in node_array :
        # Set boundary condition (node tag, Dx, Dy, Dz, Rx, Ry, Rz)
            ops.fix(int(node),1,1,1,0,0,0)

    def Node_mp_const(diaphragm_ls_tupl):
        """
        Creates a rigid diaphragm from the geometry
        """
        for tupls in diaphragm_ls_tupl :
            for ndtag in tupls[2]: # Added to help ops recognize the list one at a time (could not process as list)
                # Rigid diaphragm  (Perpendicular dir, mNodeTag, [sNodeTags])     
                ops.rigidDiaphragm(int(tupls[0]),           int(tupls[1]),   int(ndtag))
        
