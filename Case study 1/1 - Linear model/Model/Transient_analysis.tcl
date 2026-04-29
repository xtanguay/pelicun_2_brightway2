
#recorder Drift -file RoofDrift.out -time -iNode 71 -jNode 720 -dof 1 -perpDirn 2
#numberer Plain

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

# Pure regular Rayleigh damping : 
#set lambda1 [lindex $lambdaN 0]
#set omega1 [expr pow($lambda1,0.5)];
#set omegaI [expr pow($lambdaI,0.5)];
#set omegaJ [expr pow($lambdaJ,0.5)];
#set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)];
#set betaKinit [expr 0 *2.0*$xDamp/($omegaI+$omegaJ)];
#set betaKcomm [expr 0 *2.0*$xDamp/($omegaI+$omegaJ)];
#set betaKcurr [expr 1 *2.0*$xDamp/($omegaI+$omegaJ)];
#rayleigh $alphaM $betaKcurr $betaKinit $betaKcomm;

##########################################################
# Alternate solution : implement modal damping with a small amount of Rayleigh damping to cover higher modes. See Chopra and McKenna 2015 and NIST GCR 17-917-46v2
eigen 18 ; 
modalDampingQ 0.01 ;

# Add a small amount of Rayleigh damping

set omegaI [expr pow($lambdaI,0.5)];
set omegaJ [expr pow($lambdaJ,0.5)]; 

set omegaI_modal [expr $omegaI/0.1]; # Start period range from 0.1*T1
set omegaJ_modal [expr $omegaJ/2];  # End period range after 2.0*T2 

set alphaM_modal [expr 0.1*$xDamp*(2*$omegaI_modal*$omegaJ_modal)/($omegaI_modal+$omegaJ_modal)];
set betaKinit_modal [expr 0.1*0 *2.0*$xDamp/($omegaI_modal+$omegaJ_modal)];
set betaKcomm_modal [expr 0.1*0 *2.0*$xDamp/($omegaI_modal+$omegaJ_modal)];
set betaKcurr_modal [expr 0.1*1 *2.0*$xDamp/($omegaI_modal+$omegaJ_modal)];
rayleigh $alphaM_modal $betaKcurr_modal $betaKinit_modal $betaKcomm_modal;
##########################################################

set	pi	[expr 2.0*asin(1.0)];
set T1 [expr 2*$pi/($lambda1**0.5)]
set dTana [expr $T1/20.]
puts "T1 is $T1"
puts "The analysis basic timestep is : $dTana , while the record dt is $dt"


if {$dt < $dTana} {
set dTana $dt ; 
puts "Analysis timestep updated! New dt: $dTana" ; 
}

##################################
set ok 0 ;
set tFinal [expr $numStep *$dt + 100]  ;  ## Add 100 seconds of free vibration after the event
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
