##############################################################################################################################
# DefineFunctionsAndProcedures                                                                                               #
#   This file will be used to define functions and procedures that are used in the rest of the program                       # 
#                                                                                                                            #
# Created by: Henry Burton, Stanford University, 2010                                                                        #
# Revised by: XINGQUAN GUAN, UCLA, 2018
#                                                                                                                            #
# Units: kips, inches, seconds                                                                                               #
##############################################################################################################################

##############################################################################################################################
#                                Load Section Database and Create the Section Property                                       #
##############################################################################################################################

proc SectionProperty { shape } {
    set input_file  [file normalize "Database.csv"];
    set line {}
    set i 0
    if {[catch {set file_in [open $input_file r]} err_msg]} {
    puts "Failed to open the file for reading: $err_msg"
    return
    }
    set content [read $file_in]
    close $file_in
    
    foreach line [split $content "\n"] {
        set propde [split $line ","];
        set name1 [lindex $propde 2];
        set name2 [lindex $propde 80];
        if {[string equal $name1 $shape]} {
            set name [lindex $propde 2];  # lindex 0  AISC shape size
            set d [lindex $propde 6];     # lindex 1  Section Depth: inch
            set A [lindex $propde 5];     # lindex 2  Section Area: inch^2
            set bf [lindex $propde 11];   # lindex 3  Flange width: inch
            set tw [lindex $propde 16];   # lindex 4  Web thickness: inch
            set tf [lindex $propde 19];   # lindex 5  Flange thickness: inch
            set Ix [lindex $propde 38];   # lindex 6  Moment of inertia about major axis: inch^4
            set Iy [lindex $propde 42];   # lindex 7  Moment of inertia about minor axis: inch^4
            set Zx [lindex $propde 39];   # lindex 8  Plastic section modulus about major axis: inch^3
            set Zy [lindex $propde 43];   # lindex 9  Plastic section modulus about minor axis: inch^3
            set ry [lindex $propde 45];   # lindex 10 Radius of gyration about major axis: inch
            set J [lindex $propde 49];    # lindex 11 Torsion constant: inch^4
        }
        if {[string equal $name2 $shape]} {
            set name [lindex $propde 80];                 # lindex 0  
            set d [lindex $propde 83];                    # lindex 1
            set A [lindex $propde 82];                    # lindex 2
            set bf [lindex $propde 88];                   # lindex 3
            set tw [lindex $propde 93];                   # lindex 4
            set tf [lindex $propde 96];                   # lindex 5
            set Ix [expr ([lindex $propde 115])*10**6];   # lindex 6
            set Iy [expr ([lindex $propde 119])*10**6];   # lindex 7
            set Zx [expr ([lindex $propde 116])*10**3];   # lindex 8
            set Zy [expr ([lindex $propde 120])*10**3];   # lindex 9
            set ry [lindex $propde 122];                  # lindex 10
            set J [expr ([lindex $propde 126])*10**3];    # lindex 11
        }
    }
    set Prop [list $name $d $A $bf $tw $tf $Ix $Iy $Zx $Zy $ry $J];
    return $Prop
}

 
##############################################################################################################################
#                                Define Nodes Around Panel Zone for 2D Frame                                                 #
##############################################################################################################################

proc NodesAroundPanelZone {ColPier Level XCoordinate YCoordinate PanelSize MaximumFloor MaximumCol} {
# Input argument explanation:
# Level: the floor level for frame, ground floor is 1.
# ColPier: the column ID, starting from 1 to the number of columns in each frame
# XCoordinate: X coodinate of the column centerline
# YCoordinate: Y coordinate of the beam centerline
# PanelSize: a list with two elements: {a b}:
#            a: the depth of column
#            b: the depth of beam


# Node Label Convention:
# Pier number_Level_Position ID
# Pier number: 1,2,3,4... used to indicate which column pier;
# Level:1,2,3,4... used to indicate the floor level
# Position ID: two digits: 
#                   00: specially used for ground floor
#                   01-12: nodes for Panel Zone
#                   01: top left node
#                   02: top left node
#                   03: top right node
#                   04: top right node
#                   05: bottom right node
#                   06: bottom right node
#                   07: bottom left node
#                   08: bottom left node
#                   09: mid left node
#                   10: top mid node
#                   11: mid right node
#                   12: bottom mid node
#                   13-18: nodes for Plastic Hinge
#                   13: left(negative) beam node
#                   14: Top(positive) column node
#                   15: right(positive) beam node
#                   16: Bottom(negative) column node
if {$Level == 1} {
    node [format %s%s%s $ColPier $Level 10] [expr $XCoordinate] [expr $YCoordinate];
    node [format %s%s%s $ColPier $Level 14] [expr $XCoordinate] [expr $YCoordinate];
} else {
    set dc [expr ([lindex $PanelSize 0]) / 2.0];    
    set db [expr ([lindex $PanelSize 1]) / 2.0];
    
    # define nodes in X direction panel zone 
    node [format %s%s%s $ColPier $Level 01] [expr $XCoordinate - $dc] [expr $YCoordinate + $db];
    node [format %s%s%s $ColPier $Level 02] [expr $XCoordinate - $dc] [expr $YCoordinate + $db];
    node [format %s%s%s $ColPier $Level 03] [expr $XCoordinate + $dc] [expr $YCoordinate + $db];
    node [format %s%s%s $ColPier $Level 04] [expr $XCoordinate + $dc] [expr $YCoordinate + $db];
    node [format %s%s%s $ColPier $Level 05] [expr $XCoordinate + $dc] [expr $YCoordinate - $db];
    node [format %s%s%s $ColPier $Level 06] [expr $XCoordinate + $dc] [expr $YCoordinate - $db];
    node [format %s%s%s $ColPier $Level 07] [expr $XCoordinate - $dc] [expr $YCoordinate - $db];
    node [format %s%s%s $ColPier $Level 08] [expr $XCoordinate - $dc] [expr $YCoordinate - $db];
    node [format %s%s%s $ColPier $Level 09] [expr $XCoordinate - $dc] $YCoordinate;
    node [format %s%s%s $ColPier $Level 11] [expr $XCoordinate + $dc] $YCoordinate;
    node [format %s%s%s $ColPier $Level 10] $XCoordinate [expr $YCoordinate + $db];
    node [format %s%s%s $ColPier $Level 12] $XCoordinate [expr $YCoordinate - $db];
    
    # define nodes for column hinge
    node [format %s%s%s $ColPier $Level 16] $XCoordinate [expr $YCoordinate - $db];
    if {$Level != $MaximumFloor} {
        node [format %s%s%s $ColPier $Level 14] $XCoordinate [expr $YCoordinate + $db];}
        
    # define nodes for xBeam hinge
    if {$ColPier != 1} {
        node [format %s%s%s $ColPier $Level 13] [expr $XCoordinate - $dc] $YCoordinate;}
    if {$ColPier != $MaximumCol} {
        node [format %s%s%s $ColPier $Level 15] [expr $XCoordinate + $dc] $YCoordinate;}
}
}


