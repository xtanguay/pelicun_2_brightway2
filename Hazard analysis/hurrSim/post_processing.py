# -*- coding: utf-8 -*-
"""
Created on Mon Jan 22 09:56:55 2024

@author: xtang
"""

import pandas as pd
import numpy as np
from .tools import tool_func



def approaching_hurr2MP(name,data,mileposts,search_boundaries, era = 'Simulated') : 
    
    if era == 'Simulated' :   
        extended_hurr_sim_db = pd.concat([data,data[['latitude','longitude','c_i','theta_i','pc','RMW','Holland B']].shift(-1).add_prefix('next_')],axis=1)
    if era == 'Historical' : 
        extended_hurr_sim_db = pd.concat([data,data[['latitude','longitude','maximum_pressure']].shift(-1).add_prefix('next_')],axis=1)
        

    # Pre-filter the coordinates : 
    extended_hurr_sim_db = extended_hurr_sim_db.loc[
        (extended_hurr_sim_db['latitude']< search_boundaries[0]) & (extended_hurr_sim_db['latitude']> search_boundaries[1])
        | 
        (extended_hurr_sim_db['next_latitude'] < search_boundaries[0]) & (extended_hurr_sim_db['next_latitude'] > search_boundaries[1])
        &
        (extended_hurr_sim_db['longitude']< search_boundaries[2]) & (extended_hurr_sim_db['longitude']> search_boundaries[3])
        |
        (extended_hurr_sim_db['next_longitude']< search_boundaries[2]) & (extended_hurr_sim_db['next_longitude']> search_boundaries[3])                    
    ]


    for milepost in mileposts.iterrows() : 
        distances = []
        for row in extended_hurr_sim_db.iterrows() :
            # Initial coord :
            #p1 = (row[1][2],row[1][3])
            p1 = (row[1]['latitude'],row[1]['longitude'])
            #calc_values_p1 = row[1][10]

            # Final coord :
            p2 = (row[1]['next_latitude'],row[1]['next_longitude'])
            #calc_values_p2 = row[1][16]
            if any(coord is None for coord in p2):
                p2 = (np.nan,np.nan)
                
            # Target coord : 
            p3 = (milepost[1].iloc[0],milepost[1].iloc[1])

            # On final hurricane coordinate (last dataframe row), there is no "point #2"
            if np.isnan(p2[0]) == True :
                cross_dist = tool_func.haversine_distance(p1[0],p1[1],p3[0],p3[1])/1000
                if cross_dist < 250 : 
                    distances.append([cross_dist,0])                  
                else : 
                    distances.append(np.nan)
            # For all rows that are not the last : 
            else :
                cross_dist,dx = tool_func.min_geodesic_dist(p1,p2,p3)
                if cross_dist < 250 :
                    distances.append([cross_dist,1])
                else : 
                    distances.append(np.nan)

        extended_hurr_sim_db[f'Milepost pts {milepost[0]+1}'] = distances
        
    return extended_hurr_sim_db
    
    
def mp_approaching_hurr2MP(*args,**kwargs) : 
    
    # Initiate a storage variable
    recording_db = pd.DataFrame()
    
    # Worker info : 
    chunk_id = args[-1] ## State the ID of the worker taking over the chunk 
    group_ids = args[0][chunk_id]  # Finds which sub-group the worker deals with
    
    # Unpack the data : 
    grouped_hurrs = args[1]     # All the corresponding simulated hurricanes
    MP_list = args[2]           # Mileposts to investigate
    search_boundaries = args[3] # Boundaries for which it is not necessary to compute
    
    era1 = kwargs['era']        # Assessment mode ("Historical" or "Simulated")

    # Start working with the data : 
    for df_key in group_ids : 
        data = grouped_hurrs.get_group(df_key)
        result = approaching_hurr2MP(df_key,data,MP_list,search_boundaries,era=era1)
        recording_db = pd.concat([recording_db,result]).sort_index()
        
    return recording_db, len(group_ids)
 
   
     
