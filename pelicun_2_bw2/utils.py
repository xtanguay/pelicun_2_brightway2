# -*- coding: utf-8 -*-
"""
Created on Wed Dec 21 09:10:25 2022

@author: xtang
"""

# Generic libraries
import numpy as np
import pandas as pd
from time import time

# LCA libraries
import brightway2 as bw
import presamples as ps

# Performance assessment library
#import pelicun
#from pelicun.base import Options, convert_to_MultiIndex
#from pelicun.base import set_options, convert_to_MultiIndex

## Note : remove "enconding : "utf-8" from presample module (utils/loader) - deprecated keywords in Python 3.9.
# The basic bw2calc MC w/ presamples requires the following edits : 
# presamples.reset_sequential_indices() -> commented out.  
# mc.presamples.update_matrices(advance_indices = False)  -> advance_indices = False must be added.



class PBD_setup : 
    def mapping_DS_to_LCI(loss_parameters) : 
    
        """
        Function imports a dataframe of damageable components (rows) linked to damage states (columns), returns a list
        of expected datasets to individually manage within the next assessment. 
        """
        
        # List the possible damage states using the median parameter as proof of the DS existing.
        DS_list = loss_parameters.columns.get_level_values(0).unique()
        DS_to_keep = []
        for DS in DS_list : 
            if DS.startswith('DS'):
                DS_to_keep.append((DS,'Theta_0'))
        # Iterate the dataframe rows (series of possible damage states are cleansed to keep only declared ones). 
        LCIs_to_list = []
        for i, j in loss_parameters[DS_to_keep].iterrows():  
            j = pd.Series.dropna(j)        
            for a,b in enumerate(j) :                                              
                LCIs_to_list.append(str(i[0]+' '+j.index[a][0]))
        LCIs_to_list = set(LCIs_to_list)
        return(LCIs_to_list)    
    
    def clean_dmg_df(PAL, loss_map= None) : 
        """
        Function to remove non-triggered damages from the damage sample. Also used to clean rows where an outcome is exclusive.
        This includes collapses and excessiveRID (collapse overrides excessiveRID and excessiveRID overrides individual
        repairs). 
        """
        
        # 1st, check that a damage assessment result is available (off PELICUN's results)
        if PAL.damage.sample is None : 
            raise ValueError('A damage sample must first be acquired in order to edit damage quantities.')
            
        dmg_data = PAL.damage.sample        
        dmg_data = dmg_data.loc[:,~PAL.damage.sample.columns.get_level_values(3).isin({"0"})] # look only where non 0s
        
        if loss_map is not None :
            # To do : make it loss_map specific or keyword specific
            indexes1 = dmg_data.loc[dmg_data['collapse'].values== 1].index.values # collapse triggered rows
        
            dmg_data.loc[indexes1,:] =int(0)        # Replace all collapsed rows with 0s
            dmg_data.loc[indexes1,'collapse'] = 1   # Replace with 1s only collapse columns
        
            indexes2 = dmg_data.loc[dmg_data['excessiveRID'].values== 1].index.values # excessiveRID triggered rows
            dmg_data.loc[indexes2,:] =int(0)                         # Replace all excessiveRID rows with 0s
            idx = pd.IndexSlice
            dmg_data.loc[indexes2,idx['excessiveRID','1','1']] = 1   # Replace with 1s only excessiveRID columns
        
        
            column_ids = dmg_data.loc[:,['excessiveRID']].columns.values.tolist() # List all rows with excessiveRID
            column_ids.remove(column_ids[0])        # Remove the first one (we'll keep this one, as it contains all the 1s)
            dmg_data.drop(column_ids, axis = 1, inplace = True) # Drop the ones which carry only 0s    
        return dmg_data
    

