# Overview

The files associated with case study 1 (component-based assessment) enable to recreate from scratch the assessment for the 19 story steel moment resisting frame building. Notebooks C to E focus exclusively on using pelicun_2_bw2. Essential files are provided for this purpose : 

1. Relevant wind speeds.xlsx contains the hazard curve details. 
2. building_EDPs.xlsx and building_EDPs_correlations.xlsx contains the engineering demand parameters.
3. Component marginals.xlsx describes the building content for damage analysis. 
4. Inventory Building to P2B.xlsx describes the life-cycle inventory to implement in brightway2.
5. selected_LCIA_methods.xlsx indicates the selected LCIA indicators for this assessment. Note that Impact World+ LCIA indicators are not typically pre-loaded with an ecoinvent biosphere, thus it is necessary to pre-load it beforehand (see [ImpactWorld+](https://zenodo.org/records/18892673)'s download page). This file should be inserted under "path_to_pre_sampled_MC_simulations/database_name/results/reference_files".  

* Notebook C: Generates the asset performance assessment. 
* Notebook D: Post-processes the results to the integrated heatmap and histogram results.
* Notebook E: Post-processes the results to expected annual loss curves. 


## Recreating the structural model outputs:
If the focus is towards recreating the structural model simulation outputs, the additional software requirements are as follows: 

1. OpenSees version 3.6.0. 
2. WEUQ version 4.3.0
3. OpenSeespy version 3.6.0 (required to convert Tokyo Polytechnique University wind to a 2D file input). 

Furthermore, the WEUQ software is modified as follows:
* In the local install files of WEUQ (i.e. "...\WEUQ_software\applications\createEVENT\experimentalWindForces\") swap : convertWindMat.py & experimentalWindForces.py with the four files from "0 - Create2D wind event\Modifications files - WEUQ\" 

The files within folder *0 - Create 2D wind event* are leveraged to process Tokyo Polytechnique University wind tunnel data into a 2D file event compatible with WEUQ. The WEUQ software is then leveraged to run the linear model (see folder : 1 - Linear model) or the nonlinear model (see folder : 2 - Nonlinear model). The outputs of WEUQ (and the collapse results in the case of the nonlinear model) are to be set aside in order to create a database of engineering demand parameters. In deriving results for case study 1, 1000 simulations are performed for each wind speed. 

The resulting databases of EDPs are then using with notebooks A and B to create new "building_EDPs.xlsx" and "building_EDPs_correlations.xlsx" files.  

 