##############################################################################################################################
#                                    Define Element within Panel Zone for 2D Frame                                            #
##############################################################################################################################

proc elemPanelZone2D {eleID nodeR E VerTransfTag HorTransfTag} {
# elemPanelZone3D.tcl
# Procedure that creates panel zone elements
# 
# The process is based on Gupta 1999
# Reference:  Gupta, A., and Krawinkler, H. (1999). "Seismic Demands for Performance Evaluation of Steel Moment Resisting Frame Structures,"
#            Technical Report 132, The John A. Blume Earthquake Engineering Research Center, Department of Civil Engineering, Stanford University, Stanford, CA.
#
#
# Written by: Dimitrios Lignos
# Date: 11/09/2008
#
# Modified by: Laura Eads
# Date: 1/4/2010
# Modification: changed numbering scheme for panel zone nodes
# 
# Formal arguments
#   eleID     - unique element ID for the zero-length rotational spring
#   nodeR     - node ID for first point (top left) of panel zone --> this node creates all the others
#   E         - Young's modulus
#   G         - Shear modulus
#   S_la      - Large number for J
#   A_PZ      - area of rigid link that creates the panel zone
#   I_PZ      - moment of inertia of Rigid link that creates the panel zone
#   transfTag - geometric transformation

# define panel zone nodes
    set node01 $nodeR;              # top left of joint
    set node02 [expr $node01 + 1];  # top left of joint
    set node03 [expr $node01 + 2];  # top right of joint
    set node04 [expr $node01 + 3];  # top right of joint
    set node05 [expr $node01 + 4];  # btm right of joint
    set node06 [expr $node01 + 5];  # btm right of joint
    set node07 [expr $node01 + 6];  # btm left of joint
    set node08 [expr $node01 + 7];  # btm left of joint
    set node09 [expr $node01 + 8];  # middle left of joint (vertical middle, horizontal left)
    set node10 [expr $node01 + 9];  # top center of joint
    set node11 [expr $node01 + 10]; # middle right of joint (vertical middle, horizontal right)
    set node12 [expr $node01 + 11]; # btm center of joint
    
# create element IDs as a function of first input eleID (8 per panel zone)
    set x1 $eleID;          # left element on top of panel zone
    set x2 [expr $x1 + 1];  # right element on top of panel zone
    set x3 [expr $x1 + 2];  # top element on right side of panel zone
    set x4 [expr $x1 + 3];  # btm element on right side of panel zone
    set x5 [expr $x1 + 4];  # right element on btm of panel zone
    set x6 [expr $x1 + 5];  # left element on btm of panel zone
    set x7 [expr $x1 + 6];  # btm element on left side of panel zone
    set x8 [expr $x1 + 7];  # top element on left side of panel zone
    
    set A_PZ 1.0e12; # area of panel zone element (make much larger than A of frame elements)
    set Ipz 1.0e12;  # moment of intertia of panel zone element (make much larger than I of frame elements)

# create panel zone elements
    #                            tag    ndI     ndJ     A_PZ    E   I_PZ    transfTag
    element elasticBeamColumn    $x1    $node02 $node10 $A_PZ   $E  $Ipz    $HorTransfTag;
    element elasticBeamColumn    $x2    $node10 $node03 $A_PZ   $E  $Ipz    $HorTransfTag;
    element elasticBeamColumn    $x3    $node04 $node11 $A_PZ   $E  $Ipz    $VerTransfTag;
    element elasticBeamColumn    $x4    $node11 $node05 $A_PZ   $E  $Ipz    $VerTransfTag;
    element elasticBeamColumn    $x5    $node06 $node12 $A_PZ   $E  $Ipz    $HorTransfTag;
    element elasticBeamColumn    $x6    $node12 $node07 $A_PZ   $E  $Ipz    $HorTransfTag;
    element elasticBeamColumn    $x7    $node08 $node09 $A_PZ   $E  $Ipz    $VerTransfTag;
    element elasticBeamColumn    $x8    $node09 $node01 $A_PZ   $E  $Ipz    $VerTransfTag;
}


##############################################################################################################################
#                                             Define Rotational Spring in Panel Zone                                         #
##############################################################################################################################