class LCA_setup : 
    def bw2_launch(name) :
        """
        Function to set the project and import the biosphere flows and LCIA methods all at once.
        
        """
        
        bw.projects.set_current(name) 

    
        # Getting the biosphere matrix :
        
        #bw.bw2setup()  # This will take some time 
                   # This will also generate the LCIA methods
        biosphere = bw.Database('biosphere3') # This will generate a variable that will hold the database itself.


        if (len(biosphere)< 1) or (len(bw.methods) < 1) : 
            print('Warning : The underlying bw2setup function is deprecated. Please set up project according to latest brightway2 recommandations on elementary flow and LCIA method import methods.')
              
        print(f'The number of flows in the biosphere database is : {len(biosphere)}.')
        
        
    def get_ei_db(ei_name, filepath = None) :
        """
        Function to import a background technosphere database - here the commercially available ecoinvent database.
        Optional argument : 
        Path == True : add a string argument leading to ecoinvent repository with corresponding ecospold2 files. 
        
        """
        # Generating the file path :    
        if filepath :
            try :
                fpeiXX = filepath
            except NameError:
                print('Filepath must point to a valid directory containing ecospold2 files.')
                return
                                            
        # First, let's check if the database has already been imported into the project (which would save quite alot
        # of time for the computer not to have to work for all those thousands of entries). If not, then the computer will 
        # load it using this command. 
    
        bw.databases
        if ei_name in bw.databases:
            print("This ecoinvent database has already been imported.")
        else:
            if filepath is None :
                fpeiXX = input('Add a string of text reaching the directory folder of ecospold2 files.')
            eixx = bw.SingleOutputEcospold2Importer(fpeiXX, ei_name)
            eixx.apply_strategies()
            eixx.statistics()
            try:
                eixx.write_database()
            except:
                print("Oops, It failed. Several options are available, but all hold their own risks.")
                eixx.write_excel()
                while True : 
                    try : 
                        Question = input("Do you wish to proceed by adding the unlinked flows to the biosphere database ? [y/n]")
                        if Question =="y" : 
                            print('Adding unlinked flows to the biosphere database.')
                            eixx.add_unlinked_flows_to_biosphere_database(biosphere_name='biosphere3')
                            eixx.write_database() # This will take some time !...
                            print("Done !")
                            break
                        if Question == "n" : 
                            print("Exiting")
                            print("Note : Other options are available under bw2io/importers")
                            break
                        else : 
                            print('Invalid input. Please use "y" for YES or "n" for NO.')
                    except :
                           print('something') 
        # This command will allow the computer to actualy access the content of the database.
        # Note : eixx is only an importer. It is not the database itself. To handle data within the database : 
    
        eidb = bw.Database(ei_name)
        print(f'This ecoinvent database is a square matrix of : {len(eidb)} datasets.')  # Making sure the import worked properly.
        return eidb
    
    def add_repairs_db_to_LCA(db_name) :
        """
        Function to create a new foreground database to match the performance assessment.
        """
        
        if db_name in bw.databases :
            print('The required database is already there.\nThe contained databases are :') 
            for db in bw.databases.list :
                print("\t",db)
        else :      
                Question = input("Do you wish to create a new database to store repairs LCI ? [y/n]")
                if Question =="y" : 
                    print("Adding {} to project.".format(db_name))
                    bw.Database(db_name).register()
    
                    print('The list of databases in this BW2 project are : ')
                    for db in bw.databases.list : 
                        print("\t",db)
                        
                if Question == "n" : 
                    print("Exiting") 
                    
    def add_damage_states_to_LCI(db_name,list_damages) :
        """
        Function to add a list of damage states to the foreground database. Afterwards, the damage states may be modelled in a 
        manual fashion or through a tool such as the Activity-browser's GUI. 
        """
        
        if db_name not in bw.databases :
            # Add the database
            LCA_setup.add_repairs_db_to_LCA(db_name) 
            # Generate a dictionary holding the new datasets to append.
            overarching_dict = {}
            for dataset in list_damages : 
                base_dict = {
                    "name" : dataset,
                    "unit" : "unit",
                    "location" : "GLO",
                    "reference product" : dataset,  # Required to fill the "Product output name"
                    "production amount" : 1.0,        # Required to run the database wide monte carlo step.
                    "type" : "process",
                    "exchanges" : [
                        {
                        "amount":1,
                        "input":(db_name,dataset),
                        "type":"production"                        
                },
                ],}
                overarching_dict.update({(db_name,dataset):base_dict}) 
            # Write the datasets to the new database : 
            target_db = bw.Database(db_name).write(overarching_dict)
            
        else :
    
        # Figure out, which datasets need to be added (lets not overwrite existing ones) : 
            new_datasets_list = []
            for dataset in list_damages : 
                try :
                    bw.Database(db_name).search(dataset)[0]
                except : 
                    new_datasets_list.append(dataset)    
            if not new_datasets_list : 
                print('No new dataset identified.')
                return
            print('Adding new datasets to existing database...')
        # Write the new datasets :     
            for dataset in new_datasets_list :        
                act = bw.Database(db_name).new_activity(**{
                    "name" : dataset, 
                    "code" : dataset,
                    "unit" : "unit",
                    "location" : "GLO",
                    "reference product" : dataset,  # Required to fill the "Product output name"
                    "type" : "process",                       
                })
                act.save()        
            
        # Add the basic exchange of production : 
                act.new_exchange(**{
                    "input":(db_name,dataset),
                    'amount': 1,
                    "type" : "production",
                    "unit" : "unit"
                }).save()
        print('Done!')
        
        
    def linking_DS_to_LCI(db_name1,db_name2,dmg_data,loss_map) :    
        """
        Function which take the output of the damage assessment and mapping between losses and damages to generate a tailored
        inventory of the structure's damage assessment.
        db_name1 : (new) foreground database linking indivual run results with triggerable damages from the pelicun damage sample.
        db_name2 : background database containing individual inventories per damage state. 
        dmg_data : Cleaned damage dataframe (see clean_dmg_df function).
        loss_map : mapping between damages and availalable losses (some damages may not yield direct correlation with losses). 
        """
        

        # Get damage assessment results. 
        ds_states = (dmg_data.columns.to_series())
    

        ds_states_means = dmg_data.mean()
        ds_with_repairs =[pair for pair in zip(ds_states,ds_states_means) if int(pair[0][3])!=0]
    
    
        
        # Make sure a database exists 
        if db_name1 not in bw.databases :
            # Add the database
            LCA_setup.add_repairs_db_to_LCA(db_name1) 
        # Generate a dictionary holding the new datasets to append.
        overarching_dict = {}
        # We only want triggered damages (we don't need the ones which aren't triggered) 
        for dataset in ds_with_repairs :
            dataset_name =  f'{dataset[0][0]}-cmp {dataset[0][1]}-dir {dataset[0][2]}-DS{dataset[0][3]}'
            
            
            mapped_ds = loss_map.loc[f'DMG-{dataset[0][0]}',loss_map.columns[0]]
            base_dict = {
                "name" :  dataset_name,
                "unit" : "unit",
                "location" : "GLO",
                "reference product" : dataset_name,
                "type" : "process",
                "exchanges" : [
                    {
                    "amount":0,#dataset[1],
                    "input":(db_name2,mapped_ds+f' DS{dataset[0][3]}'),
                    "type":"technosphere",
                        
    
    #                "uncertainty type":"2",
    #                "loc":np.log(dataset[1]),
    #                "scale":dataset[3],
    
            },{
                    "amount":1,
                   "input":(db_name1,dataset_name),
                   "type":"production"                        
            }
            ],}
            overarching_dict.update({(db_name1,dataset_name):base_dict}) 
    
        # We're interested to know the repairs associated with this building, the reference flow, for the whole repairs
        # can thus be added on top of previous datasets : 
        reference_flow_ds = {}
        list_exchanges = [{"amount" : 1,
                      "input" : (db_name1,key[1]),
                      "type": "technosphere"}  for key in overarching_dict.keys()
                         ]
        list_exchanges.append({
                      "amount":1,
                      "input":(db_name1,"Structure losses"),
                      "type":"production"   
        })
    
        reference_flow_ds = {
            "name" : "Structure losses",
            "unit" : "unit",
            "location" : "GLO",
            "reference product" : "Structure losses",
            "type" : "process",
            "exchanges" : list_exchanges        
        }
        
        overarching_dict.update({(db_name1,'Structure losses'):reference_flow_ds}) 
            #    Write the datasets to the new database : 
        target_db = bw.Database(db_name1).write(overarching_dict) 

    def presamples_setup(db_name1,db_name2,dmg_data,loss_map) : 
        """
        Function assesses the dmg dataframe to identify non-null datasets to switch values between presample runs
        db_name1 : foreground database linking indivual run results with triggerable damages from the pelicun damage sample.
        db_name2 : background database containing individual inventories per damage state. 
        dmg_data : Cleaned damage dataframe (see clean_dmg_df function).
        loss_map : mapping between damages and availalable losses (some damages may not yield direct correlation with losses).
        """

        
        dmg_array = np.array(dmg_data.T)
        
        ds_states = dmg_data.columns.to_series()
        dmg_indices = []
        for dataset in ds_states :  
            dataset_name =  f'{dataset[0]}-cmp {dataset[1]}-dir {dataset[2]}-DS{dataset[3]}'    
            mapped_ds = loss_map.loc[f'DMG-{dataset[0]}',loss_map.columns[0]]
            indice = ((db_name2, mapped_ds+f' DS{dataset[3]}'),(db_name1,dataset_name),'technosphere')
            dmg_indices.append(indice)
        
        dmg_matrix_data = [(dmg_array, dmg_indices, 'technosphere')]

        # Setting up presamples : 
        dmg_pp_id, dmg_pp_path = ps.create_presamples_package(
                matrix_data = dmg_matrix_data,
                seed = "sequential")
        return dmg_pp_path
    
    def uncertainty_DS_LCI() : 
        print('work in progress...')


