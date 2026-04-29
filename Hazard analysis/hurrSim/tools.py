# -*- coding: utf-8 -*-
"""
Created on Fri Jul 21 11:10:22 2023

@author: xtang
"""


import numpy as np
import pandas as pd
from math import radians,atan2,sin,cos,acos,asin,pi,acos,sqrt,ceil,atan,atan2
#from math import radians, cos, sin, asin, sqrt, atan2
import datetime
import xarray as xr
import warnings
from scipy.optimize import fsolve
from scipy.stats import gennorm

from cftime import DatetimeNoLeap

# Check if coordinate is land ?
import shapely.geometry as sgeom
import cartopy.io.shapereader as shpreader
from shapely.ops import unary_union
from shapely.prepared import prep

class tool_func(): 

    def coord_id_assign(selected_coord,grid_system,lat_range,long_range) :
        """
        Returns the grid id value based on the latitude and longitude inputs.
        
            No checks were implemented against negative latitude values. Range should be 0 to 180 degrees (lon) 
            or 90 degrees (lat).
            
            selected_coord is in the format "latitude, longitude", as in : selected_coord = (lat,long)
            
        """
        y = selected_coord[0]
        x = selected_coord[1]
    
        
        # Check that the selected coordinates fit the grid-system : 
        if x < np.amin(long_range) or x > np.amax(long_range) :
            raise ValueError ('The longitude coordinate exceeded the range!')
                
        if y < np.amin(lat_range) or y > np.amax(lat_range) :
            raise ValueError ('The latitude coordinate exceeded the range!')
            
        # Ensure that if a datapoint is exactly on the far left edge, it still is accounted for : 
        if x == np.amax(long_range) :
            x= x-0.000001
        
        # Ensure that if a datapoint is exactly on the admitted latitude, it still is accounted for : 
        if y == np.amax(lat_range) : 
            y = y-0.000001 
        
        x_id = np.digitize(x,long_range,right = False)
        y_id = np.digitize(y,lat_range,right= False)
        cell_val = grid_system[-y_id,-x_id]
        
        return(cell_val)
    
    def convert_angle_180(angle):
        """
        Convert angles to the limits as trained in the regression coefficients. Will also allow to properly identify
        which sets of coefficients to use : 
        Returns (+) when in 0 to 180 degrees (starting North)
        Returns (-) when in 0 to -180 degrees (starting North)
        """
        angle = np.deg2rad(angle)
        new_angle = np.arctan2(np.sin(angle), np.cos(angle))
        return np.rad2deg(new_angle)  #*(180/np.pi)
    
    
    def haversine_destination(lat_i,long_i,theta_ip1,dist, R = 6372.8*1000) :
        """
        Calculate final coordinates based on initial coordinates, initial bearing and speed
        All inputs in degrees. Unless specified, R is 6372.8 km (earth's radius, converted to meters).
        All outputs in degrees.
        
        See : 
        http://www.movable-type.co.uk/scripts/latlong.html
    
        """
        # Distance, relative to the earth's radius : 
        d_r = (dist/R)
    
        # Converting to radians : 
        lat_i_rad = radians(lat_i)
        long_i_rad = radians(long_i)
        theta_ip1_rad = radians((theta_ip1)) 
    
        # New latitude (in radians) :
        lat_p1 = (asin(sin(lat_i_rad)*cos(d_r)
                      +cos(lat_i_rad)*sin(d_r)*cos(theta_ip1_rad)))
        # New longitude (in radians) : 
        long_p1 = (long_i_rad + 
            atan2(sin(theta_ip1_rad)* sin(d_r) * cos(lat_i_rad),cos(d_r)-sin(lat_i_rad)*sin(lat_p1)))
    
        # Output everything as degrees : 
        return(lat_p1*(360/(2*np.pi)),long_p1*(360/(2*np.pi)))
    
    
    # Define is_land function : 
    #land_shp_fname = shpreader.natural_earth(resolution='50m',category ='physical',name='land')
    #land_shp_fname = shpreader.natural_earth(resolution='110m',category ='physical',name='land')
    
    # Custom landmap (removing some islands) : 
    land_shp_fname = '50m_land_edited.shp'
    
    land_geom = unary_union(list(shpreader.Reader(land_shp_fname).geometries()))
    land = prep(land_geom)
    def is_land(long, lat):
        """
        Function to assert whether a longitude-latitude pair is overland or at sea.
        """
        return tool_func.land.contains(sgeom.Point(long, lat))
    
    def interp_SST(hadsst_pre1870,hadsst_post2020,hadsst,lat_p1,long_p1,timep1,ref_date1 = '1870-02',ref_date2 = '2020-01') : 
        """
        Find the next Sea surface temperature at the identified coordinate
        """
        ref_date1 = datetime.datetime.strptime(ref_date1,"%Y-%M")
        ref_date2 = datetime.datetime.strptime(ref_date2,"%Y-%M")
        
        # Check if the hurricane stems from a pre-1870 dataset :
        if timep1 < ref_date1 : 
            SST_ip1 = hadsst_pre1870.interp(latitude=lat_p1,longitude =long_p1,month=timep1.month).sst.item()
            if np.isnan(SST_ip1) :
                SST_ip1 = hadsst_pre1870.interp(latitude =lat_p1, longitude =long_p1, month= timep1.month, method = 'nearest').sst.item()                   
        # Check if the hurricane stems from a post-2020 dataset : 
        elif timep1 > ref_date2  :        
            SST_ip1 = hadsst_post2020.interp(latitude=lat_p1,longitude =long_p1,month=timep1.month).sst.item()
            if np.isnan(SST_ip1) :
                SST_ip1 = hadsst_post2020.interp(latitude =lat_p1, longitude =long_p1, month= timep1.month, method = 'nearest').sst.item()
        # Else, the main dataset may be searched right away : 
        else :
            SST_ip1 = hadsst.interp(latitude =lat_p1, longitude =long_p1, time = timep1).sst.item()
            if np.isnan(SST_ip1) :
                SST_ip1 = hadsst.interp(latitude =lat_p1, longitude =long_p1, time=timep1, method = 'nearest').sst.item()    
        return SST_ip1
    
    def interp_T0(air_temp_post_2015,air_temp,lat_i,long_i,time_i) :
        """
        Find the stratosphere temperature (100 mbar) :   
        """
        # Small fix in case an edge case is encountered (where the longitude nears the edge of T0 dataframe) :
        if long_i > -1 : 
            long_i = -1.01 
        
        # Check if the hurricane is a post-2015 dataset : 
        if (time_i.year > 2015) : 
            T0 = air_temp_post_2015.interp(lat=lat_i,lon =long_i+360,time=time_i).air.item()
        else : 
            T0 = air_temp.interp(lat=lat_i,lon =long_i+360,time=time_i).air.item()
            
        #print(T0) # ranges 198 to 220 -> if above 203 : less efficient, below 203 : more efficient
        #T0 = max(T0,203)
        #T0 = min(T0,203)
        
        # Internal testing showed the model converges only when T0 is set to 203 Kelvin (as required by Vickery 2000)
        #T0 = 203 
        return T0
    
    def I2pc(I,SST_ip1,T0_ip1, RH = 0.80, Rv = 461.5,lat = None) : 
        """
        Convert relative intensity measure to central pressure : 
        """
        
        eps = (SST_ip1-T0_ip1)/SST_ip1
        Lv = (2.5*10**6)-2320*(SST_ip1-273)
        e_s = 6.112*np.exp((17.67*(SST_ip1-273))/(SST_ip1-29.5))
        pda = 1013-(RH*e_s)
        A = (eps*Lv*e_s)/((1-eps)*Rv*SST_ip1*pda)
        B = RH*(1+(e_s*np.log(RH))/(pda*A)) 
        
        if lat : 
            x = tool_func.find_x_v2(A, B)
        else : 
            x = tool_func.find_x(A,B)
        #x = tool_func.find_x(A,B) 
        pc = 1013+e_s*(1-RH)-I*pda*(1-x)
        return pc
    
    # Use a function decorator to avoid having every other call to numpy raising everything in other functions :
    @np.errstate(all='raise')    
    def pc2I(pc, SST_ip1 , T0_ip1 , RH = 0.80, Rv = 461.5,lat = None) :
        """
        Convert central pressure to Relative intensity measure : 
        """
        eps = (SST_ip1-T0_ip1)/SST_ip1
        Lv = (2.5*10**6)-2320*(SST_ip1-273)
        e_s = 6.112*np.exp((17.67*(SST_ip1-273))/(SST_ip1-29.5))
        pda = 1013-(RH*e_s)
        A = (eps*Lv*e_s)/((1-eps)*Rv*SST_ip1*pda)
        B = RH*(1+(e_s*np.log(RH))/(pda*A)) 
        
        if lat : 
            x = tool_func.find_x_v2(A, B)
        else : 
            x = tool_func.find_x(A,B)
        
        #x = tool_func.find_x(A,B)  
        I = (1013-pc+(1-RH)*e_s)/((1-x)*(1013-(RH*e_s)))    
        return I[0]
    
    # Use a function decorator to avoid having every other call to numpy raising everything in other functions :
    @np.errstate(all='raise') 
    def central_pressure_exp_eq(x,A,B) :
        """
        Nonlinear equation to solve for x. Using Emmanuel 1988's formulation.
        """
        return np.exp((-A/x+B*A))-x
        
    # Use a function decorator to avoid having every other call to numpy raising everything in other functions :
    @np.errstate(all='raise')     
    def find_x(A,B):    
        x1 = 0.1 # Try and converge from very close to 0
        x2 = 11  # Try and converge far from zero
        xtol_i = 1.0e-08 #base value for xtol according to scipy documentation : 1.49012e-08
        
        # Don't let numpy move on silently if a calculation fails :
        with warnings.catch_warnings():
            warnings.filterwarnings("ignore",category = RuntimeWarning ,message="The iteration is not making good progress*")   
            try : 
                s1 = fsolve(tool_func.central_pressure_exp_eq,x0=x1,args = (A,B),xtol=xtol_i)
                s2 = fsolve(tool_func.central_pressure_exp_eq,x0=x2,args=(A,B),xtol=xtol_i)
    
                #s = max(s1,s2)
                s=min(s1,s2)
            except :
                # In some cases, division by zero will occur. Also, convergence might fail. Try and converge closer from 1
                s = fsolve(tool_func.central_pressure_exp_eq,x0=0.7,args = (A,B),xtol=xtol_i)
                if s == 0 :
                    print('Solving pc failed!')
                    s = np.nan
                pass
        return s

    # Use a function decorator to avoid having every other call to numpy raising everything in other functions :
    @np.errstate(all='raise')     
    def find_x_v2(A,B):    
        x1 = 0.1 # Try and converge from very close to 0
        x2 = 11  # Try and converge far from zero
        xtol_i = 1.0e-08 #base value for xtol according to scipy documentation : 1.49012e-08
        
        # Don't let numpy move on silently if a calculation fails :
        with warnings.catch_warnings():
            warnings.filterwarnings("ignore",category = RuntimeWarning ,message="The iteration is not making good progress*")   
            try : 
                s1 = fsolve(tool_func.central_pressure_exp_eq,x0=x1,args = (A,B),xtol=xtol_i)
                s2 = fsolve(tool_func.central_pressure_exp_eq,x0=x2,args=(A,B),xtol=xtol_i)
    
                s = max(s1,s2)
                #s=min(s1,s2)
            except :
                # In some cases, division by zero will occur. Also, convergence might fail. Try and converge closer from 1
                s = fsolve(tool_func.central_pressure_exp_eq,x0=0.7,args = (A,B),xtol=xtol_i)
                if s == 0 :
                    print('Solving pc failed!')
                    s = np.nan
                pass
        return s

    
    def RMW_calc(delta_p_ip1,lat_ip1,delta_p_atlantic,delta_p_gulf,eps_Gulf,eps_Atl) :
        # Sample the random errors (Vickery and Wadhera 2008) :
        
        # Gulf of Mexico : 
        #if delta_p_ip1 <= 100 :
        #    eps_Gulf = np.random.default_rng().normal(0,0.396)
            
        #if 100 < delta_p_ip1 <= 120 :
        #    sigma_Gulf = 1.424-0.01029*delta_p_ip1
        #    eps_Gulf = np.random.default_rng().normal(0,sigma_Gulf)
        
        #if delta_p_ip1 > 120  :
        #    eps_Gulf = np.random.default_rng().normal(0,0.19)
        
        # Atlantic Hurricanes : 
        #if delta_p_ip1 <= 87 : 
        #    eps_Atl = np.random.default_rng().normal(0,0.448)
        #if 87 < delta_p_ip1 <= 120 : 
        #    sigma_Atl = 1.137-0.00792*delta_p_ip1
        #    eps_Atl = np.random.default_rng().normal(0,sigma_Atl)
        #if delta_p_ip1 > 120 : 
        #    eps_Atl = np.random.default_rng().normal(0,0.186)        
        
        eps_Gulf = np.random.default_rng().normal(0,0.390)
        eps_Atl = np.random.default_rng().normal(0,0.441)    
        
        # Gulf value estimate
        RMW_Gulf = np.exp(3.859-7.7*(10**(-5))*(delta_p_ip1**2)+eps_Gulf)    
            
        # Atlantic value estimate
        RMW_Atl = np.exp(3.015-6.291*(10**(-5))*(delta_p_ip1**2)+0.0337*lat_ip1+eps_Atl)    
    
        # Weighting factor :
        a_RMW = delta_p_atlantic/(delta_p_atlantic+delta_p_gulf)   
    
        # RMW statistical model 
        RMW = a_RMW*RMW_Atl + (1-a_RMW)*RMW_Gulf
        return RMW
    
    def assign_decay_region(lat_i,long_i) : 
        """
        Returns one of four coarsely programmed regions : 
        #1 : Gulf of Mexico coast 
        #2 : Florida peninsula coast
        #3 : New England coast
        #4 : Mid-Atlantic coast (not specificly programmed)
        """
        regions = {'Gulf coast':{
                        'lat_min':0,
                        'lat_max':65,
                        'long_min':-115,
                        'long_max':-85},
                   'Florida peninsula coast':{
                        'lat_min':0,
                        'lat_max':30,
                        'long_min':-85,
                       'long_max':-80},
                    'New England coast':{
                       'lat_min':40,
                       'lat_max':65,
                       'long_min':-85,
                       'long_max':0},
                  # Mid-Atlantic coast is not programmed, as it encompasses all other cases.
                   #'Mid-Atlantic coast':{
                   #    'lat_min':,
                   #    'lat_max':,
                   #    'long_min':,
                   #    'long_max':}              
                  }
    
        for region, bounds in regions.items() :
            long_comparison = False
            lat_comparison = False
            
            lat_comparison = bounds['lat_min'] < lat_i < bounds['lat_max']
            long_comparison = bounds['long_min'] < long_i < bounds['long_max']
            
            if (lat_comparison == True & long_comparison == True) :
                return region
    
        return 'Mid-Atlantic coast'
    
    def B_calc(tag,*args) : 
        """
        Tag identifies if storm should be assessed as overwater or in landfall situation
        Appropriate arguments should be passed to fulfill the modeling : 
        
        Overland :
        tag    = tag (actual tag assigned by the simulation)
        arg[0] = B0 (Holland parameter at landfall)
        arg[1] = t  (time since landfall)
    
        Overwater :
        tag    = tag (actual tag assigned by the simulation)
        arg[0] = RMW (Radius of maximum winds) - in meters
        arg[1] = lat (latitude) - in degrees
        arg[2] = Ts (Sea surface temperature at the eye of the storm) - in degrees Kelvin (automaticly converted by algorithm)
        arg[3] = pc (Central pressure at the eye of the storm) in milibars
        arg[4] = eps_B (Sampling error term for Holland parameter)
        """
        #Overland 
        if tag in [0,1] : 
            B0 = args[0]
            t = args[1]
            alpha_param = 0.0291-0.0429*B0
            alpha_H = min(alpha_param,-0.005) 
            Holland_B = B0*np.exp(alpha_H*t)
            sqrtA = np.nan
            eps_B = np.nan
            Ts = np.nan
            Hollandv2 = np.nan
    
        #Overwater 
        else :
            RMW = args[0]*1000     # kilometers to meters conversion
            lat = args[1]*np.pi/180 # degrees to radians conversion
            Ts = args[2] - 273 # kelvins to degrees celsius  
            pc = args[3] # in milibar
            eps_B = args[4] #taken from a normal distribution
            
            # If the storm is ending - simply cut short calculations 
            if pc >= 1013 :
                Holland_B = 0 
                sqrtA = np.nan
                #eps_B = np.nan
                Hollandv2 = np.nan
                #return Holland_B, sqrtA,Ts,Hollandv2
                return Holland_B
            
            f = 2*(2*np.pi/(3600*23+56*60+4.1))*np.sin(lat)  # Coriolis frequency   (rad/sec)   
            Rd = 287 # J/Kelvin.kg        
            
            delta_p = 1013 - pc
            
            #eps_B = np.random.default_rng().normal(0,0.226)
            A = RMW*f/(np.sqrt(2*Rd*Ts*np.log(1+delta_p/(pc*np.exp(1)))))
            Holland_B = 1.7642-1.2098*np.sqrt(A)+eps_B    
            sqrtA = np.sqrt(A)
            Hollandv2 = 1.38+0.00184*delta_p-0.00309*RMW/1000
            
            
        return Holland_B
        #return Hollandv2        
        #return Holland_B,sqrtA,eps_B,Ts,Hollandv2
        #return Holland_B,sqrtA,Ts,Hollandv2
        
        
    def bearing(y1,x1,y2,x2): 
        """"
        Returns the bearing angle (North = 0), positive counter clockwise. Converts data to rad and outputs 
        bearing angle in rad.
        """
        rady1 = radians(y1) 
        radx1 = radians(x1)
        rady2 = radians(y2)
        radx2 = radians(x2)
        
        y = sin(radx2-radx1) * cos(rady2)
        x = cos(rady1) * sin(rady2) - sin(rady1) * cos(rady2) * cos(radx2-radx1)
        bearing_angle = atan2(y,x)
        return bearing_angle
    
    def haversine_distance(y1,x1,y2,x2,R=6372.8*1000) :
        """
        Find the true distance between two points in spherical coordinates.
        """
        dLat = radians(y2 - y1)
        dLon = radians(x2 - x1)
        lat1 = radians(y1)
        lat2 = radians(y2)
    
        a = sin(dLat/2)**2 + cos(lat1)*cos(lat2)*sin(dLon/2)**2
        c = 2*asin(sqrt(a))
        return R * c     
        
   
    def min_geodesic_dist(p1,p2,p3,R = 6372.8*1) :
        
        """
        Returns the shortest arc distance (in km by default) between a geodesic (arc on a sphere generating a great arc circle) 
        and a point on the sphere.
        To do so, it analyses 3 cases : 
        (1) : The point yields an obtuse angle versus plane created by the geodesic the first dataset ;
        (2) : The point yields an acute angle and is somewhere between the two points defining the geodesic plane ;
        (3) : The point yields an acute angle but is beyond the 2nd point defining the geodesic plane.
        
        p1 : Coordinate 1 (base value for geodesic), using (lat,long) format.
        p2 : Coordinate 2 (second value for geodesic), using (lat,long) format.
        p3 : Coordinate 3 (the point), using (lat,long) format.
        
        R = 6372.8*1000  # Earth's radius. 
        
        Credits for inspiration and taken from : 
        http://www.movable-type.co.uk/scripts/latlong.html
        https://stackoverflow.com/questions/20231258/minimum-distance-between-a-point-and-a-line-in-latitude-longitude?noredirect=1&lq=1
        https://stackoverflow.com/questions/32771458/distance-from-lat-lng-point-to-minor-arc-segment
        
        """    
        # Step 1 : Find bearing A to C 
        bearingAC = tool_func.bearing(p1[0],p1[1],p3[0],p3[1])
        # Step 2 : Find bearing A to B
        bearingAB = tool_func.bearing(p1[0],p1[1],p2[0],p2[1])   
        # Distance A to C : 
        distanceAC = tool_func.haversine_distance(p1[0],p1[1],p3[0],p3[1],R)
        
        
        #print(f'Bearing AC is:{bearingAC*(360/(2*pi))}')
        #print(f'Bearing AB is :{bearingAB*(360/(2*pi))}')
        #print(f'The AC distance is :{distanceAC}')
        
        # Angular difference : 
        diff = abs(bearingAC-bearingAB)
        #print(f'The bearing diff is :{diff*(360/(2*pi))}')
        if diff > pi :
            diff = 2*pi-diff
            #print(f'After correction:{diff*(360/(2*pi))}')
            
        # Select between the three cases : 
        # Case 1 : the angle is checked at point A and is obtuse, the cross-track distance yields a distance 
        # which is out of the bounds AB :
        if diff > pi/2 : 
            dxa = distanceAC
            along_path_ratio = 0
        # Case 2 & 3 : the angle is acute, thus the point projects either on the geodesic AB or beyond :
        else :
            # 1st : Compute distance between point and great-circle path :
            dxt = asin(sin(distanceAC/R)*sin(bearingAC-bearingAB))*R
            # 2nd : Compute distance between 2 start and end point of the great-circle path : 
            distanceAB = tool_func.haversine_distance(p1[0],p1[1],p2[0],p2[1],R)       
            # 3rd : Compute the along-track distance from point A to find how far from A the point C lands on the great-circle.
            distanceAC_along = acos(cos(distanceAC/R) / cos(dxt/R) )*R
            
        # Case 2 : the point projects on the geodesic AB : 
            if distanceAC_along> distanceAB :
                dxa = tool_func.haversine_distance(p2[0],p2[1],p3[0],p3[1])
                along_path_ratio = 1
        # Case 3 : the point projects beyond the geodesic AB : 
            else : 
                dxa = abs(dxt)
                along_path_ratio = distanceAC_along/distanceAB
        return dxa, along_path_ratio


    def assign_date(DOY_df,year = 2100):
        """
        Returns a sampled datetime object from a generalized normal distribution
        
        DOY_df :
        |'beta'|'loc'|'scale'|
        |  X   |  X  |   X   |
        
        """
        
        # Samples a day of the year
        DOY_sample = gennorm.rvs(beta=DOY_df['beta'][0],scale=DOY_df['scale'][0],loc=DOY_df['loc'][0],size=1)
        
        DOY_sample = max(np.array([0.0]),DOY_sample)
        DOY_sample = min(np.array([364]),DOY_sample) # Prevent storms from initiating on the last day of the year



        # Assign datetime
        date=pd.to_datetime(DOY_sample,unit='D',origin=pd.Timestamp(year-1970,unit='Y'))
        # Year is based off difference between true year and Unix time. 

        date1 = date
        
        # 6 hour round-off (to match conventional Hurdat data)
        date = date.floor('6h')   
        
        return date

    def interp_SST_i(sst,lat_p1,long_p1,timep1) : 
        """
        Find the next Sea surface temperature at the identified coordinate with lat-lon variables
        """
        # Else, the main dataset may be searched right away : 

        SST_ip1 = sst.interp(lat =lat_p1, lon =long_p1, time = timep1).tos.item()
        if np.isnan(SST_ip1) :
            SST_ip1 = sst.interp(lat =lat_p1, lon =long_p1, time=timep1, method = 'nearest').tos.item()    
        return SST_ip1

    def interp_T0_i(air_temp,lat_i,long_i,time_i) :
        """
        Find the stratosphere temperature (100 mbar) :   
        """
        # Small fix in case an edge case is encountered (where the longitude nears the edge of T0 dataframe) :
        if long_i > -1 : 
            long_i = -1.01 
        
        T0 = air_temp.interp(lat=lat_i,lon =long_i,time=time_i).ta.item()
            
        return T0

    
    def set_time(DOY,yr):
        if type(DOY) == str :
            time = datetime.datetime.strptime(DOY,'%Y-%m-%d %H:%M:%S')
            time = time.replace(year = yr)
            time_nl = DatetimeNoLeap(time.year,time.month,time.day,time.hour,)
             
        if isinstance(DOY,pd.DataFrame):
            time = tool_func.assign_date(DOY,year = yr)
            # Might need an adjustment to prevent storms from begining at 2100-12-31 (would go off simulation bounds)
            time = datetime.datetime.strptime(time.strftime('%Y-%m-%d %H:%M:%S')[0],'%Y-%m-%d %H:%M:%S')
            time_nl = DatetimeNoLeap(time.year,time.month,time.day,time.hour,)
            
        return(time,time_nl)
