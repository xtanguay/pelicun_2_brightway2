# This file will be used to define all nodal masses 

# Define floor weights and each nodal mass 
#set	Floor2Weight	1125.00; 
#set	Floor3Weight	1125.00; 
#set	Floor4Weight	1125.00; 
#set	Floor5Weight	1125.00; 
#set	Floor6Weight	1125.00; 
#set	Floor7Weight	1125.00; 
#set	Floor8Weight	1125.00; 
#set	Floor9Weight	1125.00; 
#set	Floor10Weight	1125.00; 
#set	Floor11Weight	1125.00; 
#set	Floor12Weight	1125.00; 
#set	Floor13Weight	1125.00; 
#set	Floor14Weight	1125.00; 
#set	Floor15Weight	1125.00; 
#set	Floor16Weight	1125.00; 
#set	Floor17Weight	1125.00; 
#set	Floor18Weight	1125.00; 
#set	Floor19Weight	1125.00; 
#set	Floor20Weight	1518.75; 

# Combine 1.0D + 0.25 L mass in building (as potential random variables) : 
set	Floor2Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor3Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor4Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor5Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor6Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor7Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor8Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor9Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor10Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor11Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor12Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor13Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor14Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor15Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor16Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor17Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor18Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor19Weight	[expr 1*$Dintrmass+0.25*$Lintrmass]; 
set	Floor20Weight	[expr 1*$Drfmass+0.25*$Lrfmass];


set	FrameTributaryMassRatio	0.5; # Assumes mass splits 50/50 between the two lateral load resisting frames.
set	TotalNodesPerFloor	7; # Considering the leaning column