proc rotPanelZone2D {eleID nodeR nodeC E fy d_Col bf_Col tf_Col tw_Col d_Beam Ix_Col mu tdp trib ts Response_ID} {

# Procedure that creates a rotational spring and constrains the corner nodes of a panel zone
# 
# References: 
#--------------	
# Elkady, A. and D. G. Lignos (2014). "Modeling of the Composite Action in Fully Restrained Beam-to-Column
# 	Connections: ‎Implications in the Seismic Design and Collapse Capacity of Steel Special Moment Frames." 
# 	Earthquake Eng. & Structural Dynamics 43(13).
#
# Skiadopoulos, A., Elkady, A. and D. G. Lignos (2021). "Proposed Panel Zone Model for Seismic Design of 
#   Steel Moment-Resisting Frames." ASCE Journal of Structural Engineering

##################################################################################################################
#
# Input Arguments:                                                                               
#------------------
# P_Elm			Element ID
# NodeI			Node i ID
# NodeJ			Node j ID
# E				Young's Modulus
# mu			Poisson's Ratio
# fy			Expected Yield Stress
# tdp			Doubler Plate(s) Thickness
# d_Col			Column Depth
# d_Beam		Beam Depth
# tf_Col		Column Flange Thickness
# bf_Col		Column Flange Width
# tw_Col		Column Web Thickness
# Ic			Column second-moment-of-interia about the strong axis
# trib			Steel deck rib depth
# ts			Concrete slab depth above the rib
# Response_ID	ID for Panel Zone Response: 0 --> Interior Steel Panel Zone with Composite Action
#											1 --> Exterior Steel Panel Zone with Composite Action
#											2 --> Bare Steel Interior/Exterior Steel Panel Zone

#                                                                                                      
# Written by: Dr. Ahmed Elkady, University of Southampton, UK
########################################################################################################

 set tpz [expr $tw_Col + $tdp]; # total PZ thickness

 set G [expr $E/(2.0 * (1.0 + $mu))];     # Shear Modulus


 # Beam's effective depth
 if {$Response_ID==2} {
 	set d_BeamP $d_Beam;
} else {
 	set d_BeamP [expr $d_Beam + $trib + 0.5 * $ts]; # Effective Depth in Positive Moment
 }
 set d_BeamN $d_Beam; 							 # Effective Depth in Negative Moment
 
 # Stiffness Calculation
 set Ks [expr $tpz * ($d_Col - $tf_Col) * $G];   														# PZ Stiffness: Shear Contribution
 set Kb [expr 12 * $E * ($Ix_Col + $tdp * pow(($d_Col - 2*$tf_Col),3)/12.) /pow($d_Beam,3) * $d_Beam];  # PZ Stiffness: Bending Contribution
 set Ke [expr ($Ks * $Kb) / ($Ks + $Kb)];   															# PZ Stiffness: Total
 
 set Ksf [expr 2 * ($bf_Col * $tf_Col) * $G];   										# Flange Stiffness: Shear Contribution
 set Kbf [expr 2 * 12 * $E * $bf_Col * pow($tf_Col,3)/12. /pow($d_Beam,3) * $d_Beam];   # Flange Stiffness: Bending Contribution
 set Kef [expr ($Ksf * $Kbf) / ($Ksf + $Kbf)];   										# Flange Stiffness: Total

 set ay [expr (0.58 * $Kef / $Ke  + 0.88) / (1 - $Kef / $Ke)];

 set aw_eff_4gamma 1.10;
 set aw_eff_6gamma 1.15;

 set af_eff_4gamma [expr 0.93 * $Kef / $Ke  + 0.015];
 set af_eff_6gamma [expr 1.05 * $Kef / $Ke  + 0.020];
 
 set Vy 		[expr 0.577 * $fy *  $ay			* ($d_Col - $tf_Col) * $tpz];  													   # Yield Shear Force
 set Vp_4gamma 	[expr 0.577 * $fy * ($aw_eff_4gamma * ($d_Col - $tf_Col) * $tpz + $af_eff_4gamma * ($bf_Col - $tw_Col) * 2*$tf_Col)];  # Plastic Shear Force @ 4 gammaY
 set Vp_6gamma 	[expr 0.577 * $fy * ($aw_eff_6gamma * ($d_Col - $tf_Col) * $tpz + $af_eff_6gamma * ($bf_Col - $tw_Col) * 2*$tf_Col)];  # Plastic Shear Force @ 6 gammaY

################
# Possibility to add uncertainty here 
# ie. PZ stiffness (Ke), Vy, Vp, gamma_y.. 
#################

 set gamma_y  [expr $Vy/$Ke]; 
 set gamma4_y [expr 4.0 * $gamma_y];  
 set gamma6_y [expr 6.0 * $gamma_y];

 set My_P 		 [expr $Vy 	   	  * $d_BeamP];
 set Mp_4gamma_P [expr $Vp_4gamma * $d_BeamP];
 set Mp_6gamma_P [expr $Vp_6gamma * $d_BeamP];

 set My_N 		 [expr $Vy 	   	  * $d_BeamN];
 set Mp_4gamma_N [expr $Vp_4gamma * $d_BeamN];
 set Mp_6gamma_N [expr $Vp_6gamma * $d_BeamN];
 
 set Slope_4to6gamma_y_P [expr ($Mp_6gamma_P - $Mp_4gamma_P) / (2 * $gamma_y) ];
 set Slope_4to6gamma_y_N [expr ($Mp_6gamma_N - $Mp_4gamma_N) / (2 * $gamma_y) ];

 # Defining the 3 Points used to construct the trilinear backbone curve
 set gamma1 $gamma_y; 
 set gamma2 $gamma4_y;  
 set gamma3 [expr 100 * $gamma_y];
 
 set M1_P [expr $My_P];
 set M2_P [expr $Mp_4gamma_P];
 set M3_P [expr $Mp_4gamma_P + $Slope_4to6gamma_y_P * (100 * $gamma_y - $gamma4_y)];
 
 set M1_N [expr $My_N];
 set M2_N [expr $Mp_4gamma_N];
 set M3_N [expr $Mp_4gamma_N + $Slope_4to6gamma_y_N * (100 * $gamma_y - $gamma4_y)];
 
 set gammaU_P   0.3;
 set gammaU_N  -0.3;

# Create a dummy ID to first create the underlying material model. This is useful to connect with the MinMax uniaxial material (which is able to "break" when exceeded). 
 set Dummy_ID [expr   12 * $eleID];

 # Composite Interior Steel Panel Zone
 if { $Response_ID == 0.0 } {
	 uniaxialMaterial Hysteretic $Dummy_ID  $M1_P $gamma1  $M2_P $gamma2 $M3_P $gamma3 [expr -$M1_P] [expr -$gamma1] [expr -$M2_P] [expr -$gamma2] [expr -$M3_P] [expr -$gamma3] 0.25 0.75 0. 0. 0.;
	 uniaxialMaterial MinMax 	 $P_Elm $Dummy_ID -min $gammaU_N -max $gammaU_P;
 }
 
 # Composite Exterior Steel Panel Zone
 if { $Response_ID == 1.0 } {
	 uniaxialMaterial Hysteretic $Dummy_ID  $M1_P $gamma1  $M2_P $gamma2 $M3_P $gamma3 [expr -$M1_N] [expr -$gamma1] [expr -$M2_N] [expr -$gamma2] [expr -$M3_N] [expr -$gamma3] 0.25 0.75 0. 0. 0.;
	 uniaxialMaterial MinMax 	 $P_Elm $Dummy_ID -min $gammaU_N -max $gammaU_P;
 }
 
 # Bare Steel Interior/Exterior Steel Panel Zone
 if { $Response_ID == 2.0 } {
	 uniaxialMaterial Hysteretic $Dummy_ID  $M1_N $gamma1  $M2_N $gamma2 $M3_N $gamma3 [expr -$M1_N] [expr -$gamma1] [expr -$M2_N] [expr -$gamma2] [expr -$M3_N] [expr -$gamma3] 0.25 0.75 0. 0. 0.;
	 uniaxialMaterial MinMax 	 $eleID $Dummy_ID -min $gammaU_N -max $gammaU_P;
 } 


# Hysteretic Material without pinching and damage (same mat ID as Ele ID)
    #uniaxialMaterial Hysteretic $eleID $M1y $gamma1_y  $M2y $gamma2_y $M3y $gamma3_y [expr -$M1y] [expr -$gamma1_y] [expr -$M2y] [expr -$gamma2_y] [expr -$M3y] [expr -$gamma3_y] 1 1 0.0 0.0 0.0
    
    element zeroLength $eleID $nodeR $nodeC -mat $eleID -dir 6

    equalDOF    $nodeR     $nodeC     1     2
    # Constrain the translational DOF with a multi-point constraint
    # Left Top Corner of PZ
    set nodeR_1 [expr $nodeR - 2];
    set nodeR_2 [expr $nodeR_1 + 1];
    # Right Bottom Corner of PZ
    set nodeR_6 [expr $nodeR + 2];
    set nodeR_7 [expr $nodeR_6 + 1];
    # Left Bottom Corner of PZ
    set nodeL_8 [expr $nodeR + 4];
    set nodeL_9 [expr $nodeL_8 + 1];
    #          retained constrained DOF_1 DOF_2 
    equalDOF    $nodeR_1     $nodeR_2    1     2
    equalDOF    $nodeR_6     $nodeR_7    1     2
    equalDOF    $nodeL_8     $nodeL_9    1     2
}


