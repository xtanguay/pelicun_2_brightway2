wipe all;


# WEUQ uncertainty parameters
#pset dmping 0.01
#pset Drfmass 1518.75
#pset Dintrmass 1125.0
#pset Lrfmass 450.0
#pset Lintrmass 1125.0
#pset Ymod 29000



# Defining model builder
model BasicBuilder -ndm 2 -ndf 3;


# Define the periods to use for the Rayleigh damping calculations

set periodForRayleighDamping_1 [dict get $Eigen_rslts Eigen1] 
set periodForRayleighDamping_2 [dict get $Eigen_rslts Eigen3]



# Defining variables (geometric tranformations, the "n" factor for modified IMK materials, steel material properties and constants)
source DefineVariables.tcl

# Defining functions and procedures (section property lookup, panel zone nodes, elements, and spring, modified IMK spring material, modified IMK spring, leaning column hinges)
source DefineFunctionsAndProcedures.tcl
source SDRlimitTester.tcl ; # Function to test if the collapse limit is exceeded or not.

# Defining reference column and beam sections (to parameterize the model with a direct selection of section)
source Add_reference_beams_columns.tcl

# Defining nodes (Panel zone nodes, leaning column nodes and leaning column spring nodes)
source DefineNodes2DModel.tcl

# Defining node fixities (all fixed, asside the leaning column, which is pinned)
source DefineFixities2DModel.tcl

# Defining floor constraint (all nodes on a floor level constrained to leaning column node) 
source DefineFloorConstraint2DModel.tcl

# Defining beam hinge material models (Assign appropriate IMK material model values for beam spring)
source DefineBeamHingeMaterials2DModel.tcl

# Defining column hinge material models (Assign appropriate IMK material model values for column spring)
source DefineColumnHingeMaterials2DModel.tcl

# Defining beam elements (connects spring nodes with equivalent Beam rigidities, according to reference beam sections)
source DefineBeams2DModel.tcl

# Defining column elements (connects spring nodes with equivalent Column rigidities, according to reference column sections)
source DefineColumns2DModel.tcl

# Defining beam hinges (creates springs between spring nodes for beams, connects with according IMK spring material tag)
source DefineBeamHinges2DModel.tcl

# Defining column hinges (creates springs between spring nodes for columns, including the leaning column - IMK for nonlinear springs, low rigidity for leaning column)
source DefineColumnHinges2DModel.tcl

# Defining masses (distribute floor masses according to number of lateral load resisting frames and number of columns (including the leaning column) 
source DefineMasses2DModel.tcl

# Defining elements in panel zone (uses top left node of Panel Zone to identify the relevant nodes and create rigid sections between PZ nodes)
source DefinePanelZoneElements.tcl

# Defining springs in panel zone (uses columns and beam geometries to define the spring properties)
source DefinePanelZoneSprings.tcl

# Defining gravity loads (assign 1.0D + 0.25L on frames and leaning column)
source DefineGravityLoads2DModel.tcl

# Intermediate check : create recorders to monitor reactions
#source Get_gravity_reactions.tcl 

# Perform gravity analysis (runs gravity loads and sets loads and deformations as permanent, resets assessment time to 0)
source Perform_gravity.tcl

loadConst -time 0.0 # (sets gravity loads constant and resets analysis time)
wipeAnalysis


# Defining damping (assigns damping to columns, beams and nodes (creates "regions" for shared properties)
set dampingRatio $dmping
source DefineDamping2DModel.tcl

puts "The following variables are retained for this simulation : Damping : $dmping, Y modulus : $Ymod, intermediate floor mass : $Dintrmass, roof floor mass : $Drfmass, yield strength : $Fy"

# Perform lateral load analysis : 
#source Wind_loads.tcl
#source Transient_analysis.tcl



