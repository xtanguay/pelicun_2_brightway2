# Base units

set kip 1 ;
set inch 1 ;
set sec 1;

# Other units
set ft [expr 12*$inch];
set ksi [expr pow($kip/$inch,2)];
set psi [expr $ksi/1000];


# Physical constants
set g [expr 32.2*$ft/pow($sec,2)]


# Unit conversions
set m [expr 3.281*$ft]
set kN [expr 0.2248*$kip]
set kPa [expr $kN/pow($m,2)]
