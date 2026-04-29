# -*- coding: utf-8 -*-
"""
Created on Tue Sep 17 15:53:53 2024

@author: xtang
"""
import openseespy.opensees as ops

class Loads():
    class assign_loads :
        def gravity_loads(): 
            """"
            Not implemented yet.
            """
            return
        
        
        
        
        def node_ts(node,ts_id,pattern_id,dt,TH,ax = 'X') : 
            """
            Map node force time histories to their opensees model
            """
            # Load the timeseries :
            ops.timeSeries("Path",ts_id,'-dt',dt,'-values',*TH)
            # Define "where" shall the timeseries apply : 
            ops.pattern("Plain", pattern_id,ts_id)    # Note : arguments are PatternType, PatternTag, TimeSeriesTag 
            
            # Recall : the nodal_force create function already converts (+) and (-) according to surface orientation.
            if ax == 'X' :
                # Add : which node is concerned by the latest defined pattern:
                ops.load(node, 1, 0, 0,0,0,0) 
            elif ax == 'Y' : 
                ops.load(node,0,1,0,0,0,0)
            return 
        
        def stick_model_node_ts(node,counter_id,dt,TH) : 
            """
            Map node force time histories to their opensees model
            """
            # Load the timeseries :  
                # X timeserie
            ops.timeSeries("Path",counter_id,'-dt',dt,'-values',*TH[:,0])
                # Y timeserie
            ops.timeSeries("Path",counter_id+1,'-dt',dt,'-values',*TH[:,1])
                # Mz timeserie
            ops.timeSeries("Path",counter_id+2,'-dt',dt,'-values',*TH[:,2])    
        
            # Define "where" shall the timeseries apply : 
                # X pattern
            ops.pattern("Plain", counter_id,counter_id)    # Note : arguments are PatternType, PatternTag, TimeSeriesTag         
                # Add : which node is concerned by the latest defined pattern:
            ops.load(node, 1, 0, 0)         
            
                # Y pattern
            ops.pattern("Plain", counter_id+1,counter_id+1)    # Note : arguments are PatternType, PatternTag, TimeSeriesTag         
                # Add : which node is concerned by the latest defined pattern:
            ops.load(node, 0, 1, 0)     
            
                # Mz pattern
            ops.pattern("Plain", counter_id+2,counter_id+2)    # Note : arguments are PatternType, PatternTag, TimeSeriesTag 
                # Add : which node is concerned by the latest defined pattern:
            ops.load(node, 0, 0, 1) 
            
            return     
        
        
    class run_analysis :
        def Wnd_assessment(dt,tFinal): 
            
            # Clear the analysis object (useful to chain a gravity + another load pattern)
            # will delete the current analysis objects (but not current state of deformation)
            #ops.wipeAnalysis()
                
            # Create a time interval between datapoints:
            #dt = 0.5 # 0.5 seconds interval between datapoints
            
            
            # Set a constraint handler to enforce relationship between degrees of freedom : 
            ops.constraints("Transformation")
            
            # create DOF number (used to link degrees of freedom with objects and the equation numbers) :
            ops.numberer("RCM")
            
            # create System of equations :
            ops.system("BandGeneral")
            
            # Use a convergence test object to determine if convergence has been achieved after iteration :
            # Note : This is more usefull when doing an analysis that has non-linearity
            # test arguments : Convergence test methodology (i.e. NormDispIncre) ; Tolerance for convergence ; Max iterations ; Print flag
            ops.test('NormDispIncr',1.0e-12,25,0)
            
            # create algorithm (Newton-Raphson algorithm to solve nonlinear algebraic equations)
            ops.algorithm("Newton")
            
            # create integrator - in a transient analysis, the time steps are given with the "analyze" command.
            ops.integrator('Newmark',  0.5,  0.25 )
            
            # create analysis object (either Static, Transient, VariableTransient or PFEM )
            ops.analysis('Transient')
            
            # Run analysis, using which will use the integrator each time and iterate until time matches the number of load steps :
            # set some variables
            
            tCurrent = ops.getTime() # Should begin at 0
            ok = 0
            
            time = []
            u3 = []
                
            # Perform the transient analysis
            while ok == 0 and tCurrent < tFinal:        
                ok = ops.analyze(1, dt)    
                
                print(tCurrent,ops.nodeDisp(120,1),ops.nodeDisp(41,2),ops.nodeDisp(41,3))
                
                # if the analysis fails try initial tangent iteration
                if ok != 0:
                    print("regular newton failed .. lets try an initail stiffness for this step")
                    ops.test('NormDispIncr', 1.0e-12,  100, 0)
                    ops.algorithm('ModifiedNewton', '-initial')
                    ok =ops.analyze( 1, dt)
                    if ok == 0:
                        print("that worked .. back to regular newton")
                    ops.test('NormDispIncr', 1.0e-12,  10 )
                    ops.algorithm('Newton')
                
                tCurrent = ops.getTime()
            
                #time.append(tCurrent)
                #u3.append(ops.nodeDisp(3,1))  
            
            return(u3,time) 
