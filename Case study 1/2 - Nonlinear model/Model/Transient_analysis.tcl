
recorder Drift -file RoofDrift.out -time -iNode 71 -jNode 720 -dof 1 -perpDirn 2

numberer RCM
constraints Transformation
system Umfpack
integrator Newmark 0.5 0.25
#test NormUnbalance 1.0e-2 10 
#algorithm Newton


# set the test parameters
set testType EnergyIncr
set testTol 1.0e-8;
set testIter 25;
test $testType $testTol $testIter


# set the solution algorithm 
set algoType KrylovNewton
algorithm $algoType


analysis Transient -numSubLevels 2 -numSubSteps 10



set omega1 $periodForRayleighDamping_1

set	pi	[expr 2.0*asin(1.0)];
set T1 [expr 2*$pi/$omega1]
set dTana [expr $T1/20.]

puts "The analysis basic timestep is : $dTana , while the record dt is $dt" ;


if {$dt < $dTana} {
set dTana $dt ; 
puts "Analysis timestep updated! New dt: $dTana" ; 
}



##################################

set ok 0 ;
set tFinal [expr $numStep *$dt + 100]  ; ## Add 100 seconds of free vibration at the end
set tCurrent [getTime]

while {$ok == 0 && $tCurrent < [expr $tFinal]} {

	puts "$tCurrent"
	set ok [analyze 1 $dTana]
	if {$ok != 0} {
	puts " "
	puts [format "KrylovNewton failed (time = %1.3e), try Newton" $tCurrent]
	algorithm Newton
	test $testType $testTol $testIter 0
	set ok [analyze 1 $dTana]
	algorithm $algoType
	}
	if {$ok != 0} {
	puts " "
	puts [format "Newton failed (time = %1.3e), try Newton w/ iniCurrent" $tCurrent]
	algorithm Newton -initialCurrent
	test $testType $testTol $testIter 0
	set ok [analyze 1 $dTana]
	algorithm $algoType
	}

	if {$ok != 0} {
	puts " "
	puts [format "Newton w/ iniCurrent failed (time = %1.3e), try Newton w/ ini" $tCurrent]
	algorithm Newton -initial
	test $testType $testTol [expr 500 * $testIter] 0
	set ok [analyze 1 $dTana]
	algorithm $algoType
	test $testType $testTol $testIter 0
	}
	if {$ok != 0} {
	puts " "
	puts [format "Newton w/ ini failed (time = %1.3e), try Newton w/ EnergyIncr Test" $tCurrent]
	algorithm Newton
	test EnergyIncr 1.0e-5 $testIter 0
	set ok [analyze 1 $dTana]
	algorithm $algoType
	test $testType $testTol $testIter 0
	}
	if {$ok != 0} {
	puts " "
	puts [format "Newton w/ EnergyIncr Test failed (time = %1.3e),
	try Newton w/ initial and EnergyIncr Test" $tCurrent] 
	algorithm Newton -initial
	test EnergyIncr 1.0e-5 [expr 500 * $testIter] 0
	set ok [analyze 1 $dTana]
	algorithm $algoType
	test $testType $testTol $testIter 0
	}
	set tCurrent [getTime]


	SDRlimitTester $num_storeys $Max_SDR $SDR_nodes 0 $H_storeys 0 ;	
	# Will derive all story drifts. Will also indicate all floors that have exceeded the maximum drift ratio. 

	# Note : the collapse flag is created as a global variable within the SDRlimitTester proceedure. 
	if {$CollapseFlag == "YES"} {
		set ok 1 ;
		cd .. 
		set fileID [open CollapseState.txt a+];   # Create/Open CollapseState.txt file (Read/write. append or create permission)
            	puts $fileID "[lindex $str_split 1]	Collapse";     # Write value of the iteration ID in case of collapse in CollapseState.txt file (
		close $fileID;                            # Close CollapseState.txt file	
		cd $curr_path
	}

	# The analysis failed to converge, although the collapse interstory drift is not exceeded :
	if {$ok != 0 && $CollapseFlag == "NO"} {
		cd ..
		set fileID [open CollapseState.txt a+];   # Create/Open CollapseState.txt file (Read/write. append or create permission)	
            	puts $fileID "[lindex $str_split 1]	Non convergence";     # Write value of the iteration ID in case of non convergence in CollapseState.txt file (
		close $fileID;                            # Close CollapseState.txt file	
		cd $curr_path
	}

	}







	if {$ok != 0} {
	puts " "
	puts "----------------------------------------------------------"
	puts [format "Analysis failed (time = %1.3e)" $tCurrent]
	puts "----------------------------------------------------------"
	puts " "
	}

####################################

puts "Done with this!"

remove recorders 
