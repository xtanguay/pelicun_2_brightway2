# Overview



The files associated with case study 2 (portfolio assessment) enable to recreate from scratch an assessment for a portfolio of buildings. The files enable the following :

* Notebook A: Derives the buildings and raw features of the buildings according to [Brails++ methodology](https://simcenter.designsafe-ci.org/products/backend-components/brails/).
* Noteobok B: Completes the assignment of features to the buildings
* Notebook C: Generates the asset performance assessment.
* Notebook D: Post-processes the results to the integrated heatmap and histogram results, along with generating maps of expected annual loss contributions by individual buildings.
* Notebook E: Post-processes the results to expected annual loss curves.

The following ancilliary files are provided to help recreate part of the results from the paper:

1. Discretized\_mp\_v4.xlsx : contrains relevant wind speeds for the assessment.
2. Archetypes large building inv.xlsx : contains post-processed building portfolio inputs (see notes at bottom).
3. Inventory Portfolio to P2B.xlsx : describes the life-cycle inventory to implement in brightway2.
4. selected\_LCIA\_methods.xlsx indicates the selected LCIA indicators for this assessment. Note that Impact World+ LCIA indicators are not typically pre-loaded with an ecoinvent biosphere, thus it is necessary to pre-load it beforehand (see ImpactWorld+'s download page). This file should be inserted under "path\_to\_pre\_sampled\_MC\_simulations/database\_name/results/reference\_files".



>[!WARNING]
>It should be noted that the exact coordinates defining the boundaries to the case study area have been intentionally removed from the scripts to prevent research data to be used beyond their intended purpose of demonstrating the use of pelicun\_2\_brightway2. Case study building coordinates are also intentionally removed for the same purpose. 