##############################################################################################################################
#            Define Modified IMK Deterioration Parameters for Beam and Column Plastic Hinges                            #
##############################################################################################################################
                                                               
# Procedure that computes relevant parameters for a steel beam or column in preparation for adding IMKbilin springs   
#
# References: 
#--------------	
# Lignos, D. G. and H. Krawinkler (2011). "Deterioration Modeling of Steel Components in Support of Collapse 
# 	Prediction of Steel Moment Frames under Earthquake Loading." Journal of Structural Engineering 137(11).	
#
# Elkady, A. and D. G. Lignos (2014). "Modeling of the Composite Action in Fully Restrained Beam-to-Column
# 	Connections: ‎Implications in the Seismic Design and Collapse Capacity of Steel Special Moment Frames." 
# 	Earthquake Eng. & Structural Dynamics 43(13).
#
# Lignos, D. G., et al. (2019). "Proposed Updates to the ASCE 41 Nonlinear Modeling Parameters for Wide-Flange
#	 Steel Columns in Support of Performance-based Seismic Engineering." Journal of Structural Engineering 145(9).


# Input Arguments:
#------------------
#  E         			Young's modulus
#  Fy        			Yield stress
#  Ix        			Moment of inertia of section
#  d         			Section depth
#  htw        			Web slenderness ratio
#  bftf        			Flange slenderness ratio
#  L         			Member Length
#  Ls         			Shear Span
#  Lb        			Unbraced length
#  My        			Effective Yield Moment
#  PgPye        		Axial load ratio due to gravity, where Pye is Ry*Fy*Ag
#  CompositeFlag		FLAG for Composite Action Consideration: 0 --> Ignore   Composite Effect   
# 															 	 1 --> Consider Composite Effect
#  ConnectionType		Type of Connection: 0 --> Reduced     Beam Section  
# 											1 --> Non-Reduced Beam Section    
# 											2 --> Column Section   
#  Units				Unsed Units: 1 --> millimeters and MPa     
#								 	 2 --> inches and ksi
# RV_params : Sampled lognormal distribution value for My, theta_p and theta_pc (as a distribution normalized to mean = 1, COV) 
#
# Written by: Dr. Ahmed Elkady, University of Southampton, UK
# Modified by: Xavier Tanguay

