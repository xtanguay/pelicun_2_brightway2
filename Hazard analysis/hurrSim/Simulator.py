# -*- coding: utf-8 -*-
"""
Created on Fri Jul 21 09:26:43 2023

@author: xtang
"""


import datetime
from .tools import tool_func
import numpy as np
import ast
import math


def Simulator_B(*args) :
    
    """
    Vickery regression
    All pc
    Imin
    T0 : as computed
    """
    
    # Storage variables / Recorders : 
    hurr_ids = []
    lat_rec = []
    long_rec = []
    cell_rec = []
    c_rec = []
    theta_rec = []
    land_rec = []
    tag_rec = []
    Pc_rec = []
    RMW_rec = []
    Int_rec = []
    Holland_B_rec = []
    
    delta_p_rec = []

    sst_failed_rec = []
    time_rec = []
    
    
    # Unpacking imports :
    simulation_id = args[-1]                    # Simulation id
    hurrs_to_sim = args[0][simulation_id]       # Sampled hurr count, taken at the simulation id.
    storms = args[1]                            # Pool of start coordinates
    storms_int = args[2]                        # Pool of initial central pressures
    cell_ids = args[3][0]                       # Cell range (1 to 220)
    lat_range = args[3][1]                      # Latitude range of the cells
    long_range = args[3][2]                     # Longitude range of the cells
    hurr_param = args[4]                        # Regression variables (speed, heading, intensity)
    max_c,min_c = args[5][0], args[5][1]        # Speed bounds to retain for the simulations.
    
    air_temp_post_2015 = args[6]
    air_temp = args[7]
    hadsst_pre1870 = args[8]
    hadsst_post2020 = args[9]
    hadsst = args[10]
    decay_consts = args[11]
    
    # Create simulation specific variables : 
    yr = np.random.default_rng().integers(1851,high = 2020+1)   # Sampled year (all storms in this sampling will share this year) 
        
    for hurr_i in range(hurrs_to_sim)  :      
        
        j = 1    # Storm step counter
        i = 1    # Storm counter of the year        
        
        
        # Sample initial info (coord and pressure)
        storm_init = storms.sample(n=1)  
        storm_int = storms_int.sample(n=1)
        
        # Initial coordinates & grid :    
        lat_i = storm_init.iloc[0,0]
        long_i = storm_init.iloc[0,1]
        time = datetime.datetime.strptime(storm_init.iloc[0,7],'%Y-%m-%d %H:%M:%S')
        time = time.replace(year = yr)
        coord = (lat_i,-long_i)    # Notice the sign is flipped (grid assumes longitude is +, but in reality, longitude is -)
        cell_id = tool_func.coord_id_assign(coord,cell_ids,lat_range,long_range)
        land_realm_i = False # Storms initiate in the ocean
    
        # Initial speed and heading :
        c_i = storm_init.iloc[0,4]  
        ln_c_i = np.log(c_i)          
        theta_i = storm_init.iloc[0,5]
        theta_im1 = 0
    
        # Initialize storm intensity : 
        pc_i = storm_int.iloc[0,2]
        delta_pi = 1013 - pc_i # Initial pressure difference         
        T0_i = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_i,long_i,time)
        SST_i = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_i,long_i,time)        
        Int_i = tool_func.pc2I(pc_i, SST_i , T0_i)
    
        # Catch storms which fail to derive a valid initial intensity
        while Int_i < 0 :
            print(f'Simulated storm had a nul or negative intensity. Simulation sampling rebooted. Initial int was {Int_i}')            
            storm_int = storms_int.sample(n = 1)
            pc_i = storm_int.iloc[0,2]
            delta_pi = 1013 - pc_i # Initial pressure difference         
            T0_i = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_i,long_i,time)
            SST_i = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_i,long_i,time)        
            Int_i = tool_func.pc2I(pc_i, SST_i , T0_i)
            print(f'New intentsity == {Int_i}')    
            
            if Int_i < 0 :  
            # In case this is still invalid, resample a coordinate : 
                storm_init = storms.sample(n=1)                  
            
                # Initial coordinates & grid :    
                lat_i = storm_init.iloc[0,0]
                long_i = storm_init.iloc[0,1]
                time = datetime.datetime.strptime(storm_init.iloc[0,7],'%Y-%m-%d %H:%M:%S')
                time = time.replace(year = yr)
                coord = (lat_i,-long_i)    # Notice the sign is flipped (grid assumes longitude is +, but in reality, longitude is -)
                cell_id = tool_func.coord_id_assign(coord,cell_ids,lat_range,long_range)
                #land_realm_i = False # Storms initiate in the ocean
            
                # Initial speed and heading :
                c_i = storm_init.iloc[0,4]  
                ln_c_i = np.log(c_i)          
                theta_i = storm_init.iloc[0,5]
                #theta_im1 = 0
            
            
    
        ln_Int_i = np.log(Int_i)        
        ln_Int_im1 = 0
        ln_Int_im2 = 0    

        # Begin tracking which model to use for RMW : 
        delta_p_atlantic = 0 # Reset this parameters for RMW
        delta_p_gulf = 0 # Reset this parameter for RMW  
        
        if (lat_i > 18 and long_i < -81) :
            delta_p_gulf =delta_p_gulf+delta_pi
        else : 
            delta_p_atlantic =delta_p_atlantic+ delta_pi        
        
        # Define wheter the storm is big or small compared to average : 
        eps_Gulf = np.random.default_rng().normal(0,0.390)
        eps_Atl = np.random.default_rng().normal(0,0.441)
        
        RMW_i = tool_func.RMW_calc(delta_pi,lat_i,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)
        
        # Compute initial Holland parameter - tag is necessarily 3 for initiating a storm.
        eps_B = np.random.default_rng().normal(0,0.226)
        
        Holland_i = tool_func.B_calc(3,RMW_i,lat_i,SST_i,pc_i,eps_B)
    
        # Record initial conditions : 
        hurr_ids.append(f'Hur-{simulation_id+1}-{hurr_i+1}')
        lat_rec.append(lat_i)
        long_rec.append(long_i)
        cell_rec.append(cell_id)
        c_rec.append(c_i)            
        theta_rec.append(theta_i)
        Pc_rec.append(pc_i)           
        land_rec.append(land_realm_i)
        time_rec.append(time)
        sst_failed_rec.append(False)
        tag_rec.append(np.nan) # Set to nan - storm is currently not moving.
        RMW_rec.append(RMW_i)
        Int_rec.append(Int_i)
        delta_p_rec.append(delta_pi)
        Holland_B_rec.append(Holland_i)
      
        # Lets start moving this storm! 
        next_step = True
        while next_step == True :  
            
            
            #------------------------------------------------------------------------------------
            # Track parameters : 
                #Heading East or West ? 
            if theta_i>=0 :
                H = "W"
                # Speed
                X = np.array([1,ln_c_i,lat_i,long_i,theta_i])
                # Heading
                Y = np.array([1,lat_i,long_i,c_i,theta_i,theta_im1])
            else :
                H = "E"
                # Speed
                X = np.array([1,ln_c_i,lat_i,long_i,theta_i]) # (regr. coeffs trainned on negative longitude) 
                # Heading
                Y = np.array([1,lat_i,long_i,c_i,theta_i,theta_im1])
            #------------------------------------------------------------------------------------                    
            # Moving speed 
            speed_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_alpha_coeffs_ed"])
                # Regression params.
            alpha_coeffs = np.asanyarray(speed_params[0])
            alpha_res = np.asanyarray(speed_params[1])            
            
            # Update the speed : 
            ln_c_ip1_base = np.matmul(X,alpha_coeffs)
            simul_res_speed = np.random.default_rng().standard_t(int(alpha_res[0]),size = 1)*alpha_res[1]
            ln_c_ip1 = float(ln_c_ip1_base+simul_res_speed) 
            c_ip1 = np.exp(ln_c_ip1)
                # Sanity checks :
            c_ip1 = max(min(max_c, c_ip1), min_c) #make sure the speed does not go out of control/stagnate
            if np.isclose(np.log(c_ip1),ln_c_ip1) == False : 
                ln_c_ip1 = np.log(c_ip1)
                
            # Heading angle :
            heading_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_beta_coeffs_ed"])
                # Regression params
            beta_coeffs = np.asanyarray(heading_params[0])
            beta_res = np.asanyarray(heading_params[1])   
    
            # Update the heading : 
            delta_theta_base = np.matmul(Y,beta_coeffs)
            simul_res_theta = np.random.default_rng().standard_t(int(beta_res[0]),size = 1)*beta_res[1]
            delta_theta = float(delta_theta_base+simul_res_theta)
            theta_ip1 = theta_i+delta_theta
            theta_ip1 = tool_func.convert_angle_180(theta_ip1)
            
            # Update time : 
            timep1 = time + datetime.timedelta(hours=6)         
            #-----------------------------------------------------------------------------            
            # Calculate destination : 
                # Recall : speed is in meter/seconds 
            dist = c_ip1 * (3600*6) # Trajectory is assessed every 6 hours, in kilometers.  
            lat_p1,long_p1 = tool_func.haversine_destination(lat_i,long_i,-theta_ip1,dist)
            #-----------------------------------------------------------------------------          
            # Manage storms moving outside of the grid bounds : 
            coord_ip1 = (lat_p1,-long_p1)
            try :
                cell_idp1 = tool_func.coord_id_assign(coord_ip1,cell_ids,lat_range,long_range)
            except ValueError :
                break            
            #-----------------------------------------------------------------------------            
            # Next step is on land or ocean ?
            land_realm_ip1 = tool_func.is_land(long_p1,lat_p1) # False = ocean, True = Land        
            
            #Tag one of 4 possible combinations to update intensity :                 
            # Tag == 0 : Moving from land coordinate to land
            # Tag == 1 : Moving from ocean coordinate to land 
            # Tag == 2 : Moving from land coordinate to ocean 
            # Tag == 3 : Moving from ocean coordinate to ocean  
            
            # land to land
            if (land_realm_ip1 == True and land_realm_i == True) : 
                tag = 0
                sst_val = False # moving to land, thus no SST
            
            # landfall
            if (land_realm_ip1 == True and land_realm_i == False) : 
                tag = 1
                sst_val = False #moving to land, thus no SST
            
            # land to ocean
            if (land_realm_ip1 == False and land_realm_i == True) : 
                tag = 2
                SST_ip1 = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_p1,long_p1,timep1)
                sst_val = False # moving to ocean, thus SST should work
                # Check in case an edge case is triggered
                if np.isnan(SST_ip1) :
                    tag = 0
                    land_realm_ip1 = True                    
                    sst_val = True
            
            # ocean to ocean
            if (land_realm_ip1 == False and land_realm_i == False) :
                tag = 3
                SST_ip1 = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_p1,long_p1,timep1)
                sst_val = False # moving to ocean, thus SST should work

                # Check in case an edge case is triggered
                if np.isnan(SST_ip1) :
                    tag = 1
                    land_realm_ip1 = True
                    sst_val = True           

            #------------------------------------------------------------------------
            # Update intensity, according to tag value :
            if tag == 0 :
                # Land to land central pressure update
                lf_time_elapsed +=6 
                # Find delta_p_ip1
                delta_p_ip1 = (1013-pc0)*np.exp(-alpha3*lf_time_elapsed) 
                pc_ip1 = 1013 - delta_p_ip1 
                                    
                # Retrieve necessary info to compute RMW
                if (lat_p1 > 18 and long_p1 < -81) : 
                    delta_p_gulf = delta_p_gulf+delta_p_ip1
                else : 
                    delta_p_atlantic = delta_p_atlantic+ delta_p_ip1 

                RMW_ip1 =tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)  
                
                Int_ip1 = np.nan # Relative intensity becomes unavailable if no SST to assess
                ln_Int_ip1 = np.nan 
                
                # Compute the Holland parameter 
                Holland_ip1 = tool_func.B_calc(tag,Holland_lf,lf_time_elapsed)

            elif tag == 1 : 
                # Landfall (ocean to land)
                pc0 = pc_i  # last available central pressure measure
                delta_p_ip1 = 1013 - pc_i   # New central pressure deficit
                c0 = c_ip1
                lf_time_elapsed = 0                   
                                    
                # Find RMW
                if (lat_p1 > 18 and long_p1 < -81) : 
                    delta_p_gulf = delta_p_gulf+delta_p_ip1
                else : 
                    delta_p_atlantic = delta_p_atlantic+delta_p_ip1

                RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl) 
                
                # Store this variable for current and upcoming land values. 
                RMW_lf = RMW_ip1
                
                # Compute the decay constant alpha (Vickery 2005) :
                region = tool_func.assign_decay_region(lat_p1,long_p1)

                # Assign the variables from the table
                alpha_0 = decay_consts.loc[region][0]
                alpha_1 = decay_consts.loc[region][1] 
                sigma = decay_consts.loc[region][2]
                
                
                # Compute the alpha2 value : 
                if region == 'New England coast'  : 
                    alpha2_base = alpha_0+alpha_1*delta_p_ip1
                else : 
                    alpha2_base = alpha_0+alpha_1*delta_p_ip1*c0/RMW_lf                        
                    
                # Vickery 2005 suggest to hard cap this value :
                alpha2_simul_res = min(np.random.default_rng().normal(0,sigma,1),-3*sigma,3*sigma,key=abs)
                alpha3 = max(0.015,alpha2_base+alpha2_simul_res) # Vickery 2005 : hard constraint
                
                # Find the decayed central pressure : 
                pc_ip1 = 1013-(1013-pc0)*np.exp(-alpha3*lf_time_elapsed) # Essentially yields pc0.
                Int_ip1 = np.nan # Relative intensity becomes unavailable if no SST to assess
                ln_Int_ip1 = np.nan    
                
                # Find the Holland parameter : 
                Holland_ip1 = tool_func.B_calc(tag,Holland_i,lf_time_elapsed) # Essentially yields B0
                Holland_lf = Holland_ip1



        
            elif tag == 2 :
                # Land to ocean (intensity reboot)
                lf_time_elapsed +=6                     
                delta_p_ip1 = (1013-pc0)*np.exp(-alpha3*lf_time_elapsed) 
                pc_ip1 = 1013 - delta_p_ip1
                
                # Define the new Intensity upon re-entering water : 
                T0_ip1 = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_p1,long_p1,timep1)
                
                Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1, T0_ip1)
                
                # Sometimes, the new relative intensity might not be sufficient - simply terminate the storm.
                if Int_ip1 < 0 : 
                    break
                    
                ln_Int_ip1 = np.log(Int_ip1)
                   
                # Reset variables (see Vickery et al 2009)
                ln_Int_im2 = ln_Int_ip1
                ln_Int_im1 = ln_Int_ip1
                # Force update this specific value.
                ln_Int_i = ln_Int_ip1
                                    
                if (lat_p1 > 18 and long_p1 < -81) : 
                    delta_p_gulf =delta_p_gulf + delta_p_ip1
                else : 
                    delta_p_atlantic =delta_p_atlantic+ delta_p_ip1

                RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)     
                
                # Compute Holland parameter :
                Holland_ip1 = tool_func.B_calc(tag,RMW_ip1,lat_p1,SST_ip1,pc_ip1,eps_B)           
    
            elif tag == 3 : 
                # Ocean to ocean intensity update
                # Intensity regression params :         
                intensity_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_kappa_coeffs_ed"])                    
                kappa_coeffs = np.asanyarray(intensity_params[0])
                kappa_res = np.asanyarray(intensity_params[1])
                delta_sst = SST_ip1-SST_i
                
                Z = np.array([1,ln_Int_i,ln_Int_im1,ln_Int_im2,SST_i,delta_sst])

                # New intensity values : 
                ln_I_ip1_base = np.matmul(Z,kappa_coeffs)
                simul_res_int = np.random.default_rng().standard_t(int(kappa_res[0]),size = 1)*kappa_res[1]
                ln_Int_ip1 = float(ln_I_ip1_base+simul_res_int)
                Int_ip1 = np.exp(ln_Int_ip1) 

                # Define the new central pressure : 
                T0_ip1 = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_p1,long_p1,timep1)
                
                
                #T0_ip1 = 203    # According to Vickery 2000, top of stratosphere temperature could be set to 203 K.
                                 # This hypothesis is dropped in Vickery 2009 though.  
                pc_ip1 = tool_func.I2pc(Int_ip1,SST_ip1,T0_ip1)                        
                

                if pc_ip1 > 1013 : 
                    pc_ip1 = 1013
                    
                    Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1)
                    if Int_ip1 <= 0 : 
                        Int_ip1 = 0 
                        ln_Int_ip1 = np.nan
                    else :
                        ln_Int_ip1 = np.log(Int_ip1)

                # Check that maximum pressure defficit is satisfied (according to Emmanuel 1988):
                if pc_ip1 < 860 :
                    pc_ip1 = 860
                    Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1)
                    ln_Int_ip1 = np.log(Int_ip1)
                    
                delta_p_ip1 = 1013 - pc_ip1  # Returns a numpy array - which converts all others to arrays.

                # Update RMW
                if (lat_p1 > 18 and long_p1 < -81) : 
                    delta_p_gulf =delta_p_gulf+delta_p_ip1
                else : 
                    delta_p_atlantic = delta_p_atlantic+delta_p_ip1
                RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)
                
                #Update Holland 
                Holland_ip1 = tool_func.B_calc(tag,RMW_ip1,lat_p1,SST_ip1,pc_ip1,eps_B)                  

            #-----------------------------------------------------------------------------
            # Record speed / heading / Intensity for the new step : 
            hurr_ids.append(f'Hur-{simulation_id+1}-{hurr_i+1}')
            lat_rec.append(lat_p1)
            long_rec.append(long_p1)
            cell_rec.append(cell_idp1)
            c_rec.append(c_ip1)            
            theta_rec.append(theta_ip1)           
            land_rec.append(land_realm_ip1)        
            sst_failed_rec.append(sst_val)
            Pc_rec.append(pc_ip1)
            tag_rec.append(tag)
            RMW_rec.append(RMW_ip1)
            Int_rec.append(Int_ip1)
            delta_p_rec.append(delta_p_ip1)
            Holland_B_rec.append(Holland_ip1)           
            time_rec.append(timep1)        
            
            
            # Update variables for next iteration :  
            ln_Int_im2 = ln_Int_im1
            ln_Int_im1 = ln_Int_i
            

            try :
                SST_i = SST_ip1
            except :
            # Sometimes, the second step will yield a land area and would break simulations                
                pass
            pc_i = pc_ip1
            ln_Int_i = ln_Int_ip1
            Int_i = Int_ip1
            Holland_i = Holland_ip1
            
            c_i = c_ip1        
        
            # Updating log values may cause some instabilities : 
            try :
                ln_c_i = math.log(c_i)
            except :
                break        
                      
            theta_im1 = theta_i 
            theta_i = theta_ip1
            lat_i = lat_p1
            long_i = long_p1
            time = timep1
            land_realm_i = land_realm_ip1        
            
            
            # Update grid cell for next iteration
            coord = coord_ip1
            cell_id = cell_idp1        
                   
            # Otherwise, update the storm step :            
            j+=1
            i+=1    
            
            # Assert whether the storm simulation should be stopped or not :            
            if pc_i > 1013 : 
                    next_step = False               
            # Prevent storms from crawling to their final step :  
            if np.isclose(pc_i,1013,atol=1e-02) :
                    next_step = False           
  
    
    return(hurr_ids,time_rec,lat_rec,long_rec,cell_rec,c_rec,theta_rec,sst_failed_rec,land_rec,tag_rec,Pc_rec,Int_rec,RMW_rec,Holland_B_rec)

