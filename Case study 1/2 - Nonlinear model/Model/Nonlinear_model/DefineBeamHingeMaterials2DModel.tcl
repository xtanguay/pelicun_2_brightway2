# This file will be used to define beam hinge material models

# Note : 
# Beam hinges are at the face of the column. This is a simplification.
# According to the document NIST GCR 17-917-46v2, this could be partially resolved using
# a ratio of lenght (see section 4.2). But this may also be slightly overlooked in some cases.  


# Level2Bay1
set	BeamHingeMaterialLevel2Bay1Tag		70001;
set 	BeamHingeMaterialLevel2Bay1properties [Assemble_IMK_spring_material $BeamLevel2 $BayWidth [lindex $ExteriorColumnStory1 1] [lindex $InteriorColumnStory1 1] $Fy $Es 0.0 0 0.747];
CreateIMKMaterial $BeamHingeMaterialLevel2Bay1Tag $BeamHingeMaterialLevel2Bay1properties

# Level2Bay2
set	BeamHingeMaterialLevel2Bay2Tag	70002;
set 	BeamHingeMaterialLevel2Bay2properties [Assemble_IMK_spring_material $BeamLevel2 $BayWidth [lindex $InteriorColumnStory1 1] [lindex $InteriorColumnStory1 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel2Bay2Tag $BeamHingeMaterialLevel2Bay2properties

# Level2Bay3
set	BeamHingeMaterialLevel2Bay3Tag	70003;
set 	BeamHingeMaterialLevel2Bay3properties [Assemble_IMK_spring_material $BeamLevel2 $BayWidth [lindex $InteriorColumnStory1 1] [lindex $InteriorColumnStory1 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel2Bay3Tag $BeamHingeMaterialLevel2Bay3properties

# Level2Bay4
set	BeamHingeMaterialLevel2Bay4Tag	70004;
set 	BeamHingeMaterialLevel2Bay4properties [Assemble_IMK_spring_material $BeamLevel2 $BayWidth [lindex $InteriorColumnStory1 1] [lindex $InteriorColumnStory1 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel2Bay4Tag $BeamHingeMaterialLevel2Bay4properties

# Level2Bay5
set	BeamHingeMaterialLevel2Bay5Tag	70005;
set 	BeamHingeMaterialLevel2Bay5properties [Assemble_IMK_spring_material $BeamLevel2 $BayWidth [lindex $InteriorColumnStory1 1] [lindex $ExteriorColumnStory1 1] $Fy $Es 0.0 0 0.747];
CreateIMKMaterial $BeamHingeMaterialLevel2Bay5Tag $BeamHingeMaterialLevel2Bay5properties

# Level3Bay1
set	BeamHingeMaterialLevel3Bay1Tag	70006;
set 	BeamHingeMaterialLevel3Bay1properties [Assemble_IMK_spring_material $BeamLevel3 $BayWidth [lindex $ExteriorColumnStory2 1] [lindex $InteriorColumnStory2 1] $Fy $Es 0.0 0 0.683];
CreateIMKMaterial $BeamHingeMaterialLevel3Bay1Tag $BeamHingeMaterialLevel3Bay1properties

# Level3Bay2
set	BeamHingeMaterialLevel3Bay2Tag	70007;
set 	BeamHingeMaterialLevel3Bay2properties [Assemble_IMK_spring_material $BeamLevel3 $BayWidth [lindex $InteriorColumnStory2 1] [lindex $InteriorColumnStory2 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel3Bay2Tag $BeamHingeMaterialLevel3Bay2properties

# Level3Bay3
set	BeamHingeMaterialLevel3Bay3Tag	70008;
set 	BeamHingeMaterialLevel3Bay3properties [Assemble_IMK_spring_material $BeamLevel3 $BayWidth [lindex $InteriorColumnStory2 1] [lindex $InteriorColumnStory2 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel3Bay3Tag $BeamHingeMaterialLevel3Bay3properties

# Level3Bay4
set	BeamHingeMaterialLevel3Bay4Tag	70009;
set 	BeamHingeMaterialLevel3Bay4properties [Assemble_IMK_spring_material $BeamLevel3 $BayWidth [lindex $InteriorColumnStory2 1] [lindex $InteriorColumnStory2 1] $Fy $Es 0.0 0 0.648];
CreateIMKMaterial $BeamHingeMaterialLevel3Bay4Tag $BeamHingeMaterialLevel3Bay4properties

# Level3Bay5
set	BeamHingeMaterialLevel3Bay5Tag	70010;
set 	BeamHingeMaterialLevel3Bay5properties [Assemble_IMK_spring_material $BeamLevel3 $BayWidth [lindex $InteriorColumnStory2 1] [lindex $ExteriorColumnStory2 1] $Fy $Es 0.0 0 0.683];
CreateIMKMaterial $BeamHingeMaterialLevel3Bay5Tag $BeamHingeMaterialLevel3Bay5properties

# Level4Bay1
set	BeamHingeMaterialLevel4Bay1Tag	70011;
set 	BeamHingeMaterialLevel4Bay1properties [Assemble_IMK_spring_material $BeamLevel4 $BayWidth [lindex $ExteriorColumnStory3 1] [lindex $InteriorColumnStory3 1] $Fy $Es 0.0 0 0.682];
CreateIMKMaterial $BeamHingeMaterialLevel4Bay1Tag $BeamHingeMaterialLevel4Bay1properties

# Level4Bay2
set	BeamHingeMaterialLevel4Bay2Tag	70012;
set 	BeamHingeMaterialLevel4Bay2properties [Assemble_IMK_spring_material $BeamLevel4 $BayWidth [lindex $InteriorColumnStory3 1] [lindex $InteriorColumnStory3 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel4Bay2Tag $BeamHingeMaterialLevel4Bay2properties

# Level4Bay3
set	BeamHingeMaterialLevel4Bay3Tag	70013;
set 	BeamHingeMaterialLevel4Bay3properties [Assemble_IMK_spring_material $BeamLevel4 $BayWidth [lindex $InteriorColumnStory3 1] [lindex $InteriorColumnStory3 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel4Bay3Tag $BeamHingeMaterialLevel4Bay3properties

# Level4Bay4
set	BeamHingeMaterialLevel4Bay4Tag	70014;
set 	BeamHingeMaterialLevel4Bay4properties [Assemble_IMK_spring_material $BeamLevel4 $BayWidth [lindex $InteriorColumnStory3 1] [lindex $InteriorColumnStory3 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel4Bay4Tag $BeamHingeMaterialLevel4Bay4properties

# Level4Bay5
set	BeamHingeMaterialLevel4Bay5Tag	70015;
set 	BeamHingeMaterialLevel4Bay5properties [Assemble_IMK_spring_material $BeamLevel4 $BayWidth [lindex $InteriorColumnStory3 1] [lindex $ExteriorColumnStory3 1] $Fy $Es 0.0 0 0.682];
CreateIMKMaterial $BeamHingeMaterialLevel4Bay5Tag $BeamHingeMaterialLevel4Bay5properties

# Level5Bay1
set	BeamHingeMaterialLevel5Bay1Tag	70016;
set 	BeamHingeMaterialLevel5Bay1properties [Assemble_IMK_spring_material $BeamLevel5 $BayWidth [lindex $ExteriorColumnStory4 1] [lindex $InteriorColumnStory4 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel5Bay1Tag $BeamHingeMaterialLevel5Bay1properties

# Level5Bay2
set	BeamHingeMaterialLevel5Bay2Tag	70017;
set 	BeamHingeMaterialLevel5Bay2properties [Assemble_IMK_spring_material $BeamLevel5 $BayWidth [lindex $InteriorColumnStory4 1] [lindex $InteriorColumnStory4 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel5Bay2Tag $BeamHingeMaterialLevel5Bay2properties

# Level5Bay3
set	BeamHingeMaterialLevel5Bay3Tag	70018;
set 	BeamHingeMaterialLevel5Bay3properties [Assemble_IMK_spring_material $BeamLevel5 $BayWidth [lindex $InteriorColumnStory4 1] [lindex $InteriorColumnStory4 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel5Bay3Tag $BeamHingeMaterialLevel5Bay3properties

# Level5Bay4
set	BeamHingeMaterialLevel5Bay4Tag	70019;
set 	BeamHingeMaterialLevel5Bay4properties [Assemble_IMK_spring_material $BeamLevel5 $BayWidth [lindex $InteriorColumnStory4 1] [lindex $InteriorColumnStory4 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel5Bay4Tag $BeamHingeMaterialLevel5Bay4properties

# Level5Bay5
set	BeamHingeMaterialLevel5Bay5Tag	70020;
set 	BeamHingeMaterialLevel5Bay5properties [Assemble_IMK_spring_material $BeamLevel5 $BayWidth [lindex $InteriorColumnStory4 1] [lindex $ExteriorColumnStory4 1] $Fy $Es 0.0 0 0.647];
CreateIMKMaterial $BeamHingeMaterialLevel5Bay5Tag $BeamHingeMaterialLevel5Bay5properties

# Level6Bay1
set	BeamHingeMaterialLevel6Bay1Tag	70021;
set 	BeamHingeMaterialLevel6Bay1properties [Assemble_IMK_spring_material $BeamLevel6 $BayWidth [lindex $ExteriorColumnStory5 1] [lindex $InteriorColumnStory5 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel6Bay1Tag $BeamHingeMaterialLevel6Bay1properties

# Level6Bay2
set	BeamHingeMaterialLevel6Bay2Tag	70022;
set 	BeamHingeMaterialLevel6Bay2properties [Assemble_IMK_spring_material $BeamLevel6 $BayWidth [lindex $InteriorColumnStory5 1] [lindex $InteriorColumnStory5 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel6Bay2Tag $BeamHingeMaterialLevel6Bay2properties

# Level6Bay3
set	BeamHingeMaterialLevel6Bay3Tag	70023;
set 	BeamHingeMaterialLevel6Bay3properties [Assemble_IMK_spring_material $BeamLevel6 $BayWidth [lindex $InteriorColumnStory5 1] [lindex $InteriorColumnStory5 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel6Bay3Tag $BeamHingeMaterialLevel6Bay3properties

# Level6Bay4
set	BeamHingeMaterialLevel6Bay4Tag	70024;
set 	BeamHingeMaterialLevel6Bay4properties [Assemble_IMK_spring_material $BeamLevel6 $BayWidth [lindex $InteriorColumnStory5 1] [lindex $InteriorColumnStory5 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel6Bay4Tag $BeamHingeMaterialLevel6Bay4properties

# Level6Bay5
set	BeamHingeMaterialLevel6Bay5Tag	70025;
set 	BeamHingeMaterialLevel6Bay5properties [Assemble_IMK_spring_material $BeamLevel6 $BayWidth [lindex $InteriorColumnStory5 1] [lindex $ExteriorColumnStory5 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel6Bay5Tag $BeamHingeMaterialLevel6Bay5properties

# Level7Bay1
set	BeamHingeMaterialLevel7Bay1Tag	70026;
set 	BeamHingeMaterialLevel7Bay1properties [Assemble_IMK_spring_material $BeamLevel7 $BayWidth [lindex $ExteriorColumnStory6 1] [lindex $InteriorColumnStory6 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel7Bay1Tag $BeamHingeMaterialLevel7Bay1properties

# Level7Bay2
set	BeamHingeMaterialLevel7Bay2Tag	70027;
set 	BeamHingeMaterialLevel7Bay2properties [Assemble_IMK_spring_material $BeamLevel7 $BayWidth [lindex $InteriorColumnStory6 1] [lindex $InteriorColumnStory6 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel7Bay2Tag $BeamHingeMaterialLevel7Bay2properties

# Level7Bay3
set	BeamHingeMaterialLevel7Bay3Tag	70028;
set 	BeamHingeMaterialLevel7Bay3properties [Assemble_IMK_spring_material $BeamLevel7 $BayWidth [lindex $InteriorColumnStory6 1] [lindex $InteriorColumnStory6 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel7Bay3Tag $BeamHingeMaterialLevel7Bay3properties

# Level7Bay4
set	BeamHingeMaterialLevel7Bay4Tag	70029;
set 	BeamHingeMaterialLevel7Bay4properties [Assemble_IMK_spring_material $BeamLevel7 $BayWidth [lindex $InteriorColumnStory6 1] [lindex $InteriorColumnStory6 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel7Bay4Tag $BeamHingeMaterialLevel7Bay4properties

# Level7Bay5
set	BeamHingeMaterialLevel7Bay5Tag	70030;
set 	BeamHingeMaterialLevel7Bay5properties [Assemble_IMK_spring_material $BeamLevel7 $BayWidth [lindex $InteriorColumnStory6 1] [lindex $ExteriorColumnStory6 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel7Bay5Tag $BeamHingeMaterialLevel7Bay5properties

# Level8Bay1
set	BeamHingeMaterialLevel8Bay1Tag	70031;
set 	BeamHingeMaterialLevel8Bay1properties [Assemble_IMK_spring_material $BeamLevel8 $BayWidth [lindex $ExteriorColumnStory7 1] [lindex $InteriorColumnStory7 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel8Bay1Tag $BeamHingeMaterialLevel8Bay1properties

# Level8Bay2
set	BeamHingeMaterialLevel8Bay2Tag	70032;
set 	BeamHingeMaterialLevel8Bay2properties [Assemble_IMK_spring_material $BeamLevel8 $BayWidth [lindex $InteriorColumnStory7 1] [lindex $InteriorColumnStory7 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel8Bay2Tag $BeamHingeMaterialLevel8Bay2properties

# Level8Bay3
set	BeamHingeMaterialLevel8Bay3Tag	70033;
set 	BeamHingeMaterialLevel8Bay3properties [Assemble_IMK_spring_material $BeamLevel8 $BayWidth [lindex $InteriorColumnStory7 1] [lindex $InteriorColumnStory7 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel8Bay3Tag $BeamHingeMaterialLevel8Bay3properties

# Level8Bay4
set	BeamHingeMaterialLevel8Bay4Tag	70034;
set 	BeamHingeMaterialLevel8Bay4properties [Assemble_IMK_spring_material $BeamLevel8 $BayWidth [lindex $InteriorColumnStory7 1] [lindex $InteriorColumnStory7 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel8Bay4Tag $BeamHingeMaterialLevel8Bay4properties

# Level8Bay5
set	BeamHingeMaterialLevel8Bay5Tag	70035;
set 	BeamHingeMaterialLevel8Bay5properties [Assemble_IMK_spring_material $BeamLevel8 $BayWidth [lindex $InteriorColumnStory7 1] [lindex $ExteriorColumnStory7 1] $Fy $Es 0.0 0 0.651];
CreateIMKMaterial $BeamHingeMaterialLevel8Bay5Tag $BeamHingeMaterialLevel8Bay5properties

# Level9Bay1
set	BeamHingeMaterialLevel9Bay1Tag	70036;
set 	BeamHingeMaterialLevel9Bay1properties [Assemble_IMK_spring_material $BeamLevel9 $BayWidth [lindex $ExteriorColumnStory8 1] [lindex $InteriorColumnStory8 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel9Bay1Tag $BeamHingeMaterialLevel9Bay1properties

# Level9Bay2
set	BeamHingeMaterialLevel9Bay2Tag	70037;
set 	BeamHingeMaterialLevel9Bay2properties [Assemble_IMK_spring_material $BeamLevel9 $BayWidth [lindex $InteriorColumnStory8 1] [lindex $InteriorColumnStory8 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel9Bay2Tag $BeamHingeMaterialLevel9Bay2properties

# Level9Bay3
set	BeamHingeMaterialLevel9Bay3Tag	70038;
set 	BeamHingeMaterialLevel9Bay3properties [Assemble_IMK_spring_material $BeamLevel9 $BayWidth [lindex $InteriorColumnStory8 1] [lindex $InteriorColumnStory8 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel9Bay3Tag $BeamHingeMaterialLevel9Bay3properties

# Level9Bay4
set	BeamHingeMaterialLevel9Bay4Tag	70039;
set 	BeamHingeMaterialLevel9Bay4properties [Assemble_IMK_spring_material $BeamLevel9 $BayWidth [lindex $InteriorColumnStory8 1] [lindex $InteriorColumnStory8 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel9Bay4Tag $BeamHingeMaterialLevel9Bay4properties

# Level9Bay5
set	BeamHingeMaterialLevel9Bay5Tag	70040;
set 	BeamHingeMaterialLevel9Bay5properties [Assemble_IMK_spring_material $BeamLevel9 $BayWidth [lindex $InteriorColumnStory8 1] [lindex $ExteriorColumnStory8 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel9Bay5Tag $BeamHingeMaterialLevel9Bay5properties

# Level10Bay1
set	BeamHingeMaterialLevel10Bay1Tag	70041;
set 	BeamHingeMaterialLevel10Bay1properties [Assemble_IMK_spring_material $BeamLevel10 $BayWidth [lindex $ExteriorColumnStory9 1] [lindex $InteriorColumnStory9 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel10Bay1Tag $BeamHingeMaterialLevel10Bay1properties

# Level10Bay2
set	BeamHingeMaterialLevel10Bay2Tag	70042;
set 	BeamHingeMaterialLevel10Bay2properties [Assemble_IMK_spring_material $BeamLevel10 $BayWidth [lindex $InteriorColumnStory9 1] [lindex $InteriorColumnStory9 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel10Bay2Tag $BeamHingeMaterialLevel10Bay2properties

# Level10Bay3
set	BeamHingeMaterialLevel10Bay3Tag	70043;
set 	BeamHingeMaterialLevel10Bay3properties [Assemble_IMK_spring_material $BeamLevel10 $BayWidth [lindex $InteriorColumnStory9 1] [lindex $InteriorColumnStory9 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel10Bay3Tag $BeamHingeMaterialLevel10Bay3properties

# Level10Bay4
set	BeamHingeMaterialLevel10Bay4Tag	70044;
set 	BeamHingeMaterialLevel10Bay4properties [Assemble_IMK_spring_material $BeamLevel10 $BayWidth [lindex $InteriorColumnStory9 1] [lindex $InteriorColumnStory9 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel10Bay4Tag $BeamHingeMaterialLevel10Bay4properties

# Level10Bay5
set	BeamHingeMaterialLevel10Bay5Tag	70045;
set 	BeamHingeMaterialLevel10Bay5properties [Assemble_IMK_spring_material $BeamLevel10 $BayWidth [lindex $InteriorColumnStory9 1] [lindex $ExteriorColumnStory9 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel10Bay5Tag $BeamHingeMaterialLevel10Bay5properties

# Level11Bay1
set	BeamHingeMaterialLevel11Bay1Tag	70046;
set 	BeamHingeMaterialLevel11Bay1properties [Assemble_IMK_spring_material $BeamLevel11 $BayWidth [lindex $ExteriorColumnStory10 1] [lindex $InteriorColumnStory10 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel11Bay1Tag $BeamHingeMaterialLevel11Bay1properties

# Level11Bay2
set	BeamHingeMaterialLevel11Bay2Tag	70047;
set 	BeamHingeMaterialLevel11Bay2properties [Assemble_IMK_spring_material $BeamLevel11 $BayWidth [lindex $InteriorColumnStory10 1] [lindex $InteriorColumnStory10 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel11Bay2Tag $BeamHingeMaterialLevel11Bay2properties

# Level11Bay3
set	BeamHingeMaterialLevel11Bay3Tag	70048;
set 	BeamHingeMaterialLevel11Bay3properties [Assemble_IMK_spring_material $BeamLevel11 $BayWidth [lindex $InteriorColumnStory10 1] [lindex $InteriorColumnStory10 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel11Bay3Tag $BeamHingeMaterialLevel11Bay3properties

# Level11Bay4
set	BeamHingeMaterialLevel11Bay4Tag	70049;
set 	BeamHingeMaterialLevel11Bay4properties [Assemble_IMK_spring_material $BeamLevel11 $BayWidth [lindex $InteriorColumnStory10 1] [lindex $InteriorColumnStory10 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel11Bay4Tag $BeamHingeMaterialLevel11Bay4properties

# Level11Bay5
set	BeamHingeMaterialLevel11Bay5Tag	70050;
set 	BeamHingeMaterialLevel11Bay5properties [Assemble_IMK_spring_material $BeamLevel11 $BayWidth [lindex $InteriorColumnStory10 1] [lindex $ExteriorColumnStory10 1] $Fy $Es 0.0 0 0.661];
CreateIMKMaterial $BeamHingeMaterialLevel11Bay5Tag $BeamHingeMaterialLevel11Bay5properties

# Level12Bay1
set	BeamHingeMaterialLevel12Bay1Tag	70051;
set 	BeamHingeMaterialLevel12Bay1properties [Assemble_IMK_spring_material $BeamLevel12 $BayWidth [lindex $ExteriorColumnStory11 1] [lindex $InteriorColumnStory11 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel12Bay1Tag $BeamHingeMaterialLevel12Bay1properties

# Level12Bay2
set	BeamHingeMaterialLevel12Bay2Tag	70052;
set 	BeamHingeMaterialLevel12Bay2properties [Assemble_IMK_spring_material $BeamLevel12 $BayWidth [lindex $InteriorColumnStory11 1] [lindex $InteriorColumnStory11 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel12Bay2Tag $BeamHingeMaterialLevel12Bay2properties

# Level12Bay3
set	BeamHingeMaterialLevel12Bay3Tag	70053;
set 	BeamHingeMaterialLevel12Bay3properties [Assemble_IMK_spring_material $BeamLevel12 $BayWidth [lindex $InteriorColumnStory11 1] [lindex $InteriorColumnStory11 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel12Bay3Tag $BeamHingeMaterialLevel12Bay3properties

# Level12Bay4
set	BeamHingeMaterialLevel12Bay4Tag	70054;
set 	BeamHingeMaterialLevel12Bay4properties [Assemble_IMK_spring_material $BeamLevel12 $BayWidth [lindex $InteriorColumnStory11 1] [lindex $InteriorColumnStory11 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel12Bay4Tag $BeamHingeMaterialLevel12Bay4properties

# Level12Bay5
set	BeamHingeMaterialLevel12Bay5Tag	70055;
set 	BeamHingeMaterialLevel12Bay5properties [Assemble_IMK_spring_material $BeamLevel12 $BayWidth [lindex $InteriorColumnStory11 1] [lindex $ExteriorColumnStory11 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel12Bay5Tag $BeamHingeMaterialLevel12Bay5properties

# Level13Bay1
set	BeamHingeMaterialLevel13Bay1Tag	70056;
set 	BeamHingeMaterialLevel13Bay1properties [Assemble_IMK_spring_material $BeamLevel13 $BayWidth [lindex $ExteriorColumnStory12 1] [lindex $InteriorColumnStory12 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel13Bay1Tag $BeamHingeMaterialLevel13Bay1properties

# Level13Bay2
set	BeamHingeMaterialLevel13Bay2Tag	70057;
set 	BeamHingeMaterialLevel13Bay2properties [Assemble_IMK_spring_material $BeamLevel13 $BayWidth [lindex $InteriorColumnStory12 1] [lindex $InteriorColumnStory12 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel13Bay2Tag $BeamHingeMaterialLevel13Bay2properties

# Level13Bay3
set	BeamHingeMaterialLevel13Bay3Tag	70058;
set 	BeamHingeMaterialLevel13Bay3properties [Assemble_IMK_spring_material $BeamLevel13 $BayWidth [lindex $InteriorColumnStory12 1] [lindex $InteriorColumnStory12 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel13Bay3Tag $BeamHingeMaterialLevel13Bay3properties

# Level13Bay4
set	BeamHingeMaterialLevel13Bay4Tag	70059;
set 	BeamHingeMaterialLevel13Bay4properties [Assemble_IMK_spring_material $BeamLevel13 $BayWidth [lindex $InteriorColumnStory12 1] [lindex $InteriorColumnStory12 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel13Bay4Tag $BeamHingeMaterialLevel13Bay4properties

# Level13Bay5
set	BeamHingeMaterialLevel13Bay5Tag	70060;
set 	BeamHingeMaterialLevel13Bay5properties [Assemble_IMK_spring_material $BeamLevel13 $BayWidth [lindex $InteriorColumnStory12 1] [lindex $ExteriorColumnStory12 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel13Bay5Tag $BeamHingeMaterialLevel13Bay5properties

# Level14Bay1
set	BeamHingeMaterialLevel14Bay1Tag	70061;
set 	BeamHingeMaterialLevel14Bay1properties [Assemble_IMK_spring_material $BeamLevel14 $BayWidth [lindex $ExteriorColumnStory13 1] [lindex $InteriorColumnStory13 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel14Bay1Tag $BeamHingeMaterialLevel14Bay1properties

# Level14Bay2
set	BeamHingeMaterialLevel14Bay2Tag	70062;
set 	BeamHingeMaterialLevel14Bay2properties [Assemble_IMK_spring_material $BeamLevel14 $BayWidth [lindex $InteriorColumnStory13 1] [lindex $InteriorColumnStory13 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel14Bay2Tag $BeamHingeMaterialLevel14Bay2properties

# Level14Bay3
set	BeamHingeMaterialLevel14Bay3Tag	70063;
set 	BeamHingeMaterialLevel14Bay3properties [Assemble_IMK_spring_material $BeamLevel14 $BayWidth [lindex $InteriorColumnStory13 1] [lindex $InteriorColumnStory13 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel14Bay3Tag $BeamHingeMaterialLevel14Bay3properties

# Level14Bay4
set	BeamHingeMaterialLevel14Bay4Tag	70064;
set 	BeamHingeMaterialLevel14Bay4properties [Assemble_IMK_spring_material $BeamLevel14 $BayWidth [lindex $InteriorColumnStory13 1] [lindex $InteriorColumnStory13 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel14Bay4Tag $BeamHingeMaterialLevel14Bay4properties

# Level14Bay5
set	BeamHingeMaterialLevel14Bay5Tag	70065;
set 	BeamHingeMaterialLevel14Bay5properties [Assemble_IMK_spring_material $BeamLevel14 $BayWidth [lindex $InteriorColumnStory13 1] [lindex $ExteriorColumnStory13 1] $Fy $Es 0.0 0 0.66];
CreateIMKMaterial $BeamHingeMaterialLevel14Bay5Tag $BeamHingeMaterialLevel14Bay5properties

# Level15Bay1
set	BeamHingeMaterialLevel15Bay1Tag	70066;
set 	BeamHingeMaterialLevel15Bay1properties [Assemble_IMK_spring_material $BeamLevel15 $BayWidth [lindex $ExteriorColumnStory14 1] [lindex $InteriorColumnStory14 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel15Bay1Tag $BeamHingeMaterialLevel15Bay1properties

# Level15Bay2
set	BeamHingeMaterialLevel15Bay2Tag	70067;
set 	BeamHingeMaterialLevel15Bay2properties [Assemble_IMK_spring_material $BeamLevel15 $BayWidth [lindex $InteriorColumnStory14 1] [lindex $InteriorColumnStory14 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel15Bay2Tag $BeamHingeMaterialLevel15Bay2properties

# Level15Bay3
set	BeamHingeMaterialLevel15Bay3Tag	70068;
set 	BeamHingeMaterialLevel15Bay3properties [Assemble_IMK_spring_material $BeamLevel15 $BayWidth [lindex $InteriorColumnStory14 1] [lindex $InteriorColumnStory14 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel15Bay3Tag $BeamHingeMaterialLevel15Bay3properties

# Level15Bay4
set	BeamHingeMaterialLevel15Bay4Tag	70069;
set 	BeamHingeMaterialLevel15Bay4properties [Assemble_IMK_spring_material $BeamLevel15 $BayWidth [lindex $InteriorColumnStory14 1] [lindex $InteriorColumnStory14 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel15Bay4Tag $BeamHingeMaterialLevel15Bay4properties

# Level15Bay5
set	BeamHingeMaterialLevel15Bay5Tag	70070;
set 	BeamHingeMaterialLevel15Bay5properties [Assemble_IMK_spring_material $BeamLevel15 $BayWidth [lindex $InteriorColumnStory14 1] [lindex $ExteriorColumnStory14 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel15Bay5Tag $BeamHingeMaterialLevel15Bay5properties

# Level16Bay1
set	BeamHingeMaterialLevel16Bay1Tag	70071;
set 	BeamHingeMaterialLevel16Bay1properties [Assemble_IMK_spring_material $BeamLevel16 $BayWidth [lindex $ExteriorColumnStory15 1] [lindex $InteriorColumnStory15 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel16Bay1Tag $BeamHingeMaterialLevel16Bay1properties

# Level16Bay2
set	BeamHingeMaterialLevel16Bay2Tag	70072;
set 	BeamHingeMaterialLevel16Bay2properties [Assemble_IMK_spring_material $BeamLevel16 $BayWidth [lindex $InteriorColumnStory15 1] [lindex $InteriorColumnStory15 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel16Bay2Tag $BeamHingeMaterialLevel16Bay2properties

# Level16Bay3
set	BeamHingeMaterialLevel16Bay3Tag	70073;
set 	BeamHingeMaterialLevel16Bay3properties [Assemble_IMK_spring_material $BeamLevel16 $BayWidth [lindex $InteriorColumnStory15 1] [lindex $InteriorColumnStory15 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel16Bay3Tag $BeamHingeMaterialLevel16Bay3properties

# Level16Bay4
set	BeamHingeMaterialLevel16Bay4Tag	70074;
set 	BeamHingeMaterialLevel16Bay4properties [Assemble_IMK_spring_material $BeamLevel16 $BayWidth [lindex $InteriorColumnStory15 1] [lindex $InteriorColumnStory15 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel16Bay4Tag $BeamHingeMaterialLevel16Bay4properties

# Level16Bay5
set	BeamHingeMaterialLevel16Bay5Tag	70075;
set 	BeamHingeMaterialLevel16Bay5properties [Assemble_IMK_spring_material $BeamLevel16 $BayWidth [lindex $InteriorColumnStory15 1] [lindex $ExteriorColumnStory15 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel16Bay5Tag $BeamHingeMaterialLevel16Bay5properties

# Level17Bay1
set	BeamHingeMaterialLevel17Bay1Tag	70076;
set 	BeamHingeMaterialLevel17Bay1properties [Assemble_IMK_spring_material $BeamLevel17 $BayWidth [lindex $ExteriorColumnStory16 1] [lindex $InteriorColumnStory16 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel17Bay1Tag $BeamHingeMaterialLevel17Bay1properties

# Level17Bay2
set	BeamHingeMaterialLevel17Bay2Tag	70077;
set 	BeamHingeMaterialLevel17Bay2properties [Assemble_IMK_spring_material $BeamLevel17 $BayWidth [lindex $InteriorColumnStory16 1] [lindex $InteriorColumnStory16 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel17Bay2Tag $BeamHingeMaterialLevel17Bay2properties

# Level17Bay3
set	BeamHingeMaterialLevel17Bay3Tag	70078;
set 	BeamHingeMaterialLevel17Bay3properties [Assemble_IMK_spring_material $BeamLevel17 $BayWidth [lindex $InteriorColumnStory16 1] [lindex $InteriorColumnStory16 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel17Bay3Tag $BeamHingeMaterialLevel17Bay3properties

# Level17Bay4
set	BeamHingeMaterialLevel17Bay4Tag	70079;
set 	BeamHingeMaterialLevel17Bay4properties [Assemble_IMK_spring_material $BeamLevel17 $BayWidth [lindex $InteriorColumnStory16 1] [lindex $InteriorColumnStory16 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel17Bay4Tag $BeamHingeMaterialLevel17Bay4properties

# Level17Bay5
set	BeamHingeMaterialLevel17Bay5Tag	70080;
set 	BeamHingeMaterialLevel17Bay5properties [Assemble_IMK_spring_material $BeamLevel17 $BayWidth [lindex $InteriorColumnStory16 1] [lindex $ExteriorColumnStory16 1] $Fy $Es 0.0 0 0.64];
CreateIMKMaterial $BeamHingeMaterialLevel17Bay5Tag $BeamHingeMaterialLevel17Bay5properties

# Level18Bay1
set	BeamHingeMaterialLevel18Bay1Tag	70081;
set 	BeamHingeMaterialLevel18Bay1properties [Assemble_IMK_spring_material $BeamLevel18 $BayWidth [lindex $ExteriorColumnStory17 1] [lindex $InteriorColumnStory17 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel18Bay1Tag $BeamHingeMaterialLevel18Bay1properties

# Level18Bay2
set	BeamHingeMaterialLevel18Bay2Tag	70082;
set 	BeamHingeMaterialLevel18Bay2properties [Assemble_IMK_spring_material $BeamLevel18 $BayWidth [lindex $InteriorColumnStory17 1] [lindex $InteriorColumnStory17 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel18Bay2Tag $BeamHingeMaterialLevel18Bay2properties

# Level18Bay3
set	BeamHingeMaterialLevel18Bay3Tag	70083;
set 	BeamHingeMaterialLevel18Bay3properties [Assemble_IMK_spring_material $BeamLevel18 $BayWidth [lindex $InteriorColumnStory17 1] [lindex $InteriorColumnStory17 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel18Bay3Tag $BeamHingeMaterialLevel18Bay3properties

# Level18Bay4
set	BeamHingeMaterialLevel18Bay4Tag	70084;
set 	BeamHingeMaterialLevel18Bay4properties [Assemble_IMK_spring_material $BeamLevel18 $BayWidth [lindex $InteriorColumnStory17 1] [lindex $InteriorColumnStory17 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel18Bay4Tag $BeamHingeMaterialLevel18Bay4properties

# Level18Bay5
set	BeamHingeMaterialLevel18Bay5Tag	70085;
set 	BeamHingeMaterialLevel18Bay5properties [Assemble_IMK_spring_material $BeamLevel18 $BayWidth [lindex $InteriorColumnStory17 1] [lindex $ExteriorColumnStory17 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel18Bay5Tag $BeamHingeMaterialLevel18Bay5properties

# Level19Bay1
set	BeamHingeMaterialLevel19Bay1Tag	70086;
set 	BeamHingeMaterialLevel19Bay1properties [Assemble_IMK_spring_material $BeamLevel19 $BayWidth [lindex $ExteriorColumnStory18 1] [lindex $InteriorColumnStory18 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel19Bay1Tag $BeamHingeMaterialLevel19Bay1properties

# Level19Bay2
set	BeamHingeMaterialLevel19Bay2Tag	70087;
set 	BeamHingeMaterialLevel19Bay2properties [Assemble_IMK_spring_material $BeamLevel19 $BayWidth [lindex $InteriorColumnStory18 1] [lindex $InteriorColumnStory18 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel19Bay2Tag $BeamHingeMaterialLevel19Bay2properties

# Level19Bay3
set	BeamHingeMaterialLevel19Bay3Tag	70088;
set 	BeamHingeMaterialLevel19Bay3properties [Assemble_IMK_spring_material $BeamLevel19 $BayWidth [lindex $InteriorColumnStory18 1] [lindex $InteriorColumnStory18 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel19Bay3Tag $BeamHingeMaterialLevel19Bay3properties

# Level19Bay4
set	BeamHingeMaterialLevel19Bay4Tag	70089;
set 	BeamHingeMaterialLevel19Bay4properties [Assemble_IMK_spring_material $BeamLevel19 $BayWidth [lindex $InteriorColumnStory18 1] [lindex $InteriorColumnStory18 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel19Bay4Tag $BeamHingeMaterialLevel19Bay4properties

# Level19Bay5
set	BeamHingeMaterialLevel19Bay5Tag	70090;
set 	BeamHingeMaterialLevel19Bay5properties [Assemble_IMK_spring_material $BeamLevel19 $BayWidth [lindex $InteriorColumnStory18 1] [lindex $ExteriorColumnStory18 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel19Bay5Tag $BeamHingeMaterialLevel19Bay5properties

# Level20Bay1
set	BeamHingeMaterialLevel20Bay1Tag	70091;
set 	BeamHingeMaterialLevel20Bay1properties [Assemble_IMK_spring_material $BeamLevel20 $BayWidth [lindex $ExteriorColumnStory19 1] [lindex $InteriorColumnStory19 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel20Bay1Tag $BeamHingeMaterialLevel20Bay1properties

# Level20Bay2
set	BeamHingeMaterialLevel20Bay2Tag	70092;
set 	BeamHingeMaterialLevel20Bay2properties [Assemble_IMK_spring_material $BeamLevel20 $BayWidth [lindex $InteriorColumnStory19 1] [lindex $InteriorColumnStory19 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel20Bay2Tag $BeamHingeMaterialLevel20Bay2properties

# Level20Bay3
set	BeamHingeMaterialLevel20Bay3Tag	70093;
set 	BeamHingeMaterialLevel20Bay3properties [Assemble_IMK_spring_material $BeamLevel20 $BayWidth [lindex $InteriorColumnStory19 1] [lindex $InteriorColumnStory19 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel20Bay3Tag $BeamHingeMaterialLevel20Bay3properties

# Level20Bay4
set	BeamHingeMaterialLevel20Bay4Tag	70094;
set 	BeamHingeMaterialLevel20Bay4properties [Assemble_IMK_spring_material $BeamLevel20 $BayWidth [lindex $InteriorColumnStory19 1] [lindex $InteriorColumnStory19 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel20Bay4Tag $BeamHingeMaterialLevel20Bay4properties

# Level20Bay5
set	BeamHingeMaterialLevel20Bay5Tag	70095;
set 	BeamHingeMaterialLevel20Bay5properties [Assemble_IMK_spring_material $BeamLevel20 $BayWidth [lindex $InteriorColumnStory19 1] [lindex $ExteriorColumnStory19 1] $Fy $Es 0.0 0 0.662];
CreateIMKMaterial $BeamHingeMaterialLevel20Bay5Tag $BeamHingeMaterialLevel20Bay5properties

puts "Beam hinge materials defined"

