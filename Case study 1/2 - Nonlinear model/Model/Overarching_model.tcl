#######
# Set all the uncertain parameters here
# Note : these values are sampled through dakota in WEUQ
# Note 2 : Values sampled with 1 imply a distribution normalized to unit value, which is later scaled. 

pset	dmping	0.01
pset	Drfmass	1518.75
pset	Dintrmass	1125.0
pset	Lrfmass	450.0
pset	Lintrmass	1125.0
pset	Ymod	29000
pset	Fy	50
pset	W24X192_CLN_My	1
pset	W27X194_CLN_My	1
pset	W33X201_CLN_My	1
pset	W33X221_CLN_My	1
pset	W36X262_CLN_My	1
pset	W36X232_CLN_My	1
pset	W36X282_CLN_My	1
pset	W36X330_CLN_My	1
pset	W36X302_CLN_My	1
pset	W36X441_CLN_My	1
pset	W36X395_CLN_My	1	
pset	W24X192_CLN_theta_p	1
pset	W27X194_CLN_theta_p	1
pset	W33X201_CLN_theta_p	1
pset	W33X221_CLN_theta_p	1
pset	W36X262_CLN_theta_p	1
pset	W36X232_CLN_theta_p	1
pset	W36X282_CLN_theta_p	1
pset	W36X330_CLN_theta_p	1
pset	W36X302_CLN_theta_p	1
pset	W36X441_CLN_theta_p	1
pset	W36X395_CLN_theta_p	1		
pset	W24X192_CLN_theta_pc	1
pset	W27X194_CLN_theta_pc	1
pset	W33X201_CLN_theta_pc	1
pset	W33X221_CLN_theta_pc	1
pset	W36X262_CLN_theta_pc	1
pset	W36X232_CLN_theta_pc	1
pset	W36X282_CLN_theta_pc	1
pset	W36X330_CLN_theta_pc	1
pset	W36X302_CLN_theta_pc	1
pset	W36X441_CLN_theta_pc	1
pset	W36X395_CLN_theta_pc	1	
pset	W21X57_BEAM_My	1
pset	W27X114_BEAM_My	1
pset	W33X130_BEAM_My	1
pset	W36X150_BEAM_My	1
pset	W36X170_BEAM_My	1
pset	W36X194_BEAM_My	1
pset	W36X210_BEAM_My	1	
pset	W21X57_BEAM_theta_p	1
pset	W27X114_BEAM_theta_p	1
pset	W33X130_BEAM_theta_p	1
pset	W36X150_BEAM_theta_p	1
pset	W36X170_BEAM_theta_p	1
pset	W36X194_BEAM_theta_p	1
pset	W36X210_BEAM_theta_p	1	
pset	W21X57_BEAM_theta_pc	1
pset	W27X114_BEAM_theta_pc	1
pset	W33X130_BEAM_theta_pc	1
pset	W36X150_BEAM_theta_pc	1
pset	W36X170_BEAM_theta_pc	1
pset	W36X194_BEAM_theta_pc	1
pset	W36X210_BEAM_theta_pc	1



####################################################################
# Preset some information for the transient analysis
set curr_path [file tail [pwd]]
set str_split [split $curr_path "."]
####################################################################
# Run the gravity model first - enabling to update the sampled parameters (acquire proper rigidities, masses, etc.). 
# Change directory to the "Gravity_loads" subdirectory : 

cd Gravity_loads
#puts [pwd]

# Run the full model - generating up to date eigen analysis and gravity forces in two files. 
source Model_gravity.tcl

# Load the outputs of the gravity model (in the form of dictionnaries) : 
source Add_NL_model_background_data.tcl

####################################################################
# Return to the base directory and enter the nonlinear model :
cd ../Nonlinear_model

# Instantiate the intended nonlinear model here. WEUQ will take as inputs the wind loads and transient analysis as separate files.
source Model.tcl

# Revert to the original directory (let WEUQ handle itself through its own files).  
cd .. 
