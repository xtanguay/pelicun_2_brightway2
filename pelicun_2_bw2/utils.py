# -*- coding: utf-8 -*-
"""
Created on Wed Dec 21 09:10:25 2022

@author: xtang
"""

# Generic libraries
import numpy as np
import pandas as pd
from time import time
import scipy

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
        bw.projects.current
    
        # Getting the biosphere matrix :
        
        bw.bw2setup()  # This will take some time 
                   # This will also generate the LCIA methods
        biosphere = bw.Database('biosphere3') # This will generate a variable that will hold the database itself.
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
        
        # 1st, check that a damage assessment result is available (off PELICUN's results)
        #if PAL.damage.sample is None : 
        #    raise ValueError('A damage sample must first be acquired in order to link data with quantities.')
            
        #dmg_data = PBD_setup.clean_dmg_df(PAL)
    
        # Get damage assessment results. 
        ds_states = (dmg_data.columns.to_series())
    
        
        #log_ds = np.log(PAL.damage.sample)
        #log_ds_states_means = np.mean(log_ds,axis = 0)
        #log_ds_states_std = np.nanstd(log_ds, axis = 0)
        #log_ds_states_medians = log_ds.median()
        
        ds_states_means = dmg_data.mean()
        #ds_states_medians = PAL.damage.sample.median()
        #ds_states_std = PAL.damage.sample.std()
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

        
        # 1st, check that a damage assessment result is available (off PELICUN's results)
        #if PAL.damage.sample is None : 
        #    raise ValueError('A damage sample must first be acquired in order to link samples.')
            
        #dmg_data = PBD_setup.clean_dmg_df(PAL)
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
        # Estimate : m = 1000 runs (n = 1) equals to 3.6 minutes of computing for 1 indicator.
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
    
    def get_C_matrices(demand, list_of_methods):
        """ Return a dict with {method tuple:cf_matrix} for a list of methods
        Uses a "sacrificial LCA" with exactly the same demand as will be used
        in the MonteCarloLCA
        """
        C_matrices = {}
        sacrificial_LCA = bw.LCA(demand)
        sacrificial_LCA.lci()
        for method in list_of_methods:
            sacrificial_LCA.switch_method(method)
            C_matrices[method] = sacrificial_LCA.characterization_matrix
        return C_matrices

    def trace_dependent_db(database_name) : 
        """
        Iterate through a database to identify all possible database dependencies
        
        ## Note : if dependencies are not up to date, run a sacrificial LCA first (force update)
        
        """
        
        # Make a shallow copy from the 1st layer of dependent databases 
        master_list = list(bw.Database(database_name).metadata['depends'])
        
        # Initiate storage variables
        updated_depends = []
        
        # Initial differences :  
        diff_depends = len(master_list)-len(updated_depends)
        
        # Check all list elements for their own dependent databases :    
        while diff_depends > 0 : 
            
            # Shallow copy of the up to date master list : 
            updated_depends = list(master_list) 
            
            for db in master_list : 
                # Find closest dependents
                dependent_db = bw.Database(db).metadata['depends']
                
                # Add to the copy of the master list
                updated_depends.extend(dependent_db)

                # Clear duplicates
            updated_depends = list(set(updated_depends)) # Clear databases flagged already
            
            # Check if this iteration yields any change : 
            diff_depends = len([x for x in updated_depends if x not in master_list])
        
            master_list = updated_depends
            
        return master_list

    def col_IDs_to_names(database_name,biosphere = 'biosphere3') : 
        """
        Inputs:
        database_name : the name of the database which was used to generate LCA results (database of the reference flow)
        
        Outputs:
        Yields a dictionnary of Activity IDs as keys and legible Activity names as values. 
        """
     
        
        # Find dependents 
        dependents = trace_dependent_db(database_name)
        # Remove the biosphere from the list (not activities per say)
        dependents = [db for db in dependents if db != 'biosphere3']
        
        # Generate a sacrificial LCA to build indices : 
        sacrificial_LCA = bw.LCA({bw.Database(database_name).random():1})
        sacrificial_LCA.lci()
        
        
        # Map Activities : 
        #--------------------------------------------------------------------
        # Initiate a storage variable
        all_unique_activities_and_their_keys = defaultdict(list)
        
        # Start iterating to link datasets with IDs : 
        for db in dependents :
            for activity in bw.Database(db) : 
                if activity.key in sacrificial_LCA.activity_dict:
                    all_unique_activities_and_their_keys[f"{activity['reference product']},{activity['name']},{activity['location']}"].append(activity.key)
            
        # get a dictionnary of the IDs for all activities: 
        all_unique_columns_and_their_activities = {
            sacrificial_LCA.activity_dict[key[0]] : name 
            for name,key in all_unique_activities_and_their_keys.items()   
        }
            
        return(all_unique_columns_and_their_activities)

    def standardize_technosphere(mc_ps) : 
        """
        Disaggregation functions    
        """
        
        # Find total demand for aggregated datasets
        row_sums = mc_ps.technosphere_matrix.sum(axis=1)*(-1) # include a sign flip 
        # Row sums = 0 indicate the dataset is only an intermediate one (+1 on diagonal, -1 when consummed by another = 0)
        #reduced_sums = row_sums[np.nonzero(row_sums)]
        # Use the A/B LCA matrix format to isolate only the preaggregated datasets :
        reduced_sums = row_sums[np.nonzero(mc_ps.biosphere_matrix.sum(axis=0))[1]].T
        
        # Row sums = -1 indicate a non-triggered damage (+1 accounts for technosphere format of "1" as activity output) 
        filtered_sums = reduced_sums[:,np.where(reduced_sums!=-1)[1]]+1

        # Reduce the technosphere to match the row size of reduced_sum
        reduced_results = mc_ps.technosphere_matrix[np.nonzero(mc_ps.biosphere_matrix.sum(axis=0))[1],:]
        
        # Match the filtered sums row size
        filtered_results = reduced_results[np.where(reduced_sums!=-1)[1],:]

        # Standardize results relative to the total sum :
        sums_CSR_format = scipy.sparse.diags(1/filtered_sums.A.ravel())*(-1)
        standardized_technosphere = (sums_CSR_format @ filtered_results)

        # Remove production quantity columns
        standardized_technosphere.data[np.where(standardized_technosphere.data < 0)] = 0
        standardized_technosphere.eliminate_zeros()
        return standardized_technosphere

    def technosphere_col_IDs_to_act_name(LCA_obj,dependents):
        # Map Activities : 
        #--------------------------------------------------------------------
        # Initiate a storage variable
        all_unique_activities_and_their_keys = defaultdict(list)

        # Start iterating to link datasets with IDs : 
        for db in dependents :
            for activity in bw.Database(db) : 
                if activity.key in LCA_obj.activity_dict:
                    all_unique_activities_and_their_keys[(f"{activity['reference product']}")].append(activity.key)

        # get the columns for all elementary processes : 
        all_unique_columns_and_their_activities = {
            LCA_obj.activity_dict[key[0]] : name 
            for name,key in all_unique_activities_and_their_keys.items() 
        }    
     
        return all_unique_columns_and_their_activities

    def deaggregate_results(standardized_technosphere, a_score) : 
        # Disaggregate results according to component ID
        deaggregated_results = (a_score @ standardized_technosphere)
    
        return deaggregated_results
    