def Simulator_A(*args) :   

     """
     Snaiki and Wu parameterization - capped at latitude
     """
     
     # Storage variables / Recorders : 
     hurr_ids = []
     lat_rec = []
     long_rec = []
     cell_rec = []
     c_rec = []
     theta_rec = []
     land_rec = []
     tag_rec = []
     Pc_rec = []
     RMW_rec = []
     Int_rec = []
     Holland_B_rec = []
     
     delta_p_rec = []
     ####################
     sst_failed_rec = []
     time_rec = []
     
     # Initiate Storm counter / year
     #i = 0
     
     #print(args[0],args[-1])
     
     
     # Unpacking imports :
     simulation_id = args[-1]                    # Simulation id
     hurrs_to_sim = args[0][simulation_id]       # Sampled hurr count, taken at the simulation id.
     storms = args[1]                            # Pool of start coordinates
     storms_int = args[2]                        # Pool of initial central pressures
     cell_ids = args[3][0]                       # Cell range (1 to 220)
     lat_range = args[3][1]                      # Latitude range of the cells
     long_range = args[3][2]                     # Longitude range of the cells
     hurr_param = args[4]                        # Regression variables (speed, heading, intensity)
     max_c,min_c = args[5][0], args[5][1]        # Speed bounds to retain for the simulations.
     
     air_temp_post_2015 = args[6]
     air_temp = args[7]
     hadsst_pre1870 = args[8]
     hadsst_post2020 = args[9]
     hadsst = args[10]
     decay_consts = args[11]

     ref_lat = 41.5
     
     # Create simulation specific variables : 
     yr = np.random.default_rng().integers(1851,high = 2020+1)   # Sampled year (all storms in this sampling will share this year) 
         
     for hurr_i in range(hurrs_to_sim)  :      
         
         j = 1    # Storm step counter
         i = 1    # Storm counter of the year        
         
         
         # Sample initial info (coord and pressure)
         storm_init = storms.sample(n=1)  
         storm_int = storms_int.sample(n=1)
         
         # Initial coordinates & grid :    
         lat_i = storm_init.iloc[0,0]
         long_i = storm_init.iloc[0,1]
         time = datetime.datetime.strptime(storm_init.iloc[0,7],'%Y-%m-%d %H:%M:%S')
         time = time.replace(year = yr)
         coord = (lat_i,-long_i)    # Notice the sign is flipped (grid assumes longitude is +, but in reality, longitude is -)
         cell_id = tool_func.coord_id_assign(coord,cell_ids,lat_range,long_range)
         land_realm_i = False # Storms initiate in the ocean
     
         # Initial speed and heading :
         c_i = storm_init.iloc[0,4]  
         #ln_c_i = np.log(c_i)          
         theta_i = storm_init.iloc[0,5]
         theta_im1 = 0
     
         # Initialize storm intensity : 
         pc_i = storm_int.iloc[0,2]
         delta_pi = 1013 - pc_i # Initial pressure difference         
         #T0_i = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_i,long_i,time)
         T0_i = 203 # According to Vickery 2000, top of stratosphere temperature could be set to 203 K.
         SST_i = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_i,long_i,time)        
         Int_i = tool_func.pc2I(pc_i, SST_i , T0_i)
     
         # Catch storms which fail to derive a valid initial intensity
         while Int_i < 0 :
             print(f'Simulated storm had a nul or negative intensity. Simulation sampling rebooted. Initial int was {Int_i}')            
             storm_int = storms_int.sample(n = 1)
             pc_i = storm_int.iloc[0,2]
             delta_pi = 1013 - pc_i # Initial pressure difference         
             T0_i = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_i,long_i,time)
             SST_i = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_i,long_i,time)        
             Int_i = tool_func.pc2I(pc_i, SST_i , T0_i)
             print(f'New intentsity == {Int_i}')    
             
             if Int_i < 0 :  
             # In case this is still invalid, resample a coordinate : 
                 storm_init = storms.sample(n=1)                  
             
                 # Initial coordinates & grid :    
                 lat_i = storm_init.iloc[0,0]
                 long_i = storm_init.iloc[0,1]
                 time = datetime.datetime.strptime(storm_init.iloc[0,7],'%Y-%m-%d %H:%M:%S')
                 time = time.replace(year = yr)
                 coord = (lat_i,-long_i)    # Notice the sign is flipped (grid assumes longitude is +, but in reality, longitude is -)
                 cell_id = tool_func.coord_id_assign(coord,cell_ids,lat_range,long_range)
             
                 # Initial speed and heading :
                 c_i = storm_init.iloc[0,4]           
                 theta_i = storm_init.iloc[0,5]

             
             
     
         ln_Int_i = np.log(Int_i)        
         ln_Int_im1 = 0
         ln_Int_im2 = 0    

         # Begin tracking which model to use for RMW : 
         delta_p_atlantic = 0 # Reset this parameters for RMW
         delta_p_gulf = 0 # Reset this parameter for RMW  
         
         if (lat_i > 18 and long_i < -81) :
             delta_p_gulf =delta_p_gulf+delta_pi
         else : 
             delta_p_atlantic =delta_p_atlantic+ delta_pi        
         
         # Define wheter the storm is big or small compared to average : 
         eps_Gulf = np.random.default_rng().normal(0,0.390)
         eps_Atl = np.random.default_rng().normal(0,0.441)
         
         RMW_i = tool_func.RMW_calc(delta_pi,lat_i,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)
         
         # Compute initial Holland parameter - tag is necessarily 3 for initiating a storm.
         eps_B = np.random.default_rng().normal(0,0.226)
         
         Holland_i = tool_func.B_calc(3,RMW_i,lat_i,SST_i,pc_i,eps_B)
     
         # Record initial conditions : 
         hurr_ids.append(f'Hur-{simulation_id+1}-{hurr_i+1}')
         lat_rec.append(lat_i)
         long_rec.append(long_i)
         cell_rec.append(cell_id)
         c_rec.append(c_i)            
         theta_rec.append(theta_i)
         Pc_rec.append(pc_i)           
         land_rec.append(land_realm_i)
         time_rec.append(time)
         sst_failed_rec.append(False)
         tag_rec.append(np.nan) # Set to nan - storm is currently not moving.
         RMW_rec.append(RMW_i)
         Int_rec.append(Int_i)
         delta_p_rec.append(delta_pi)
         Holland_B_rec.append(Holland_i)


         next_step = True
         while next_step == True :             
             #------------------------------------------------------------------------------------
             # Track parameters : 
                 #Heading East or West ? 
             if theta_i>=0 :
                 H = "W"
                 # Speed
                 X = np.array([1,c_i])
                 # Heading
                 Y = np.array([1,lat_i,long_i,c_i,theta_i,theta_im1])
             else :
                 H = "E"
                 # Speed
                 X = np.array([1,c_i,lat_i,long_i,theta_i]) # (regr. coeffs trainned on negative longitude) 
                 # Heading
                 Y = np.array([1,lat_i,long_i,c_i,theta_i,theta_im1])
             #------------------------------------------------------------------------------------                    
             # Moving speed 
             speed_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_alpha_coeffs_ed"])
                 # Regression params.
             alpha_coeffs = np.asanyarray(speed_params[0])
             alpha_res = np.asanyarray(speed_params[1])            
             
             # Update the speed : 
             c_ip1_base = np.matmul(X,alpha_coeffs)
             simul_res_speed = np.random.default_rng().standard_t(int(alpha_res[0]),size = 1)*alpha_res[1]
             c_ip1 = float(c_ip1_base+simul_res_speed.item()) 
                 # Sanity checks :
             c_ip1 = max(min(max_c, c_ip1), min_c) #make sure the speed does not go out of control/stagnate
                 
             # Heading angle :
             heading_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_beta_coeffs_ed"])
                 # Regression params
             beta_coeffs = np.asanyarray(heading_params[0])
             beta_res = np.asanyarray(heading_params[1])   
     
             # Update the heading : 
             delta_theta_base = np.matmul(Y,beta_coeffs)
             simul_res_theta = np.random.default_rng().standard_t(int(beta_res[0]),size = 1)*beta_res[1]
             delta_theta = float(delta_theta_base+simul_res_theta.item())
             theta_ip1 = theta_i+delta_theta
             theta_ip1 = tool_func.convert_angle_180(theta_ip1)
             
             # Update time : 
             timep1 = time + datetime.timedelta(hours=6)         
             #-----------------------------------------------------------------------------            
             # Calculate destination : 
                 # Recall : speed is in meter/seconds
             dist = c_ip1 * (3600*6) # Trajectory is assessed every 6 hours, in kilometers.  
             lat_p1,long_p1 = tool_func.haversine_destination(lat_i,long_i,-theta_ip1,dist)

             #-----------------------------------------------------------------------------          
             # Manage storms moving outside of the grid bounds : 
             coord_ip1 = (lat_p1,-long_p1)
             try :
                 cell_idp1 = tool_func.coord_id_assign(coord_ip1,cell_ids,lat_range,long_range)
             except ValueError :
                 break            
             #-----------------------------------------------------------------------------            
             # Next step is on land or ocean ?
             land_realm_ip1 = tool_func.is_land(long_p1,lat_p1) # False = ocean, True = Land        
             
             #Tag one of 4 possible combinations to update intensity :                 
             # Tag == 0 : Moving from land coordinate to land
             # Tag == 1 : Moving from ocean coordinate to land 
             # Tag == 2 : Moving from land coordinate to ocean 
             # Tag == 3 : Moving from ocean coordinate to ocean  
             
             # land to land
             if (land_realm_ip1 == True and land_realm_i == True) : 
                 tag = 0
                 sst_val = False # moving to land, thus no SST
             
             # landfall
             if (land_realm_ip1 == True and land_realm_i == False) : 
                 tag = 1
                 sst_val = False #moving to land, thus no SST
             
             # land to ocean
             if (land_realm_ip1 == False and land_realm_i == True) : 
                 tag = 2
                 SST_ip1 = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_p1,long_p1,timep1)
                 sst_val = False # moving to ocean, thus SST should work
                 # Check in case an edge case is triggered
                 if np.isnan(SST_ip1) :
                     tag = 0
                     land_realm_ip1 = True                    
                     sst_val = True
             
             # ocean to ocean
             if (land_realm_ip1 == False and land_realm_i == False) :
                 tag = 3
                 SST_ip1 = tool_func.interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_p1,long_p1,timep1)
                 sst_val = False # moving to ocean, thus SST should work

                 # Check in case an edge case is triggered
                 if np.isnan(SST_ip1) :
                     tag = 1
                     land_realm_ip1 = True
                     sst_val = True
             #------------------------------------------------------------------------
             # Update intensity, according to tag value :
             if tag == 0 :
                 # Land to land central pressure update
                 lf_time_elapsed +=6 
                 # Find delta_p_ip1
                 delta_p_ip1 = (1013-pc0)*np.exp(-alpha3*lf_time_elapsed) 
                 pc_ip1 = 1013 - delta_p_ip1 
                                     
                 # Retrieve necessary info to compute RMW
                 if (lat_p1 > 18 and long_p1 < -81) : 
                     delta_p_gulf = delta_p_gulf+delta_p_ip1
                 else : 
                     delta_p_atlantic = delta_p_atlantic+ delta_p_ip1 
                 RMW_ip1 =tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)  
                 
                 Int_ip1 = np.nan # Relative intensity becomes unavailable if no SST to assess
                 ln_Int_ip1 = np.nan 
                 
                 # Compute the Holland parameter 
                 Holland_ip1 = tool_func.B_calc(tag,Holland_lf,lf_time_elapsed)

             elif tag == 1 : 
                 # Landfall (ocean to land)
                 pc0 = pc_i  # last available central pressure measure
                 delta_p_ip1 = 1013 - pc_i   # New central pressure deficit
                 c0 = c_ip1
                 lf_time_elapsed = 0                   
                                     
                 # Find RMW
                 if (lat_p1 > 18 and long_p1 < -81) : 
                     delta_p_gulf = delta_p_gulf+delta_p_ip1
                 else : 
                     delta_p_atlantic = delta_p_atlantic+delta_p_ip1
                 RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl) 
                 
                 # Store this variable for current and upcoming land values. 
                 RMW_lf = RMW_ip1
                 
                 # Compute the decay constant alpha (Vickery 2005) :
                 region = tool_func.assign_decay_region(lat_p1,long_p1)

                 # Assign the variables from the table
                 alpha_0 = decay_consts.loc[region].iloc[0]
                 alpha_1 = decay_consts.loc[region].iloc[1] 
                 sigma = decay_consts.loc[region].iloc[2]
                 
                 
                 # Compute the alpha2 value : 
                 if region == 'New England coast'  : 
                     alpha2_base = alpha_0+alpha_1*delta_p_ip1
                 else : 
                     alpha2_base = alpha_0+alpha_1*delta_p_ip1*c0/RMW_lf                        
                     
                 # Vickery 2005 suggest to hard cap this value :
                 alpha2_simul_res = min(np.random.default_rng().normal(0,sigma,1),-3*sigma,3*sigma,key=abs)
                 alpha3 = max(0.015,alpha2_base+alpha2_simul_res) # Vickery 2005 : hard constraint
                 
                 # Find the decayed central pressure : 
                 pc_ip1 = 1013-(1013-pc0)*np.exp(-alpha3*lf_time_elapsed) 
                 Int_ip1 = np.nan # Relative intensity becomes unavailable if no SST to assess
                 ln_Int_ip1 = np.nan    
                 
                 # Find the Holland parameter : 
                 Holland_ip1 = tool_func.B_calc(tag,Holland_i,lf_time_elapsed) 
                 Holland_lf = Holland_ip1



         
             elif tag == 2 :
                 # Land to ocean (intensity reboot)
                 lf_time_elapsed +=6                     
                 delta_p_ip1 = (1013-pc0)*np.exp(-alpha3*lf_time_elapsed) 
                 pc_ip1 = 1013 - delta_p_ip1
                 
                 # Define the new Intensity upon re-entering water : 
                 T0_ip1 = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_p1,long_p1,timep1)
                 if lat_p1 > ref_lat : 
                     Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1, T0_ip1,RH=0.75,lat = lat_p1)                
                 else :
                     T0_ip1 = 203
                     Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1, T0_ip1)
                 
                 # Sometimes, the new relative intensity might not be sufficient - simply terminate the storm.
                 if Int_ip1 < 0 : 
                     break
                     
                 ln_Int_ip1 = np.log(Int_ip1)
                   
                 # Reset variables (see Vickery et al 2009)
                 ln_Int_im2 = ln_Int_ip1
                 ln_Int_im1 = ln_Int_ip1
                 # Force update this specific value.
                 ln_Int_i = ln_Int_ip1
                                     
                 if (lat_p1 > 18 and long_p1 < -81) : 
                     delta_p_gulf =delta_p_gulf + delta_p_ip1
                 else : 
                     delta_p_atlantic =delta_p_atlantic+ delta_p_ip1
                 RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)     
                 
                 # Compute Holland parameter :
                 Holland_ip1 = tool_func.B_calc(tag,RMW_ip1,lat_p1,SST_ip1,pc_ip1,eps_B)
     
             elif tag == 3 : 
                 # Ocean to ocean intensity update
                 # Intensity regression params :         
                 intensity_params = ast.literal_eval(hurr_param.loc[cell_id, H + "_kappa_coeffs_ed"])                    
                 kappa_coeffs = np.asanyarray(intensity_params[0])
                 kappa_res = np.asanyarray(intensity_params[1])
                 delta_sst = SST_ip1-SST_i
                 
                 Z = np.array([1,ln_Int_i,ln_Int_im1,ln_Int_im2,SST_i,delta_sst])

                 # New intensity values : 
                 ln_I_ip1_base = np.matmul(Z,kappa_coeffs)
                 simul_res_int = np.random.default_rng().standard_t(int(kappa_res[0]),size = 1)*kappa_res[1]
                 ln_Int_ip1 = float(ln_I_ip1_base+simul_res_int.item())
                 
                 if lat_p1 > ref_lat : 
                     delta_ln = ln_Int_ip1-ln_Int_i                     
                     ln_Int_ip1 = ln_Int_i+ math.copysign(delta_ln,1)*min(0.3,abs(delta_ln))
                 
                 Int_ip1 = np.exp(ln_Int_ip1) 

                 # Define the new central pressure : 
                 T0_ip1 = tool_func.interp_T0(air_temp_post_2015,air_temp,lat_p1,long_p1,timep1)

                 if lat_p1 > ref_lat : 
                    pc_ip1 = tool_func.I2pc(Int_ip1,SST_ip1,T0_ip1,RH=0.75,lat=lat_p1)                       
                 else :
                    T0_ip1 = 203
                    pc_ip1 = tool_func.I2pc(Int_ip1,SST_ip1,T0_ip1)                        
                 
                 if pc_ip1 > 1013 : 
                     pc_ip1 = 1013
                     
                     if lat_p1 > ref_lat : 
                         Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1,RH=0.75,lat=lat_p1)                         
                     else :
                         Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1)
                     if Int_ip1 <= 0 : 
                         Int_ip1 = 0 
                         ln_Int_ip1 = np.nan
                     else :
                         ln_Int_ip1 = np.log(Int_ip1)

                 # Check that maximum pressure defficit is satisfied (according to Emmanuel 1988):
                 if pc_ip1 < 860 :
                     pc_ip1 = 860
                     
                     if lat_p1 > ref_lat : 
                         Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1,RH=0.75,lat=lat_p1)                        
                     else :
                         T0_ip1 = 203
                         Int_ip1 = tool_func.pc2I(pc_ip1,SST_ip1,T0_ip1)
                     ln_Int_ip1 = np.log(Int_ip1)

                 delta_p_ip1 = 1013 - pc_ip1  # Returns a numpy array - which converts all others to arrays.

                 # Update RMW
                 if (lat_p1 > 18 and long_p1 < -81) : 
                     delta_p_gulf =delta_p_gulf+delta_p_ip1
                 else : 
                     delta_p_atlantic = delta_p_atlantic+delta_p_ip1
                 RMW_ip1 = tool_func.RMW_calc(delta_p_ip1,lat_p1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl)
                 
                 #Update Holland 
                 Holland_ip1 = tool_func.B_calc(tag,RMW_ip1,lat_p1,SST_ip1,pc_ip1,eps_B)

             #-----------------------------------------------------------------------------
             # Record speed / heading / Intensity for the new step : 
             hurr_ids.append(f'Hur-{simulation_id+1}-{hurr_i+1}')
             lat_rec.append(lat_p1)
             long_rec.append(long_p1)
             cell_rec.append(cell_idp1)
             c_rec.append(c_ip1)            
             theta_rec.append(theta_ip1)           
             land_rec.append(land_realm_ip1)        
             sst_failed_rec.append(sst_val)
             Pc_rec.append(pc_ip1)
             tag_rec.append(tag)
             RMW_rec.append(RMW_ip1)
             Int_rec.append(Int_ip1)
             delta_p_rec.append(delta_p_ip1)
             Holland_B_rec.append(Holland_ip1)
             time_rec.append(timep1)        
                        
             # Update variables for next iteration :  
             ln_Int_im2 = ln_Int_im1
             ln_Int_im1 = ln_Int_i
             

             try :
                 SST_i = SST_ip1
             except :
             # Sometimes, the second step will yield a land area and would break simulations                
                 pass
             pc_i = pc_ip1
             ln_Int_i = ln_Int_ip1
             Int_i = Int_ip1
             Holland_i = Holland_ip1
             
             c_i = c_ip1        
             
             theta_im1 = theta_i 
             theta_i = theta_ip1
             lat_i = lat_p1
             long_i = long_p1
             time = timep1
             land_realm_i = land_realm_ip1        
             
             
             # Update grid cell for next iteration
             coord = coord_ip1
             cell_id = cell_idp1        
             
             # Update the storm step :            
             j+=1
             i+=1    
             
             # Assert whether the storm simulation should be stopped or not :            
             if pc_i > 1013 : 
                     next_step = False               
             # Prevent storms from crawling to their final step :  
             if np.isclose(pc_i,1013,atol=1e-02) :
                     next_step = False           

     return(hurr_ids,time_rec,lat_rec,long_rec,cell_rec,c_rec,theta_rec,sst_failed_rec,land_rec,tag_rec,Pc_rec,Int_rec,RMW_rec,Holland_B_rec)
           
    