proc Spring_IMK_properties {E Fy Ix d htw bftf ry L Ls Lb My PgPye CompositeFlag ConnectionType Units RV_params} {

#puts "$RV_params"

# Add uncertainty to the definition of My :
set My [expr $My*[lindex $RV_params 0]];
 

set n 10.0;
if {$Units == 1} {
	set c1 1.0;
	set c2 1.0;	
	set c3 25.4;
	set c4 1000.0;
} else {
	set c1 25.4;
	set c2 6.895;
	set c3 1.0;
	set c4 1.0;
}

set K  [expr ($n+1.0) * 6 * $E * $Ix / $L];
set K_bc [expr ($n+1)/$n* 6 * $E * $Ix / $L]; 

#######################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################

if {$ConnectionType == 0} {

	# Rotational capacities calculated using  Lignos and Krawinkler (2009) RBS equations
	set theta_p   [expr 0.19 * pow(($htw),-0.314) * pow(($bftf),-0.100) *  pow(($Lb/$ry),-0.185) * pow(($Ls/$d),0.113) * pow(($c1 * $d/533),-0.760) * pow(($c2 * $Fy* $c4/355),-0.070)];
 	set theta_pc  [expr 9.52 * pow(($htw),-0.513) * pow(($bftf),-0.863) *  pow(($Lb/$ry),-0.108) 													* pow(($c2 * $Fy* $c4/355),-0.360)];
	set Lmda      [expr 585  * pow(($htw),-1.140) * pow(($bftf),-0.632) *  pow(($Lb/$ry),-0.205) 													* pow(($c2 * $Fy* $c4/355),-0.391)];


	# Add uncertainty to theta_p and theta_pc 
	set theta_p [expr $theta_p*[lindex $RV_params 1]];	
	set theta_pc [expr $theta_pc*[lindex $RV_params 2]];


	# FOR BARE STEEL BEAM (NO COMPOSITE BEAM-SLAB ACTION)
	if {$CompositeFlag == 0} {
		set MyPMy 1.0;
		set MyNMy 1.0;
		set McMyP 1.1;
		set McMyN 1.1;	

		# Corrected rotations to account for elastic deformations
		#set theta_y  [expr $My/(6 * $E * $Ix / $L)];
		set theta_m [expr $My/$K_bc];

		#set theta_p  [expr $theta_p  - ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_p [expr $theta_p  - ($McMyP-1.0)*$My/$K_bc];

		#set theta_pc [expr $theta_pc + $theta_y + ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_pc [expr $theta_pc + $theta_m + ($McMyP-1.0)*$My/$K_bc];
	
		set theta_p_P   $theta_p;
		set theta_p_N   $theta_p;
		set theta_pc_P  $theta_pc;	
		set theta_pc_N  $theta_pc;
		set theta_u   		  0.2;

		set D_P 1.0;
		set D_N 1.0;
		
		set Res_P 0.4;
		set Res_N 0.4;
		
		set c 1.0;

	}

	# FOR COMPOSITE BEAM
	if {$CompositeFlag != 0} {
		set MyPMy 1.35;
		set MyNMy 1.25;
		set McMyP 1.30;
		set McMyN 1.05;

		# Corrected rotations to account for elastic deformations
		#set theta_y  [expr $My/(6 * $E * $Ix / $L)];
		set theta_m [expr $My/$K_bc];

		#set theta_p_p  [expr $theta_p  - ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		#set theta_p_n  [expr $theta_p  - ($McMyN-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_p_p  [expr $theta_p  - ($McMyP-1.0)*$My/$K_bc];
		set theta_p_n  [expr $theta_p  - ($McMyN-1.0)*$My/$K_bc];

		#set theta_pc_p [expr $theta_pc + $theta_y + ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		#set theta_pc_n [expr $theta_pc + $theta_y + ($McMyN-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_pc_p [expr $theta_pc + $theta_m + ($McMyP-1.0)*$My/$K_bc];
		set theta_pc_n [expr $theta_pc + $theta_m + ($McMyN-1.0)*$My/$K_bc];

		
		set theta_p_P   [expr 1.80*$theta_p_p];
		set theta_p_N   [expr 0.95*$theta_p_n];
		set theta_pc_P  [expr 1.35*$theta_pc_p];
		set theta_pc_N  [expr 0.95*$theta_pc_n];
		set theta_u   		  0.2;

		set D_P 1.15;
		set D_N 1.0;

		set Res_P 0.3;
		set Res_N 0.2;
		
		set c 1.0;

	}
	
}

#######################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################

if {$ConnectionType == 1} {

	# Rotational capacities calculated using Lignos and Krawinkler (2009) other-than-RBS equations
	if {$d > [expr $c3*21.0]} {
		set theta_p   [expr 0.318 * pow(($htw),-0.550) * pow(($bftf),-0.345) *  pow(($Lb/$ry),-0.023) *  pow(($Ls/$d),0.090) *  pow(($c1 * $d/533),-0.330) * pow(($c2 * $Fy* $c4/355),-0.130)];
		set theta_pc  [expr 7.500 * pow(($htw),-0.610) * pow(($bftf),-0.710) *  pow(($Lb/$ry),-0.110) 					     *  pow(($c1 * $d/533),-0.161) * pow(($c2 * $Fy* $c4/355),-0.320)];
		set Lmda      [expr 536   * pow(($htw),-1.260) * pow(($bftf),-0.525) *  pow(($Lb/$ry),-0.130) 					     *  pow(($c2 * $Fy* $c4/355),-0.291)];
	} else {
		set theta_p   [expr 0.0865 * pow(($htw),-0.360) * pow(($bftf),-0.140) *  pow(($Ls/$d),0.340) *  pow(($c1 * $d/533),-0.721) * pow(($c2 * $Fy* $c4/355),-0.230)];
		set theta_pc  [expr 5.6300 * pow(($htw),-0.565) * pow(($bftf),-0.800) 					   *  pow(($c1 * $d/533),-0.280) * pow(($c2 * $Fy* $c4/355),-0.430)];
		set Lmda      [expr 495    * pow(($htw),-1.340) * pow(($bftf),-0.595) 					   *  pow(($c2 * $Fy* $c4/355),-0.360)];

	}

	# Add uncertainty to theta_p and theta_pc 
	set theta_p [expr $theta_p*[lindex $RV_params 1]];	
	set theta_pc [expr $theta_pc*[lindex $RV_params 2]];
	
	# FOR BARE STEEL BEAM
	if {$CompositeFlag == 0} {		
		set MyPMy    1.0;
		set MyNMy    1.0;
		set McMyP    1.1;
		set McMyN    1.1;

		# Corrected rotations to account for elastic deformations
		#set theta_y  [expr $My/(6 * $E * $Ix / $L)];
		set theta_m [expr $My/$K_bc];

		#set theta_p  [expr $theta_p  - ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_p [expr $theta_p  - ($McMyP-1.0)*$My/$K_bc];

		#set theta_pc [expr $theta_pc + $theta_y + ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_pc [expr $theta_pc + $theta_m + ($McMyP-1.0)*$My/$K_bc];
	
		set theta_p_P   $theta_p;
		set theta_p_N   $theta_p;
		set theta_pc_P  $theta_pc;
		set theta_pc_N  $theta_pc;
		set theta_u   		  0.2;
		
		set D_P 1.0;
		set D_N 1.0;
		
		set Res_P 0.4;
		set Res_N 0.4;
		
		set c 1.0;

	}

	# FOR COMPOSITE BEAM
	if {$CompositeFlag != 0} {
		set MyPMy 1.35;
		set MyNMy 1.25;
		set McMyP 1.30;
		set McMyN 1.05;

		# Corrected rotations to account for elastic deformations
		#set theta_y  [expr $My/(6 * $E * $Ix / $L)];
		set theta_m [expr $My/$K_bc];

		#set theta_p_p  [expr $theta_p  - ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		#set theta_p_n  [expr $theta_p  - ($McMyN-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_p_p  [expr $theta_p  - ($McMyP-1.0)*$My/$K_bc];
		set theta_p_n  [expr $theta_p  - ($McMyN-1.0)*$My/$K_bc];

		#set theta_pc_p [expr $theta_pc + $theta_y + ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
		#set theta_pc_n [expr $theta_pc + $theta_y + ($McMyN-1.0)*$My/(6 * $E * $Ix / $L)];
		set theta_pc_p [expr $theta_pc + $theta_m + ($McMyP-1.0)*$My/$K_bc];
		set theta_pc_n [expr $theta_pc + $theta_m + ($McMyN-1.0)*$My/$K_bc];
		
		set theta_p_P   [expr 1.80*$theta_p_p];
		set theta_p_N   [expr 0.95*$theta_p_n];
		set theta_pc_P  [expr 1.35*$theta_pc_p];
		set theta_pc_N  [expr 0.95*$theta_pc_n];
		set theta_u   		  0.2;

		set D_P 1.15;
		set D_N 1.00;
		
		set Res_P 0.3;
		set Res_N 0.2;
		
		set c 1.0;

	}
}


#######################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################

if {$ConnectionType == 2} {
	# Rotational capacities calculated using Lignos et al. (2019) column regression equations for monotonic
	set theta_p   [expr 294 * pow(($htw),-1.700) * pow(($Lb/$ry),-0.700) * pow((1-$PgPye),1.600)];
	set theta_pc  [expr 90  * pow(($htw),-0.800) * pow(($Lb/$ry),-0.800) * pow((1-$PgPye),2.500)];
	if {$theta_p  > 0.20} {set theta_p  0.2}
	if {$theta_pc > 0.30} {set theta_pc 0.3}
	if {$PgPye <= 0.35} {
		set Lmda  [expr 25500 * pow(($htw),-2.140) * pow(($Lb/$ry),-0.530) * pow((1-$PgPye),4.920)];
	} else {
		set Lmda  [expr 268000* pow(($htw),-2.300) * pow(($Lb/$ry),-1.300) * pow((1-$PgPye),1.190)];	
	}
	
	if {$PgPye <= 0.2} {
		set My  [expr (1.15/1.1)*$My*(1-$PgPye/2)];
	} else {
		set My  [expr (1.15/1.1)*$My*(9/8)*(1-$PgPye)];
	}
	
	# Add uncertainty to theta_p and theta_pc 
	set theta_p [expr $theta_p*[lindex $RV_params 1]];	
	set theta_pc [expr $theta_pc*[lindex $RV_params 2]];


	set McMy   [expr 12.5 * pow(($htw),-0.200) * pow(($Lb/$ry),-0.400) * pow((1-$PgPye),0.400)];
	if {$McMy  < 1.0} {set McMy  1.0}
	if {$McMy  > 1.3} {set McMy  1.3}
	
	set MyPMy    1.0;
	set MyNMy    1.0;
	set McMyP    $McMy;
	set McMyN    $McMy;
	
	# Corrected rotations to account for elastic deformations
	#set theta_y  [expr $My/(6 * $E * $Ix / $L)];
	set theta_m [expr $My/$K_bc];

	#set theta_p  [expr $theta_p  - ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
	set theta_p [expr $theta_p  - ($McMyP-1.0)*$My/$K_bc];

	#set theta_pc [expr $theta_pc + $theta_y + ($McMyP-1.0)*$My/(6 * $E * $Ix / $L)];
	set theta_pc [expr $theta_pc + $theta_m + ($McMyP-1.0)*$My/$K_bc];
	
	set theta_p_P   $theta_p;
	set theta_p_N   $theta_p;
	set theta_pc_P  $theta_pc;
	set theta_pc_N  $theta_pc;
	set theta_u   	0.15;
	
	set D_P 1.0;
	set D_N 1.0;
	
	set Res_P [expr 0.5-0.4*$PgPye];
	set Res_N [expr 0.5-0.4*$PgPye];
	
	set c 1.0;

	
}

#######################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################

set My_P     [expr  $MyPMy * $My]; 
set My_N     [expr  $MyNMy * $My];


# Cyclic deterioration parameters
if {$ConnectionType == 2} {
	set L_S $Lmda; set L_C [expr 0.9*$Lmda]; set L_A $Lmda; set L_K [expr 0.9*$Lmda];
} else {
	set L_S $Lmda; set L_C 			 $Lmda;  set L_A $Lmda; set L_K 		  $Lmda;
}
	set c_S $c;    set c_C $c; 				 set c_A $c; 	set c_K $c;



# Procedure output
set IMK_Prop [list $K $theta_p_P $theta_pc_P $theta_u $My_P $McMyP $Res_P $theta_p_N $theta_pc_N $theta_u $My_N $McMyN $Res_N $L_S $L_C $L_K $c_S $c_C $c_K $D_P $D_N];
return $IMK_Prop
}