class SDF_LCA_calculations : 
    def create_SDF(db_name1,db_name2,PAL,loss_map,dmg_array):
        """
        Function which generates a Scenario difference dataframe (can then be exported to excel to run with the Activity-browser).
        Similar to the presamples library, very fast for regular LCA calculations, not as functional for Monte Carlo runs. 
        """
    
        # 1st, check that a damage assessment result is available (off PELICUN's results)
        if PAL.damage.sample is None : 
            raise ValueError('A damage sample must first be acquired in order to link samples.')
            
        dmg_data = PBD_setup.clean_dmg_df(PAL)
        ds_states = dmg_data.columns.to_series()
        dmg_indices = []
        for dataset in ds_states :          
            dataset_name =  f'{dataset[0]}-Story {dataset[1]}-dir {dataset[2]}-DS{dataset[3]}'    
            mapped_ds = loss_map.loc[f'DMG-{dataset[0]}',loss_map.columns[0]]
            indice = ((db_name2, mapped_ds+f' DS{dataset[3]}'),(db_name1,dataset_name),'technosphere')
            dmg_indices.append(indice)
        
        dmg_matrix_data = pd.DataFrame(dmg_array, dmg_indices)
        dmg_matrix_data.columns = ['S_' + str(col) for col in dmg_matrix_data.columns]    
        
        #from
        act_name = []
        ref_prod = []
        loc1 = []
        database1 = []
    
        #to
        act_name2 = []
        ref_prod2 = []
        loc2 = []
        database2 = []
    
        for row in dmg_matrix_data.index :
            database1.append(row[0][0])
            act_name.append(bw.Database(row[0][0]).get(row[0][1])['name'])
            ref_prod.append(bw.Database(row[0][0]).get(row[0][1])['reference product'])
            loc1.append(bw.Database(row[0][0]).get(row[0][1])['location'])
        
            database2.append(row[1][0])
            act_name2.append(bw.Database(row[1][0]).get(row[1][1])['name'])
            ref_prod2.append(bw.Database(row[1][0]).get(row[1][1])['reference product'])
            loc2.append(bw.Database(row[1][0]).get(row[1][1])['location'])
    
    
        dmg_matrix_data.insert(0,'from activity name',act_name)
        dmg_matrix_data.insert(1,'from reference product',ref_prod)
        dmg_matrix_data.insert(2,'from location',loc1)
        dmg_matrix_data.insert(3,'from categories',pd.Series(dtype = 'string'))
        dmg_matrix_data.insert(4,'from database',database1)
        dmg_matrix_data.insert(5,'from key',pd.Series(dtype = 'string'))
        dmg_matrix_data.insert(6,'to activity name',act_name2)
        dmg_matrix_data.insert(7,'to reference product',ref_prod2)
        dmg_matrix_data.insert(8,'to location',loc2)
        dmg_matrix_data.insert(9,'to categories',pd.Series(dtype='string'))
        dmg_matrix_data.insert(10,'to database',database2)
        dmg_matrix_data.insert(11,'to key',pd.Series(dtype = 'string'))
        dmg_matrix_data.insert(12,'flow type','technosphere')
        
        return dmg_matrix_data   
    

           
