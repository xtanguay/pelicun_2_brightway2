# A coupling framework between asset performance assessment and LCA


pelicun\_2\_brightway2 is a library bridging asset performance assessment damage outputs with environmental life cycle assessment. The library connects [pelicun](https://simcenter.designsafe-ci.org/products/backend-components/pelicun/) and [brightway2](https://docs.brightway.dev/en/legacy/index.html) to provide fast stochastic LCA simulations when LCA is part of a series of stochastic analyses. A paper (currently under review) introduces key elements of the coupling framework.


## Repository layout



* Libraries folder : contains all core libraries required in order to operate the pelicun\_2\_bw2 functions. It should be noted that most of the libraries are forks of the main project branches, as minor edits have been implemented in most of them.
* Hazard analysis : a hurricane hazard curve simulator is provided in support of the publication. The folder contains a library (hurrSim) to simulate hurricane tracks, along with notebooks (notebooks A to C) to operate the library, notably in generating a database of hurricanes, along with means to derive statistics for selected coordinates.
* Case study 1 : The first case study is provided with the relevant files to run the notebooks A through E directly. Folders 0 through 2 are provided to recreate core engineering demand parameters (from wind tunnel pressure scaling to collapse simulation).
* Case study 2 : The second case study is provided with the relevant files to run the notebooks A through E directly. It should be mentionned that building coordinates (latitude/longitude) are intentionally scrambled to prevent user from pinpointing the exact buildings in the original case study.



## Coupling methodology


![Coupling framework overview](./imgs/Coupling%20framework.png)

### General methodology

The coupling framework hinges on five essential steps :

1. Unique damage states are identified and sent to a brightway2 database of generic losses (the same archetype or building component may be reused several times in the assessment).
2. For each unique damage state, intermediate and elementary flows are added, based on a bill of materials and an identification of relevant processes. Commercial databases, such as ecoinvent, can assist in developing comprehensive life cycle inventories.
3. A database of pre-aggregated and dependently sampled datasets is created from the database of generic lossses. The results of the pre-aggregation are stored in the form of randomly presampled arrays.
4. A foreground loss database is added to pair individual damage inputs with the pre-aggregated generic losses. The damage quantities are stored in the form of a sequential presampled array.
5. A reference flow dataset is added to enable a single demand vector to consistently represent the full combination of underlying damages states activated by individual simulation samples.




### Brightway2 implementation 




For each hazard intensity level, the last two steps are repeated, creating the following database relationship within the brightway2 project:


![Database relationship](./imgs/Database%20relationship.png)





From a matrix implementation perspective, the coupling framework takes the following three essential steps :



\## Matrix layout figure



* Stage A (steps 1 and 2) : the generic loss database is built with a dependence to secondary technosphere databases (i.e. ecoinvent and any in-house developed database of datasets) and a biosphere database.
* Stage B : step 3, 4, and 5 enable to pre-aggregate the generic loss database and connect it to a foreground loss database.
* Stage C : Monte Carlo simulations are performed, where the randomly presampled array modifies the environmental intervention matrix (B) and the sequentially presampled array modifies the content of the technopshere matrix.



A first-tier contribution analysis procedure is further detailed in the supplementary information of the paper.