##########################################################################################################
#                         Simplify spring creation
##########################################################################################################
proc Assemble_IMK_spring_material {Element_Level Length dc1 dc2 Fy Es Pg ConnectionType Z_RBS_ratio} {

set Ry		1.1;

set htw 	[expr ([lindex $Element_Level 1]-2*[lindex $Element_Level 5])/[lindex $Element_Level 4]] ; 
set bf_2tf 	[expr [lindex $Element_Level 3]/(2*[lindex $Element_Level 5])];
set My		[expr [lindex $Element_Level 8]*$Fy*1.06*$Z_RBS_ratio];
set L 		[expr $Length-$dc1/2-$dc2/2];
set Ls		[expr $L/2];
set PgPye	[expr $Pg/($Ry*$Fy*[lindex $Element_Level 2])];

# If beam connection type :  
## Note : according to CSA S16, a check for unbraced lenght should be made (27.2.2) - although it is assumed it passes based on the AutoSDA checks.
if {$ConnectionType in [list 0 1]} {
	# Find the spacing for braces (from AutoSDA, see Guan repository on Github).
	set n_supports  1 ;
	set Lb [expr $L/($n_supports+1)] ; 

	set limit1 [expr 0.086*[lindex $Element_Level 10]*$Es/$Fy] ;
	set limit2 [expr 1.76*[lindex $Element_Level 10]*pow(($Es/$Fy),0.5)] ;
	set controlling_limit [expr min($limit1,$limit2)] ;

	while {$Lb > $controlling_limit} {
		set n_supports [expr $n_supports+1];
		set Lb [expr $L/($n_supports+1)];
	}
} else {set Lb $L}


################################# Add uncertainty modifiers
if {$ConnectionType == 0} {
	set position BEAM ; 

} else {
	set position CLN ; 

}

append RV_My [lindex $Element_Level 0] "_" $position "_My";
append RV_theta_p [lindex $Element_Level 0] "_" $position "_theta_p";
append RV_theta_pc [lindex $Element_Level 0] "_" $position "_theta_pc";

# Fetch from global the actual variables
global $RV_My
global $RV_theta_p
global $RV_theta_pc

set RV_params [list [expr $$RV_My] [expr $$RV_theta_p] [expr $$RV_theta_pc]]
########################################


set HingeMaterialproperties [Spring_IMK_properties $Es $Fy [lindex $Element_Level 6] [lindex $Element_Level 1] $htw $bf_2tf [lindex $Element_Level 10] $L $Ls $Lb $My $PgPye 0 $ConnectionType 2 $RV_params];

# Procedure output
return $HingeMaterialproperties
}









