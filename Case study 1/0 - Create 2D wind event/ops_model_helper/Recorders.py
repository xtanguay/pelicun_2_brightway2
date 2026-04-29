# -*- coding: utf-8 -*-
"""
Created on Thu Sep 19 15:24:55 2024

@author: xtang
"""

import openseespy.opensees as ops
import os 

class Recorders():
    def Get_recorders(load_name,ls_nodes,out_dir = None):

        # =============================================================================
        # Recorders
        # =============================================================================
            
        if out_dir != None : 
            #os.path.join()
            fp = os.path.join(os.path.dirname(os.path.abspath(__file__)),out_dir)
            if not os.path.isdir(fp) : 
                ValueError('Failed to create the recorder due to inexistant path!')
            print(f'Results will be recorded at {fp}')
            out_to = out_dir+'//'
            
        else : 
            out_to = ''
            print('Results will be recorded within the local directory.')    
        
        for node in ls_nodes : 
            ops.recorder('Node', '-file',out_to + load_name + f"_Node{node}.out", '-time', '-node', node, '-dof', 1,2,'disp')
            

        return


