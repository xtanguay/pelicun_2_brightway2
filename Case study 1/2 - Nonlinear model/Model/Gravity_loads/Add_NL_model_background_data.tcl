set fp [open elem_P_forces.txt]
set CLN_gravity_loads [read $fp]
close $fp

# Example read of the dictionary : 
#puts [dict get $CLN_gravity_loads Story1Pier1]


set fp2 [open Eigen_periods.txt]
set Eigen_rslts [read $fp2]
close $fp2