class Presample_LCA_calculations : 

    def presample_lca(lca,n) : 
        """ 
        Function runs lca calculations on single indicator
        n : number of iterations
        """
        
        start = time()
        for i in range (n) : 
            if i == 0 : 
                lca.lci()
                lca.lcia()
            else:
                lca.presamples.update_matrices() 
                lca.redo_lci()
                lca.redo_lcia()
            print(i,lca.score)
        elapsed = time()-start
        print("Done in {:.2f} seconds".format(elapsed))

    def presample_mc(mc,m,n) :
        """
        Function runs monte carlo lca calculations on single indicator (uncertainty assessment included)
        m : number of presamples set to assess
        n : number of mc iterations per presample set
    
        # The basic bw2 MC + presamples requires the following edits : 
        # presamples.reset_sequential_indices() -> commented out.  
        # mc.presamples.update_matrices(advance_indices = False)
    
        """

        res = []
        start = time()
        for _ in range(m) : 
            scores = [next(mc) for _ in range(n)]
            #print(scores)
    
            mc.presamples.update_matrices(advance_indices = True)
            res.append(scores)
        elapsed = time() - start
        print("Done in {:.2f} seconds".format(elapsed))
        return(res)
    
        #Extracting results : 
        #t_scores = []
        #t_scores.append(scores)
        #df = pd.DataFrame(t_scores).T
        #df.to_excel('test.xlsx')
    
        # Notes : 
        # Usual MC simulations with presamples update matrices each step (+ get a reset), which is not the goal for this study.
        # The basic bw2 MC + presamples is thus edited : 
        # mc.presamples.update_matrices(advance_indices = False)
    
        # Useful function to "reset" progression within the presample inner indexes :
        #mc.presamples.reset_sequential_indices()
    
    
 
    

           