set	NodalMassFloor2	[expr $Floor2Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor3	[expr $Floor3Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor4	[expr $Floor4Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor5	[expr $Floor5Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor6	[expr $Floor6Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor7	[expr $Floor7Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor8	[expr $Floor8Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor9	[expr $Floor9Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor10	[expr $Floor10Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor11	[expr $Floor11Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor12	[expr $Floor12Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor13	[expr $Floor13Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor14	[expr $Floor14Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor15	[expr $Floor15Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor16	[expr $Floor16Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor17	[expr $Floor17Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor18	[expr $Floor18Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor19	[expr $Floor19Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 
set	NodalMassFloor20	[expr $Floor20Weight*$FrameTributaryMassRatio/$TotalNodesPerFloor/$g]; 

# Level 2 
mass	121	$NodalMassFloor2	$Negligible	$Negligible
mass	221	$NodalMassFloor2	$Negligible	$Negligible
mass	321	$NodalMassFloor2	$Negligible	$Negligible
mass	421	$NodalMassFloor2	$Negligible	$Negligible
mass	521	$NodalMassFloor2	$Negligible	$Negligible
mass	621	$NodalMassFloor2	$Negligible	$Negligible
mass	72	$NodalMassFloor2	$Negligible	$Negligible

# Level 3 
mass	131	$NodalMassFloor3	$Negligible	$Negligible
mass	231	$NodalMassFloor3	$Negligible	$Negligible
mass	331	$NodalMassFloor3	$Negligible	$Negligible
mass	431	$NodalMassFloor3	$Negligible	$Negligible
mass	531	$NodalMassFloor3	$Negligible	$Negligible
mass	631	$NodalMassFloor3	$Negligible	$Negligible
mass	73	$NodalMassFloor3	$Negligible	$Negligible

# Level 4 
mass	141	$NodalMassFloor4	$Negligible	$Negligible
mass	241	$NodalMassFloor4	$Negligible	$Negligible
mass	341	$NodalMassFloor4	$Negligible	$Negligible
mass	441	$NodalMassFloor4	$Negligible	$Negligible
mass	541	$NodalMassFloor4	$Negligible	$Negligible
mass	641	$NodalMassFloor4	$Negligible	$Negligible
mass	74	$NodalMassFloor4	$Negligible	$Negligible

# Level 5 
mass	151	$NodalMassFloor5	$Negligible	$Negligible
mass	251	$NodalMassFloor5	$Negligible	$Negligible
mass	351	$NodalMassFloor5	$Negligible	$Negligible
mass	451	$NodalMassFloor5	$Negligible	$Negligible
mass	551	$NodalMassFloor5	$Negligible	$Negligible
mass	651	$NodalMassFloor5	$Negligible	$Negligible
mass	75	$NodalMassFloor5	$Negligible	$Negligible

# Level 6 
mass	161	$NodalMassFloor6	$Negligible	$Negligible
mass	261	$NodalMassFloor6	$Negligible	$Negligible
mass	361	$NodalMassFloor6	$Negligible	$Negligible
mass	461	$NodalMassFloor6	$Negligible	$Negligible
mass	561	$NodalMassFloor6	$Negligible	$Negligible
mass	661	$NodalMassFloor6	$Negligible	$Negligible
mass	76	$NodalMassFloor6	$Negligible	$Negligible

# Level 7 
mass	171	$NodalMassFloor7	$Negligible	$Negligible
mass	271	$NodalMassFloor7	$Negligible	$Negligible
mass	371	$NodalMassFloor7	$Negligible	$Negligible
mass	471	$NodalMassFloor7	$Negligible	$Negligible
mass	571	$NodalMassFloor7	$Negligible	$Negligible
mass	671	$NodalMassFloor7	$Negligible	$Negligible
mass	77	$NodalMassFloor7	$Negligible	$Negligible

# Level 8 
mass	181	$NodalMassFloor8	$Negligible	$Negligible
mass	281	$NodalMassFloor8	$Negligible	$Negligible
mass	381	$NodalMassFloor8	$Negligible	$Negligible
mass	481	$NodalMassFloor8	$Negligible	$Negligible
mass	581	$NodalMassFloor8	$Negligible	$Negligible
mass	681	$NodalMassFloor8	$Negligible	$Negligible
mass	78	$NodalMassFloor8	$Negligible	$Negligible

# Level 9 
mass	191	$NodalMassFloor9	$Negligible	$Negligible
mass	291	$NodalMassFloor9	$Negligible	$Negligible
mass	391	$NodalMassFloor9	$Negligible	$Negligible
mass	491	$NodalMassFloor9	$Negligible	$Negligible
mass	591	$NodalMassFloor9	$Negligible	$Negligible
mass	691	$NodalMassFloor9	$Negligible	$Negligible
mass	79	$NodalMassFloor9	$Negligible	$Negligible

# Level 10 
mass	1101	$NodalMassFloor10	$Negligible	$Negligible
mass	2101	$NodalMassFloor10	$Negligible	$Negligible
mass	3101	$NodalMassFloor10	$Negligible	$Negligible
mass	4101	$NodalMassFloor10	$Negligible	$Negligible
mass	5101	$NodalMassFloor10	$Negligible	$Negligible
mass	6101	$NodalMassFloor10	$Negligible	$Negligible
mass	710	$NodalMassFloor10	$Negligible	$Negligible

# Level 11 
mass	1111	$NodalMassFloor11	$Negligible	$Negligible
mass	2111	$NodalMassFloor11	$Negligible	$Negligible
mass	3111	$NodalMassFloor11	$Negligible	$Negligible
mass	4111	$NodalMassFloor11	$Negligible	$Negligible
mass	5111	$NodalMassFloor11	$Negligible	$Negligible
mass	6111	$NodalMassFloor11	$Negligible	$Negligible
mass	711	$NodalMassFloor11	$Negligible	$Negligible

# Level 12 
mass	1121	$NodalMassFloor12	$Negligible	$Negligible
mass	2121	$NodalMassFloor12	$Negligible	$Negligible
mass	3121	$NodalMassFloor12	$Negligible	$Negligible
mass	4121	$NodalMassFloor12	$Negligible	$Negligible
mass	5121	$NodalMassFloor12	$Negligible	$Negligible
mass	6121	$NodalMassFloor12	$Negligible	$Negligible
mass	712	$NodalMassFloor12	$Negligible	$Negligible

# Level 13 
mass	1131	$NodalMassFloor13	$Negligible	$Negligible
mass	2131	$NodalMassFloor13	$Negligible	$Negligible
mass	3131	$NodalMassFloor13	$Negligible	$Negligible
mass	4131	$NodalMassFloor13	$Negligible	$Negligible
mass	5131	$NodalMassFloor13	$Negligible	$Negligible
mass	6131	$NodalMassFloor13	$Negligible	$Negligible
mass	713	$NodalMassFloor13	$Negligible	$Negligible

# Level 14 
mass	1141	$NodalMassFloor14	$Negligible	$Negligible
mass	2141	$NodalMassFloor14	$Negligible	$Negligible
mass	3141	$NodalMassFloor14	$Negligible	$Negligible
mass	4141	$NodalMassFloor14	$Negligible	$Negligible
mass	5141	$NodalMassFloor14	$Negligible	$Negligible
mass	6141	$NodalMassFloor14	$Negligible	$Negligible
mass	714	$NodalMassFloor14	$Negligible	$Negligible

# Level 15 
mass	1151	$NodalMassFloor15	$Negligible	$Negligible
mass	2151	$NodalMassFloor15	$Negligible	$Negligible
mass	3151	$NodalMassFloor15	$Negligible	$Negligible
mass	4151	$NodalMassFloor15	$Negligible	$Negligible
mass	5151	$NodalMassFloor15	$Negligible	$Negligible
mass	6151	$NodalMassFloor15	$Negligible	$Negligible
mass	715	$NodalMassFloor15	$Negligible	$Negligible

# Level 16 
mass	1161	$NodalMassFloor16	$Negligible	$Negligible
mass	2161	$NodalMassFloor16	$Negligible	$Negligible
mass	3161	$NodalMassFloor16	$Negligible	$Negligible
mass	4161	$NodalMassFloor16	$Negligible	$Negligible
mass	5161	$NodalMassFloor16	$Negligible	$Negligible
mass	6161	$NodalMassFloor16	$Negligible	$Negligible
mass	716	$NodalMassFloor16	$Negligible	$Negligible

# Level 17 
mass	1171	$NodalMassFloor17	$Negligible	$Negligible
mass	2171	$NodalMassFloor17	$Negligible	$Negligible
mass	3171	$NodalMassFloor17	$Negligible	$Negligible
mass	4171	$NodalMassFloor17	$Negligible	$Negligible
mass	5171	$NodalMassFloor17	$Negligible	$Negligible
mass	6171	$NodalMassFloor17	$Negligible	$Negligible
mass	717	$NodalMassFloor17	$Negligible	$Negligible

# Level 18 
mass	1181	$NodalMassFloor18	$Negligible	$Negligible
mass	2181	$NodalMassFloor18	$Negligible	$Negligible
mass	3181	$NodalMassFloor18	$Negligible	$Negligible
mass	4181	$NodalMassFloor18	$Negligible	$Negligible
mass	5181	$NodalMassFloor18	$Negligible	$Negligible
mass	6181	$NodalMassFloor18	$Negligible	$Negligible
mass	718	$NodalMassFloor18	$Negligible	$Negligible

# Level 19 
mass	1191	$NodalMassFloor19	$Negligible	$Negligible
mass	2191	$NodalMassFloor19	$Negligible	$Negligible
mass	3191	$NodalMassFloor19	$Negligible	$Negligible
mass	4191	$NodalMassFloor19	$Negligible	$Negligible
mass	5191	$NodalMassFloor19	$Negligible	$Negligible
mass	6191	$NodalMassFloor19	$Negligible	$Negligible
mass	719	$NodalMassFloor19	$Negligible	$Negligible

# Level 20 
mass	1201	$NodalMassFloor20	$Negligible	$Negligible
mass	2201	$NodalMassFloor20	$Negligible	$Negligible
mass	3201	$NodalMassFloor20	$Negligible	$Negligible
mass	4201	$NodalMassFloor20	$Negligible	$Negligible
mass	5201	$NodalMassFloor20	$Negligible	$Negligible
mass	6201	$NodalMassFloor20	$Negligible	$Negligible
mass	720	$NodalMassFloor20	$Negligible	$Negligible

# puts "Nodal mass defined"