##############################################################################################################################
#     Define the Material Model for Beam and Column plastic hinges through Modified IMK Deterioration                        #
##############################################################################################################################


proc CreateIMKMaterial {matTag IMK_Prop} {

# Input argument explanation:
# matTag: a unique ID to represent the material
# IMK_Prop : list of section properties for IMK multilinear material degradation.

# Reference:
#           [1] Ibarra et al. (2005) Hysteretic models that incorporate strength and stiffness deterioration.
#           [2] Ibarra and Krawinkler. (2005)  Global collapse of frame structures under seismic excitation.
#           [3] Lignos (2008) Sidesway collapse of deteriorating structural systems under seismic excitation.
#           [4] Lignos and Krawinkler. (2011) Deterioration modeling of steel component in support of collapse prediction of 
#                                         steel moment frames under earthquake loading.
# 	    [5]	Lignos, D. G., et al. (2019). "Proposed Updates to the ASCE 41 Nonlinear Modeling Parameters for Wide-Flange
#	 				Steel Columns in Support of Performance-based Seismic Engineering." Journal of Structural Engineering 145(9).

  
#set Ks  [expr ($n+1.0)*$K0];  # Initial stiffness for rotational spring (hinge)
#set asPosScaled [expr ($a_men)/(1.0+$n*(1.0-$a_men))];
#set asNegScaled $asPosScaled;
#set Lambda_S [expr ($n+1.0)*$Lambda];  # basic strength deterioration
#set Lambda_C [expr ($n+1.0)*$Lambda];  # post-capping strength deterioration
#set Lambda_A [expr ($n+1.0)*$Lambda];  # accelerated reloading stiffness deterioration (a very large number = no cyclic deterioration)
#set Lambda_K [expr ($n+1.0)*$Lambda];  # unloading stiffness deterioration (a very large number = no cyclic deterioration)




# Built-in command: 
# uniaxialMaterial IMKBilin $K $theta_p_P $theta_pc_P $theta_u $My_P $McMyP $Res_P $theta_p_N $theta_pc_N $theta_u $My_N $McMyN $Res_N $L_S $L_C $L_K $c_S $c_C $c_K $D_P $D_N
# Updated argument explanation : https://opensees.github.io/OpenSeesDocumentation/user/manual/material/uniaxialMaterials/IMKBilin.html 

# IMKBilin material model (This is the updated version of the Bilin model)
uniaxialMaterial IMKBilin $matTag [lindex $IMK_Prop 0] [lindex $IMK_Prop 1] [lindex $IMK_Prop 2] [lindex $IMK_Prop 3] [lindex $IMK_Prop 4] [lindex $IMK_Prop 5] [lindex $IMK_Prop 6] [lindex $IMK_Prop 7] [lindex $IMK_Prop 8] [lindex $IMK_Prop 9] [lindex $IMK_Prop 10] [lindex $IMK_Prop 11] [lindex $IMK_Prop 12] [lindex $IMK_Prop 13] [lindex $IMK_Prop 14] [lindex $IMK_Prop 15] [lindex $IMK_Prop 16] [lindex $IMK_Prop 17] [lindex $IMK_Prop 18] [lindex $IMK_Prop 19] [lindex $IMK_Prop 20] ;
}




