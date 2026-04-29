##############################################################################################################################
# DefineUnitsAndConstants                                                                                                    #
# This file will be used to define global variables                                                                          #
#                                                                                                                            #
# Created by: Henry Burton, Stanford University, 2010                                                                        #
# Revised by: XINGQUAN GUAN, UCLA, 2018                                                                                      #
# Units: kips, inches, seconds                                                                                               #
##############################################################################################################################

##############################################################################################################################
#                                                       Miscellaneous                                                        #
##############################################################################################################################

# Define Geometric Transformation
set PDeltaTransf 1;
set LinearTransf 2;
set CorotationalTransf 3; 

# Set up geometric transformations of element
geomTransf PDelta $PDeltaTransf;
geomTransf Linear $LinearTransf;
geomTransf Corotational $CorotationalTransf

# Define n factor used for modified IMK material model
set n 10;

# Define Young's modulus for steel material
#set Es 29000;
set Es $Ymod; # Replace fixed Es to sampled value. 

# Define Yielding stress for steel material
#set Fy 50.00;
set Fy $Fy; # Replace fixed Fy to sampled value. 
set Fy [expr min(max(50.0,$Fy),65.0)] ; # Ensures compliance with ASTM A992 steel

# Define a very small number
set Negligible 1e-12;

# Define a very large number
set LargeNumber 1e12;

# Define gravity constant
set g 386.4;

# Define rigid links between leaning column and frame
set TrussMatID 600;     # Material tag
set AreaRigid  1e12;        # Large area
set IRigid     1e12;     # Large moment of inertia
uniaxialMaterial Elastic $TrussMatID $Es;

# Define very stiff material used for axial stiffness of beam/column hinges
set StiffMatID 1200
uniaxialMaterial Elastic $StiffMatID [expr $LargeNumber];

# Define a maximum story drift (leading to assumed collapse) : 
set Max_SDR 0.2; 	# The true Max SDR needs to be defined through Incremental dynamic wind analysis (IDWA).
			# A preliminary value of 20% (0.2) may be used to first assess what is the structure's behavior.

puts "Variables defined"

