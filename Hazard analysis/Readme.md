# Hurricane statistics in the Atlantic Basin :

This folder contains the relevant files to generate a database of hurricane tracks, along with intensity (central pressure growth and decay). Data files are embedded within the hurrSim library. The notebooks should be used as follows: 

* Notebook A : Samples hurricanes and generates tracks with 6 hour resolution. Within the paper, a minimum target of 10 000 years is performed to form subsets of the database. 
* Notebook B : Concatenates hurricane samples to create one comprehensive database of the simulations. Distances between the eyes of the hurricanes and the coordinates of interest are computed to filter non-landfalling hurricanes. 
* Notebook C : Refines samples to estimate the greatest gradient wind speeds at given coordinates. Converts gradient wind speeds to 10 meters height with a 3 seconds gust averaging time. Assigns weibull distributions to resulting wind speeds. Derives recurrence intervals by matching the distributions with hurricane occurence rate at the given coordinate. 

## hurrSim - data generators

Relevant notebooks and input datasets are supplied to reproduce the development of hurricane track parameters. The notebooks are labelled A to I, as they are meant to run in series, generating and modifying the relevant files as they become available in the process.    


 