##############################################################################################################################
#                         Define Rotational Spring with Modified IMK Material Models for Plastic Hinges                      #
##############################################################################################################################

proc rotBeamSpring {eleID nodeR nodeC matID stiffMatID} {
# Create a zero length element to represent the beam hinge
# Axial stiffness is extremely large
# Flexural stiffness is defined by Modified IMK material
# Input argument explanation:
# eleID: a unique ID to label the element
# nodeR: master node
# nodeC: slave node
# matID: the associated modified IMK material ID
# stiffMatID: the ID associated with the stiff material (defined in Variables.tcl)

element zeroLength $eleID $nodeR $nodeC -mat $stiffMatID $stiffMatID $matID -dir 1 2 6 -orient 1 0 0 0 1 0;

}

proc rotColumnSpring {eleID nodeR nodeC matID stiffMatID} {
# Create a zero length element to represent the column hinge
# Axial stiffness is extremely large
# Flexural stiffness is defined by Modified IMK material
# Input argument explanation:
# eleID: a unique ID to label the element
# nodeR: master node
# nodeC: slave node
# matID: the associated modified IMK material ID
# stiffMatID: the ID associated with the stiff material (defined in Variables.tcl)

element zeroLength $eleID $nodeR $nodeC -mat $stiffMatID $stiffMatID $matID -dir 1 2 6 -orient 0 1 0 1 0 0;

#element zeroLength $SpringID $NodeI $NodeJ  -mat 99 99 $SpringID -dir 1 2 6 -doRayleigh 1;
}


##############################################################################################################################
#                               Define Rotational Spring for Leaning Column Hinges                                           #
##############################################################################################################################

proc rotLeaningCol {eleID nodeR nodeC stiffMatID} {
# Create a zero-stiffness elastic rotational spring for the leaning column
# while constraining the translational DOFs
# Argument explanation:
# eleID: unique element ID for the zero-stiffness rotational spring
# nodeR: ID of node which will be retained by multi-point constraint
# nodeC: ID of node which will be constrained by multi-point constraint

# Spring stiffness: very small number (not using zero) to avoid numerical convergence issue
set K 1e-9;

# Create the material and zero length element (spring)
uniaxialMaterial Elastic $eleID $K;
element zeroLength $eleID $nodeR $nodeC -mat $stiffMatID $stiffMatID $eleID -dir 1 2 6 -orient 0 1 0 1 0 0;

# Constrain the translational DOF with a multi-point constraint
#           retained    constrained DOF1    DOF2
# equalDOF    $nodeR      $nodeC      1       2
}



##############################################################################################################################
#                               Check section class				                                             #
##############################################################################################################################

proc check_class {Element_Level Fy} {

# Check local width to thickness ratios for compression elements 
# CSA S16-14 : clause 27.2.2 requires beams to be class 1 elements (elements able to fully yield)
# CSA S16-14 : clause 27.2.3.1 requires columns to be class 1 or 2 (unless expected to develop plastic hinging, where class 1 is the limit)
# Relaxed checking to class 2 for columns is not implemented yet

set htw 	[expr ([lindex $Element_Level 1]-2*[lindex $Element_Level 5])/[lindex $Element_Level 4]] ; 
set bf_2tf 	[expr [lindex $Element_Level 3]/(2*[lindex $Element_Level 5])];

#######################
# Set slenderness limits : 
set web_lim [expr 1100/[expr {pow($Fy,0.5)}]];
set flange_lim [expr 145/[expr {pow($Fy,0.5)}]];

########################
# Initiate slenderness flags
set web_slenderness 0 ; 
set flange_slenderness 0;

########################
# Check if limits exceeded : 
if {$htw > $web_lim} {
	set web_slenderness 1; 
}
if {$bf_2tf > $flange_lim} {
	set flange_slenderness 1; 
}

#########################
# Evaluate results
 
if {[expr $web_slenderness+$flange_slenderness] > 0} {
	puts "Local slenderness check failed for [lindex $Element_level 0]"
}

}

##############################################################################################################################
#                               Map nonlinear uncertainty to string names	                                            #
##############################################################################################################################




proc create_string_names {Element_name ConnectionType} {



if {$ConnectionType == 0} {
	set Connection "BEAM"
}
if {$ConnectionType == 1} {
	set Connection "CLN"
}

append RV_My $Element_name "_" $Connection "_My";
append RV_theta_p $Element_name "_" $Connection "_theta_p";
append RV_theta_pc $Element_name "_" $Connection "_theta_pc";

# Fetch from global the actual variables

global $RV_My
global $RV_theta_p
global $RV_theta_pc

puts "[expr $$RV_My] [expr $$RV_theta_p] [expr $$RV_theta_pc]"





# Procedure output
set RV_names [list $RV_My $RV_theta_p $RV_theta_pc];
return $RV_names
}

puts "All Functions and Procedures Have Been Sourced"


