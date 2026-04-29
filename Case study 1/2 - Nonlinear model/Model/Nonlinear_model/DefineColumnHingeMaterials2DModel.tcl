# This file will be used to define column hinge material models


# Story1Pier1
set	ColumnHingeMaterialStory1Pier1Tag	60001;
set 	ColumnHingeMaterialStory1Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier1Tag $ColumnHingeMaterialStory1Pier1properties

# Story1Pier2
set	ColumnHingeMaterialStory1Pier2Tag	60002;
set 	ColumnHingeMaterialStory1Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier2Tag $ColumnHingeMaterialStory1Pier2properties

# Story1Pier3
set	ColumnHingeMaterialStory1Pier3Tag	60003;
set 	ColumnHingeMaterialStory1Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier3Tag $ColumnHingeMaterialStory1Pier3properties

# Story1Pier4
set	ColumnHingeMaterialStory1Pier4Tag	60004;
set 	ColumnHingeMaterialStory1Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier4Tag $ColumnHingeMaterialStory1Pier4properties

# Story1Pier5
set	ColumnHingeMaterialStory1Pier5Tag	60005;
set 	ColumnHingeMaterialStory1Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier5Tag $ColumnHingeMaterialStory1Pier5properties

# Story1Pier6
set	ColumnHingeMaterialStory1Pier6Tag	60006;
set 	ColumnHingeMaterialStory1Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory1 $FirstStory 0 [lindex $BeamLevel2 1] $Fy $Es [dict get $CLN_gravity_loads Story1Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory1Pier6Tag $ColumnHingeMaterialStory1Pier6properties

# Story2Pier1
set	ColumnHingeMaterialStory2Pier1Tag	60007;
set 	ColumnHingeMaterialStory2Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier1Tag $ColumnHingeMaterialStory2Pier1properties

# Story2Pier2
set	ColumnHingeMaterialStory2Pier2Tag	60008;
set 	ColumnHingeMaterialStory2Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier2Tag $ColumnHingeMaterialStory2Pier2properties

# Story2Pier3
set	ColumnHingeMaterialStory2Pier3Tag	60009;
set 	ColumnHingeMaterialStory2Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier3Tag $ColumnHingeMaterialStory2Pier3properties

# Story2Pier4
set	ColumnHingeMaterialStory2Pier4Tag	60010;
set 	ColumnHingeMaterialStory2Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier4Tag $ColumnHingeMaterialStory2Pier4properties

# Story2Pier5
set	ColumnHingeMaterialStory2Pier5Tag	60011;
set 	ColumnHingeMaterialStory2Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier5Tag $ColumnHingeMaterialStory2Pier5properties

# Story2Pier6
set	ColumnHingeMaterialStory2Pier6Tag	60012;
set 	ColumnHingeMaterialStory2Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory2 $TypicalStory [lindex $BeamLevel2 1] [lindex $BeamLevel3 1] $Fy $Es [dict get $CLN_gravity_loads Story2Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory2Pier6Tag $ColumnHingeMaterialStory2Pier6properties

# Story3Pier1
set	ColumnHingeMaterialStory3Pier1Tag	60013;
set 	ColumnHingeMaterialStory3Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier1Tag $ColumnHingeMaterialStory3Pier1properties

# Story3Pier2
set	ColumnHingeMaterialStory3Pier2Tag	60014;
set 	ColumnHingeMaterialStory3Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier2Tag $ColumnHingeMaterialStory3Pier2properties

# Story3Pier3
set	ColumnHingeMaterialStory3Pier3Tag	60015;
set 	ColumnHingeMaterialStory3Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier3Tag $ColumnHingeMaterialStory3Pier3properties

# Story3Pier4
set	ColumnHingeMaterialStory3Pier4Tag	60016;
set 	ColumnHingeMaterialStory3Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier4Tag $ColumnHingeMaterialStory3Pier4properties

# Story3Pier5
set	ColumnHingeMaterialStory3Pier5Tag	60017;
set 	ColumnHingeMaterialStory3Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier5Tag $ColumnHingeMaterialStory3Pier5properties

# Story3Pier6
set	ColumnHingeMaterialStory3Pier6Tag	60018;
set 	ColumnHingeMaterialStory3Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory3 $TypicalStory [lindex $BeamLevel3 1] [lindex $BeamLevel4 1] $Fy $Es [dict get $CLN_gravity_loads Story3Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory3Pier6Tag $ColumnHingeMaterialStory3Pier6properties

# Story4Pier1
set	ColumnHingeMaterialStory4Pier1Tag	60019;
set 	ColumnHingeMaterialStory4Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier1Tag $ColumnHingeMaterialStory4Pier1properties

# Story4Pier2
set	ColumnHingeMaterialStory4Pier2Tag	60020;
set 	ColumnHingeMaterialStory4Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier2Tag $ColumnHingeMaterialStory4Pier2properties

# Story4Pier3
set	ColumnHingeMaterialStory4Pier3Tag	60021;
set 	ColumnHingeMaterialStory4Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier3Tag $ColumnHingeMaterialStory4Pier3properties

# Story4Pier4
set	ColumnHingeMaterialStory4Pier4Tag	60022;
set 	ColumnHingeMaterialStory4Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier4Tag $ColumnHingeMaterialStory4Pier4properties

# Story4Pier5
set	ColumnHingeMaterialStory4Pier5Tag	60023;
set 	ColumnHingeMaterialStory4Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier5Tag $ColumnHingeMaterialStory4Pier5properties

# Story4Pier6
set	ColumnHingeMaterialStory4Pier6Tag	60024;
set 	ColumnHingeMaterialStory4Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory4 $TypicalStory [lindex $BeamLevel4 1] [lindex $BeamLevel5 1] $Fy $Es [dict get $CLN_gravity_loads Story4Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory4Pier6Tag $ColumnHingeMaterialStory4Pier6properties

# Story5Pier1
set	ColumnHingeMaterialStory5Pier1Tag	60025;
set 	ColumnHingeMaterialStory5Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier1Tag $ColumnHingeMaterialStory5Pier1properties

# Story5Pier2
set	ColumnHingeMaterialStory5Pier2Tag	60026;
set 	ColumnHingeMaterialStory5Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier2Tag $ColumnHingeMaterialStory5Pier2properties

# Story5Pier3
set	ColumnHingeMaterialStory5Pier3Tag	60027;
set 	ColumnHingeMaterialStory5Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier3Tag $ColumnHingeMaterialStory5Pier3properties

# Story5Pier4
set	ColumnHingeMaterialStory5Pier4Tag	60028;
set 	ColumnHingeMaterialStory5Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier4Tag $ColumnHingeMaterialStory5Pier4properties

# Story5Pier5
set	ColumnHingeMaterialStory5Pier5Tag	60029;
set 	ColumnHingeMaterialStory5Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier5Tag $ColumnHingeMaterialStory5Pier5properties

# Story5Pier6
set	ColumnHingeMaterialStory5Pier6Tag	60030;
set 	ColumnHingeMaterialStory5Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory5 $TypicalStory [lindex $BeamLevel5 1] [lindex $BeamLevel6 1] $Fy $Es [dict get $CLN_gravity_loads Story5Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory5Pier6Tag $ColumnHingeMaterialStory5Pier6properties

# Story6Pier1
set	ColumnHingeMaterialStory6Pier1Tag	60031;
set 	ColumnHingeMaterialStory6Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier1Tag $ColumnHingeMaterialStory6Pier1properties

# Story6Pier2
set	ColumnHingeMaterialStory6Pier2Tag	60032;
set 	ColumnHingeMaterialStory6Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier2Tag $ColumnHingeMaterialStory6Pier2properties

# Story6Pier3
set	ColumnHingeMaterialStory6Pier3Tag	60033;
set 	ColumnHingeMaterialStory6Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier3Tag $ColumnHingeMaterialStory6Pier3properties

# Story6Pier4
set	ColumnHingeMaterialStory6Pier4Tag	60034;
set 	ColumnHingeMaterialStory6Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier4Tag $ColumnHingeMaterialStory6Pier4properties

# Story6Pier5
set	ColumnHingeMaterialStory6Pier5Tag	60035;
set 	ColumnHingeMaterialStory6Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier5Tag $ColumnHingeMaterialStory6Pier5properties

# Story6Pier6
set	ColumnHingeMaterialStory6Pier6Tag	60036;
set 	ColumnHingeMaterialStory6Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory6 $TypicalStory [lindex $BeamLevel6 1] [lindex $BeamLevel7 1] $Fy $Es [dict get $CLN_gravity_loads Story6Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory6Pier6Tag $ColumnHingeMaterialStory6Pier6properties

# Story7Pier1
set	ColumnHingeMaterialStory7Pier1Tag	60037;
set 	ColumnHingeMaterialStory7Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier1Tag $ColumnHingeMaterialStory7Pier1properties

# Story7Pier2
set	ColumnHingeMaterialStory7Pier2Tag	60038;
set 	ColumnHingeMaterialStory7Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier2Tag $ColumnHingeMaterialStory7Pier2properties

# Story7Pier3
set	ColumnHingeMaterialStory7Pier3Tag	60039;
set 	ColumnHingeMaterialStory7Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier3Tag $ColumnHingeMaterialStory7Pier3properties

# Story7Pier4
set	ColumnHingeMaterialStory7Pier4Tag	60040;
set 	ColumnHingeMaterialStory7Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier4Tag $ColumnHingeMaterialStory7Pier4properties

# Story7Pier5
set	ColumnHingeMaterialStory7Pier5Tag	60041;
set 	ColumnHingeMaterialStory7Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier5Tag $ColumnHingeMaterialStory7Pier5properties

# Story7Pier6
set	ColumnHingeMaterialStory7Pier6Tag	60042;
set 	ColumnHingeMaterialStory7Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory7 $TypicalStory [lindex $BeamLevel7 1] [lindex $BeamLevel8 1] $Fy $Es [dict get $CLN_gravity_loads Story7Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory7Pier6Tag $ColumnHingeMaterialStory7Pier6properties

# Story8Pier1
set	ColumnHingeMaterialStory8Pier1Tag	60043;
set 	ColumnHingeMaterialStory8Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier1Tag $ColumnHingeMaterialStory8Pier1properties

# Story8Pier2
set	ColumnHingeMaterialStory8Pier2Tag	60044;
set 	ColumnHingeMaterialStory8Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier2Tag $ColumnHingeMaterialStory8Pier2properties

# Story8Pier3
set	ColumnHingeMaterialStory8Pier3Tag	60045;
set 	ColumnHingeMaterialStory8Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier3Tag $ColumnHingeMaterialStory8Pier3properties

# Story8Pier4
set	ColumnHingeMaterialStory8Pier4Tag	60046;
set 	ColumnHingeMaterialStory8Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier4Tag $ColumnHingeMaterialStory8Pier4properties

# Story8Pier5
set	ColumnHingeMaterialStory8Pier5Tag	60047;
set 	ColumnHingeMaterialStory8Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier5Tag $ColumnHingeMaterialStory8Pier5properties

# Story8Pier6
set	ColumnHingeMaterialStory8Pier6Tag	60048;
set 	ColumnHingeMaterialStory8Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory8 $TypicalStory [lindex $BeamLevel8 1] [lindex $BeamLevel9 1] $Fy $Es [dict get $CLN_gravity_loads Story8Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory8Pier6Tag $ColumnHingeMaterialStory8Pier6properties

# Story9Pier1
set	ColumnHingeMaterialStory9Pier1Tag	60049;
set 	ColumnHingeMaterialStory9Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier1Tag $ColumnHingeMaterialStory9Pier1properties

# Story9Pier2
set	ColumnHingeMaterialStory9Pier2Tag	60050;
set 	ColumnHingeMaterialStory9Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier2Tag $ColumnHingeMaterialStory9Pier2properties

# Story9Pier3
set	ColumnHingeMaterialStory9Pier3Tag	60051;
set 	ColumnHingeMaterialStory9Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier3Tag $ColumnHingeMaterialStory9Pier3properties

# Story9Pier4
set	ColumnHingeMaterialStory9Pier4Tag	60052;
set 	ColumnHingeMaterialStory9Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier4Tag $ColumnHingeMaterialStory9Pier4properties

# Story9Pier5
set	ColumnHingeMaterialStory9Pier5Tag	60053;
set 	ColumnHingeMaterialStory9Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier5Tag $ColumnHingeMaterialStory9Pier5properties

# Story9Pier6
set	ColumnHingeMaterialStory9Pier6Tag	60054;
set 	ColumnHingeMaterialStory9Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory9 $TypicalStory [lindex $BeamLevel9 1] [lindex $BeamLevel10 1] $Fy $Es [dict get $CLN_gravity_loads Story9Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory9Pier6Tag $ColumnHingeMaterialStory9Pier6properties

# Story10Pier1
set	ColumnHingeMaterialStory10Pier1Tag	60055;
set 	ColumnHingeMaterialStory10Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier1Tag $ColumnHingeMaterialStory10Pier1properties

# Story10Pier2
set	ColumnHingeMaterialStory10Pier2Tag	60056;
set 	ColumnHingeMaterialStory10Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier2Tag $ColumnHingeMaterialStory10Pier2properties

# Story10Pier3
set	ColumnHingeMaterialStory10Pier3Tag	60057;
set 	ColumnHingeMaterialStory10Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier3Tag $ColumnHingeMaterialStory10Pier3properties

# Story10Pier4
set	ColumnHingeMaterialStory10Pier4Tag	60058;
set 	ColumnHingeMaterialStory10Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier4Tag $ColumnHingeMaterialStory10Pier4properties

# Story10Pier5
set	ColumnHingeMaterialStory10Pier5Tag	60059;
set 	ColumnHingeMaterialStory10Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier5Tag $ColumnHingeMaterialStory10Pier5properties

# Story10Pier6
set	ColumnHingeMaterialStory10Pier6Tag	60060;
set 	ColumnHingeMaterialStory10Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory10 $TypicalStory [lindex $BeamLevel10 1] [lindex $BeamLevel11 1] $Fy $Es [dict get $CLN_gravity_loads Story10Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory10Pier6Tag $ColumnHingeMaterialStory10Pier6properties

# Story11Pier1
set	ColumnHingeMaterialStory11Pier1Tag	60061;
set 	ColumnHingeMaterialStory11Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier1Tag $ColumnHingeMaterialStory11Pier1properties

# Story11Pier2
set	ColumnHingeMaterialStory11Pier2Tag	60062;
set 	ColumnHingeMaterialStory11Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier2Tag $ColumnHingeMaterialStory11Pier2properties

# Story11Pier3
set	ColumnHingeMaterialStory11Pier3Tag	60063;
set 	ColumnHingeMaterialStory11Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier3Tag $ColumnHingeMaterialStory11Pier3properties

# Story11Pier4
set	ColumnHingeMaterialStory11Pier4Tag	60064;
set 	ColumnHingeMaterialStory11Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier4Tag $ColumnHingeMaterialStory11Pier4properties

# Story11Pier5
set	ColumnHingeMaterialStory11Pier5Tag	60065;
set 	ColumnHingeMaterialStory11Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier5Tag $ColumnHingeMaterialStory11Pier5properties

# Story11Pier6
set	ColumnHingeMaterialStory11Pier6Tag	60066;
set 	ColumnHingeMaterialStory11Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory11 $TypicalStory [lindex $BeamLevel11 1] [lindex $BeamLevel12 1] $Fy $Es [dict get $CLN_gravity_loads Story11Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory11Pier6Tag $ColumnHingeMaterialStory11Pier6properties

# Story12Pier1
set	ColumnHingeMaterialStory12Pier1Tag	60067;
set 	ColumnHingeMaterialStory12Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier1Tag $ColumnHingeMaterialStory12Pier1properties

# Story12Pier2
set	ColumnHingeMaterialStory12Pier2Tag	60068;
set 	ColumnHingeMaterialStory12Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier2Tag $ColumnHingeMaterialStory12Pier2properties

# Story12Pier3
set	ColumnHingeMaterialStory12Pier3Tag	60069;
set 	ColumnHingeMaterialStory12Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier3Tag $ColumnHingeMaterialStory12Pier3properties

# Story12Pier4
set	ColumnHingeMaterialStory12Pier4Tag	60070;
set 	ColumnHingeMaterialStory12Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier4Tag $ColumnHingeMaterialStory12Pier4properties

# Story12Pier5
set	ColumnHingeMaterialStory12Pier5Tag	60071;
set 	ColumnHingeMaterialStory12Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier5Tag $ColumnHingeMaterialStory12Pier5properties

# Story12Pier6
set	ColumnHingeMaterialStory12Pier6Tag	60072;
set 	ColumnHingeMaterialStory12Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory12 $TypicalStory [lindex $BeamLevel12 1] [lindex $BeamLevel13 1] $Fy $Es [dict get $CLN_gravity_loads Story12Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory12Pier6Tag $ColumnHingeMaterialStory12Pier6properties

# Story13Pier1
set	ColumnHingeMaterialStory13Pier1Tag	60073;
set 	ColumnHingeMaterialStory13Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier1Tag $ColumnHingeMaterialStory13Pier1properties

# Story13Pier2
set	ColumnHingeMaterialStory13Pier2Tag	60074;
set 	ColumnHingeMaterialStory13Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier2Tag $ColumnHingeMaterialStory13Pier2properties

# Story13Pier3
set	ColumnHingeMaterialStory13Pier3Tag	60075;
set 	ColumnHingeMaterialStory13Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier3Tag $ColumnHingeMaterialStory13Pier3properties

# Story13Pier4
set	ColumnHingeMaterialStory13Pier4Tag	60076;
set 	ColumnHingeMaterialStory13Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier4Tag $ColumnHingeMaterialStory13Pier4properties

# Story13Pier5
set	ColumnHingeMaterialStory13Pier5Tag	60077;
set 	ColumnHingeMaterialStory13Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier5Tag $ColumnHingeMaterialStory13Pier5properties

# Story13Pier6
set	ColumnHingeMaterialStory13Pier6Tag	60078;
set 	ColumnHingeMaterialStory13Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory13 $TypicalStory [lindex $BeamLevel13 1] [lindex $BeamLevel14 1] $Fy $Es [dict get $CLN_gravity_loads Story13Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory13Pier6Tag $ColumnHingeMaterialStory13Pier6properties

# Story14Pier1
set	ColumnHingeMaterialStory14Pier1Tag	60079;
set 	ColumnHingeMaterialStory14Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier1Tag $ColumnHingeMaterialStory14Pier1properties

# Story14Pier2
set	ColumnHingeMaterialStory14Pier2Tag	60080;
set 	ColumnHingeMaterialStory14Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier2Tag $ColumnHingeMaterialStory14Pier2properties

# Story14Pier3
set	ColumnHingeMaterialStory14Pier3Tag	60081;
set 	ColumnHingeMaterialStory14Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier3Tag $ColumnHingeMaterialStory14Pier3properties

# Story14Pier4
set	ColumnHingeMaterialStory14Pier4Tag	60082;
set 	ColumnHingeMaterialStory14Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier4Tag $ColumnHingeMaterialStory14Pier4properties

# Story14Pier5
set	ColumnHingeMaterialStory14Pier5Tag	60083;
set 	ColumnHingeMaterialStory14Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier5Tag $ColumnHingeMaterialStory14Pier5properties

# Story14Pier6
set	ColumnHingeMaterialStory14Pier6Tag	60084;
set 	ColumnHingeMaterialStory14Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory14 $TypicalStory [lindex $BeamLevel14 1] [lindex $BeamLevel15 1] $Fy $Es [dict get $CLN_gravity_loads Story14Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory14Pier6Tag $ColumnHingeMaterialStory14Pier6properties

# Story15Pier1
set	ColumnHingeMaterialStory15Pier1Tag	60085;
set 	ColumnHingeMaterialStory15Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier1Tag $ColumnHingeMaterialStory15Pier1properties

# Story15Pier2
set	ColumnHingeMaterialStory15Pier2Tag	60086;
set 	ColumnHingeMaterialStory15Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier2Tag $ColumnHingeMaterialStory15Pier2properties

# Story15Pier3
set	ColumnHingeMaterialStory15Pier3Tag	60087;
set 	ColumnHingeMaterialStory15Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier3Tag $ColumnHingeMaterialStory15Pier3properties

# Story15Pier4
set	ColumnHingeMaterialStory15Pier4Tag	60088;
set 	ColumnHingeMaterialStory15Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier4Tag $ColumnHingeMaterialStory15Pier4properties

# Story15Pier5
set	ColumnHingeMaterialStory15Pier5Tag	60089;
set 	ColumnHingeMaterialStory15Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier5Tag $ColumnHingeMaterialStory15Pier5properties

# Story15Pier6
set	ColumnHingeMaterialStory15Pier6Tag	60090;
set 	ColumnHingeMaterialStory15Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory15 $TypicalStory [lindex $BeamLevel15 1] [lindex $BeamLevel16 1] $Fy $Es [dict get $CLN_gravity_loads Story15Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory15Pier6Tag $ColumnHingeMaterialStory15Pier6properties

# Story16Pier1
set	ColumnHingeMaterialStory16Pier1Tag	60091;
set 	ColumnHingeMaterialStory16Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier1Tag $ColumnHingeMaterialStory16Pier1properties

# Story16Pier2
set	ColumnHingeMaterialStory16Pier2Tag	60092;
set 	ColumnHingeMaterialStory16Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier2Tag $ColumnHingeMaterialStory16Pier2properties

# Story16Pier3
set	ColumnHingeMaterialStory16Pier3Tag	60093;
set 	ColumnHingeMaterialStory16Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier3Tag $ColumnHingeMaterialStory16Pier3properties

# Story16Pier4
set	ColumnHingeMaterialStory16Pier4Tag	60094;
set 	ColumnHingeMaterialStory16Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier4Tag $ColumnHingeMaterialStory16Pier4properties

# Story16Pier5
set	ColumnHingeMaterialStory16Pier5Tag	60095;
set 	ColumnHingeMaterialStory16Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier5Tag $ColumnHingeMaterialStory16Pier5properties

# Story16Pier6
set	ColumnHingeMaterialStory16Pier6Tag	60096;
set 	ColumnHingeMaterialStory16Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory16 $TypicalStory [lindex $BeamLevel16 1] [lindex $BeamLevel17 1] $Fy $Es [dict get $CLN_gravity_loads Story16Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory16Pier6Tag $ColumnHingeMaterialStory16Pier6properties

# Story17Pier1
set	ColumnHingeMaterialStory17Pier1Tag	60097;
set 	ColumnHingeMaterialStory17Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier1Tag $ColumnHingeMaterialStory17Pier1properties

# Story17Pier2
set	ColumnHingeMaterialStory17Pier2Tag	60098;
set 	ColumnHingeMaterialStory17Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier2Tag $ColumnHingeMaterialStory17Pier2properties

# Story17Pier3
set	ColumnHingeMaterialStory17Pier3Tag	60099;
set 	ColumnHingeMaterialStory17Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier3Tag $ColumnHingeMaterialStory17Pier3properties

# Story17Pier4
set	ColumnHingeMaterialStory17Pier4Tag	60100;
set 	ColumnHingeMaterialStory17Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier4Tag $ColumnHingeMaterialStory17Pier4properties

# Story17Pier5
set	ColumnHingeMaterialStory17Pier5Tag	60101;
set 	ColumnHingeMaterialStory17Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier5Tag $ColumnHingeMaterialStory17Pier5properties

# Story17Pier6
set	ColumnHingeMaterialStory17Pier6Tag	60102;
set 	ColumnHingeMaterialStory17Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory17 $TypicalStory [lindex $BeamLevel17 1] [lindex $BeamLevel18 1] $Fy $Es [dict get $CLN_gravity_loads Story17Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory17Pier6Tag $ColumnHingeMaterialStory17Pier6properties

# Story18Pier1
set	ColumnHingeMaterialStory18Pier1Tag	60103;
set 	ColumnHingeMaterialStory18Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier1Tag $ColumnHingeMaterialStory18Pier1properties

# Story18Pier2
set	ColumnHingeMaterialStory18Pier2Tag	60104;
set 	ColumnHingeMaterialStory18Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier2Tag $ColumnHingeMaterialStory18Pier2properties

# Story18Pier3
set	ColumnHingeMaterialStory18Pier3Tag	60105;
set 	ColumnHingeMaterialStory18Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier3Tag $ColumnHingeMaterialStory18Pier3properties

# Story18Pier4
set	ColumnHingeMaterialStory18Pier4Tag	60106;
set 	ColumnHingeMaterialStory18Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier4Tag $ColumnHingeMaterialStory18Pier4properties

# Story18Pier5
set	ColumnHingeMaterialStory18Pier5Tag	60107;
set 	ColumnHingeMaterialStory18Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier5Tag $ColumnHingeMaterialStory18Pier5properties

# Story18Pier6
set	ColumnHingeMaterialStory18Pier6Tag	60108;
set 	ColumnHingeMaterialStory18Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory18 $TypicalStory [lindex $BeamLevel18 1] [lindex $BeamLevel19 1] $Fy $Es [dict get $CLN_gravity_loads Story18Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory18Pier6Tag $ColumnHingeMaterialStory18Pier6properties

# Story19Pier1
set	ColumnHingeMaterialStory19Pier1Tag	60109;
set 	ColumnHingeMaterialStory19Pier1properties [Assemble_IMK_spring_material $ExteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier1] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier1Tag $ColumnHingeMaterialStory19Pier1properties

# Story19Pier2
set	ColumnHingeMaterialStory19Pier2Tag	60110;
set 	ColumnHingeMaterialStory19Pier2properties [Assemble_IMK_spring_material $InteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier2] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier2Tag $ColumnHingeMaterialStory19Pier2properties

# Story19Pier3
set	ColumnHingeMaterialStory19Pier3Tag	60111;
set 	ColumnHingeMaterialStory19Pier3properties [Assemble_IMK_spring_material $InteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier3] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier3Tag $ColumnHingeMaterialStory19Pier3properties

# Story19Pier4
set	ColumnHingeMaterialStory19Pier4Tag	60112;
set 	ColumnHingeMaterialStory19Pier4properties [Assemble_IMK_spring_material $InteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier4] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier4Tag $ColumnHingeMaterialStory19Pier4properties

# Story19Pier5
set	ColumnHingeMaterialStory19Pier5Tag	60113;
set 	ColumnHingeMaterialStory19Pier5properties [Assemble_IMK_spring_material $InteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier5] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier5Tag $ColumnHingeMaterialStory19Pier5properties

# Story19Pier6
set	ColumnHingeMaterialStory19Pier6Tag	60114;
set 	ColumnHingeMaterialStory19Pier6properties [Assemble_IMK_spring_material $ExteriorColumnStory19 $TypicalStory [lindex $BeamLevel19 1] [lindex $BeamLevel20 1] $Fy $Es [dict get $CLN_gravity_loads Story19Pier6] 2 1.0];
CreateIMKMaterial $ColumnHingeMaterialStory19Pier6Tag $ColumnHingeMaterialStory19Pier6properties

puts "Column hinge materials defined"