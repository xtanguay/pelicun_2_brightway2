

###########################
# WE-UQ uncertainty parameters
#pset dmping 0.01
#pset Drfmass 1518.75
#pset Dintrmass 1125.0
#pset Lrfmass 450.0
#pset Lintrmass 1125.0
#pset Ymod 29000
###########################

set Dintrmass [expr double($Dintrmass)]
set Lintrmass [expr double($Lintrmass)]
set Lrfmass [expr double($Lrfmass)]
set Drfmass [expr double($Drfmass)]


### Model main script 

# Define model builder
model BasicBuilder -ndm 2 -ndf 3

# Define units 
source Units.tcl

# Define variables 
source Variables.tcl

# Define functions and procedures
source Add_on_functions.tcl

# Define nodes 
source Add_nodes.tcl 
# Will create nodes for a 19 story, 5 bays building, including a leaning column and leaning column springs. 

# Defines fixities 
source Node_fixities.tcl 
# Will fix translation and rotation at all ground level nodes. Leaning column is hinged.

# Define floor constraints 
source Node_constraints_leaning_column.tcl

# Define relevant cross sections
source Add_frame_cross_sections.tcl
### Relies on the Add_on_functions and the Database.csv file to find and assign the section properties


# Define beam elements
source Assign_beams.tcl
### The beams are elasticBeamColumns
### The rigid links between leaning column and frame are truss elements (uniaxial materials with large area). 
### Beam naming convention : "2+Node_J+Node_I" 

# Define column elements 
source Assign_columns.tcl
### Relies on the Add_on_functions and the Database.csv file to find and assign the section properties
### The beams are elasticBeamColumns
### The leaning column elements are elasticBeamColumns, with a large area and inertia
### The leaning column elements are defined between leaning column springs (not yet attached to the rigid beams)
### Column naming convention : "3+Node_J+Node_I"

# Define rotational springs & leaning columns
source Assign_springs_leaning_column.tcl
### Relies on the Add_functions -> rotLeaningCol (essentially assigns a zeroLength element and constrains translation displacements in vertical and horizontal directions)
### A very small rotational stiffness is provided to the column springs (1e-9 kips/inch) 

########## source Get_gravity_reactions.tcl
# Perform gravity analysis
source Gravity_loads.tcl 
source Perform_gravity.tcl

loadConst -time 0.0
wipeAnalysis
### Applies 1.0D + 0.25L
### Get reactions out : are they alike expectations??


######################
# Saving periods
######################
 
# Define masses (follows masses as per in Guan et al 2020 -- that is : no changes made here) 
source Assign_masses.tcl

# Perform an Eigen analysis 
set xDamp $dmping

set pi [expr 2.0*asin(1.0)];                        # Definition of pi 
set lambdaN [eigen 18];
set n_lambda [llength $lambdaN];

# Saving periods to dictionary
for {set i_itr 0} {$i_itr < $n_lambda} {incr i_itr} {
	set Ti [expr 2*$pi/[expr {pow([lindex $lambdaN $i_itr],0.5)}]]
	dict set Eigen_periods Eigen[expr $i_itr+1] $Ti
}

set file_output_eigen [open Eigen_periods.txt w]
dict for {key value} $Eigen_periods {
    puts $file_output_eigen "$key $value"
}

close $file_output_eigen


#########################
# Saving element axial forces
#########################

for {set y_itr 1} {$y_itr <20} {incr y_itr} {
	for {set x_itr 1} {$x_itr <7} {incr x_itr} {
		
		set bttm_node	[expr $x_itr][expr $y_itr]1
		set tp_node		[expr $x_itr][expr $y_itr+1]1		
		set column_ele_tag 	3[expr $bttm_node][expr $tp_node]
		set resp		[eleResponse $column_ele_tag force]

		# Append to a dictionary named "elem_P_forces"
		dict set elem_P_forces Story[expr $y_itr]Pier[expr $x_itr] [lindex $resp 1] 
}
}




# Output the element forces with their respective tags
set file_output [open elem_P_forces.txt w]

dict for {key value} $elem_P_forces {
    puts $file_output "$key $value"
}

close $file_output

puts "The following variables are retained for this simulation : Damping : $dmping, Y modulus : $Ymod, intermediate floor mass (dead,live) : ($Dintrmass,$Lintrmass), roof floor mass (dead, live) : ($Drfmass,$Lrfmass) "



