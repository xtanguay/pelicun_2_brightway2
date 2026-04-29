# This file will be used to define all nodal masses 


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


# Level2 
mass	1211	$NodalMassFloor2	$Negligible	$Negligible 
mass	2211	$NodalMassFloor2	$Negligible	$Negligible 
mass	3211	$NodalMassFloor2	$Negligible	$Negligible 
mass	4211	$NodalMassFloor2	$Negligible	$Negligible 
mass	5211	$NodalMassFloor2	$Negligible	$Negligible 
mass	6211	$NodalMassFloor2	$Negligible	$Negligible 
mass	72	$NodalMassFloor2	$Negligible	$Negligible 

# Level3 
mass	1311	$NodalMassFloor3	$Negligible	$Negligible 
mass	2311	$NodalMassFloor3	$Negligible	$Negligible 
mass	3311	$NodalMassFloor3	$Negligible	$Negligible 
mass	4311	$NodalMassFloor3	$Negligible	$Negligible 
mass	5311	$NodalMassFloor3	$Negligible	$Negligible 
mass	6311	$NodalMassFloor3	$Negligible	$Negligible 
mass	73	$NodalMassFloor3	$Negligible	$Negligible 

# Level4 
mass	1411	$NodalMassFloor4	$Negligible	$Negligible 
mass	2411	$NodalMassFloor4	$Negligible	$Negligible 
mass	3411	$NodalMassFloor4	$Negligible	$Negligible 
mass	4411	$NodalMassFloor4	$Negligible	$Negligible 
mass	5411	$NodalMassFloor4	$Negligible	$Negligible 
mass	6411	$NodalMassFloor4	$Negligible	$Negligible 
mass	74	$NodalMassFloor4	$Negligible	$Negligible 

# Level5 
mass	1511	$NodalMassFloor5	$Negligible	$Negligible 
mass	2511	$NodalMassFloor5	$Negligible	$Negligible 
mass	3511	$NodalMassFloor5	$Negligible	$Negligible 
mass	4511	$NodalMassFloor5	$Negligible	$Negligible 
mass	5511	$NodalMassFloor5	$Negligible	$Negligible 
mass	6511	$NodalMassFloor5	$Negligible	$Negligible 
mass	75	$NodalMassFloor5	$Negligible	$Negligible 

# Level6 
mass	1611	$NodalMassFloor6	$Negligible	$Negligible 
mass	2611	$NodalMassFloor6	$Negligible	$Negligible 
mass	3611	$NodalMassFloor6	$Negligible	$Negligible 
mass	4611	$NodalMassFloor6	$Negligible	$Negligible 
mass	5611	$NodalMassFloor6	$Negligible	$Negligible 
mass	6611	$NodalMassFloor6	$Negligible	$Negligible 
mass	76	$NodalMassFloor6	$Negligible	$Negligible 

# Level7 
mass	1711	$NodalMassFloor7	$Negligible	$Negligible 
mass	2711	$NodalMassFloor7	$Negligible	$Negligible 
mass	3711	$NodalMassFloor7	$Negligible	$Negligible 
mass	4711	$NodalMassFloor7	$Negligible	$Negligible 
mass	5711	$NodalMassFloor7	$Negligible	$Negligible 
mass	6711	$NodalMassFloor7	$Negligible	$Negligible 
mass	77	$NodalMassFloor7	$Negligible	$Negligible 

# Level8 
mass	1811	$NodalMassFloor8	$Negligible	$Negligible 
mass	2811	$NodalMassFloor8	$Negligible	$Negligible 
mass	3811	$NodalMassFloor8	$Negligible	$Negligible 
mass	4811	$NodalMassFloor8	$Negligible	$Negligible 
mass	5811	$NodalMassFloor8	$Negligible	$Negligible 
mass	6811	$NodalMassFloor8	$Negligible	$Negligible 
mass	78	$NodalMassFloor8	$Negligible	$Negligible 

# Level9 
mass	1911	$NodalMassFloor9	$Negligible	$Negligible 
mass	2911	$NodalMassFloor9	$Negligible	$Negligible 
mass	3911	$NodalMassFloor9	$Negligible	$Negligible 
mass	4911	$NodalMassFloor9	$Negligible	$Negligible 
mass	5911	$NodalMassFloor9	$Negligible	$Negligible 
mass	6911	$NodalMassFloor9	$Negligible	$Negligible 
mass	79	$NodalMassFloor9	$Negligible	$Negligible 

# Level10 
mass	11011	$NodalMassFloor10	$Negligible	$Negligible 
mass	21011	$NodalMassFloor10	$Negligible	$Negligible 
mass	31011	$NodalMassFloor10	$Negligible	$Negligible 
mass	41011	$NodalMassFloor10	$Negligible	$Negligible 
mass	51011	$NodalMassFloor10	$Negligible	$Negligible 
mass	61011	$NodalMassFloor10	$Negligible	$Negligible 
mass	710	$NodalMassFloor10	$Negligible	$Negligible 

# Level11 
mass	11111	$NodalMassFloor11	$Negligible	$Negligible 
mass	21111	$NodalMassFloor11	$Negligible	$Negligible 
mass	31111	$NodalMassFloor11	$Negligible	$Negligible 
mass	41111	$NodalMassFloor11	$Negligible	$Negligible 
mass	51111	$NodalMassFloor11	$Negligible	$Negligible 
mass	61111	$NodalMassFloor11	$Negligible	$Negligible 
mass	711	$NodalMassFloor11	$Negligible	$Negligible 

# Level12 
mass	11211	$NodalMassFloor12	$Negligible	$Negligible 
mass	21211	$NodalMassFloor12	$Negligible	$Negligible 
mass	31211	$NodalMassFloor12	$Negligible	$Negligible 
mass	41211	$NodalMassFloor12	$Negligible	$Negligible 
mass	51211	$NodalMassFloor12	$Negligible	$Negligible 
mass	61211	$NodalMassFloor12	$Negligible	$Negligible 
mass	712	$NodalMassFloor12	$Negligible	$Negligible 

# Level13 
mass	11311	$NodalMassFloor13	$Negligible	$Negligible 
mass	21311	$NodalMassFloor13	$Negligible	$Negligible 
mass	31311	$NodalMassFloor13	$Negligible	$Negligible 
mass	41311	$NodalMassFloor13	$Negligible	$Negligible 
mass	51311	$NodalMassFloor13	$Negligible	$Negligible 
mass	61311	$NodalMassFloor13	$Negligible	$Negligible 
mass	713	$NodalMassFloor13	$Negligible	$Negligible 

# Level14 
mass	11411	$NodalMassFloor14	$Negligible	$Negligible 
mass	21411	$NodalMassFloor14	$Negligible	$Negligible 
mass	31411	$NodalMassFloor14	$Negligible	$Negligible 
mass	41411	$NodalMassFloor14	$Negligible	$Negligible 
mass	51411	$NodalMassFloor14	$Negligible	$Negligible 
mass	61411	$NodalMassFloor14	$Negligible	$Negligible 
mass	714	$NodalMassFloor14	$Negligible	$Negligible 

# Level15 
mass	11511	$NodalMassFloor15	$Negligible	$Negligible 
mass	21511	$NodalMassFloor15	$Negligible	$Negligible 
mass	31511	$NodalMassFloor15	$Negligible	$Negligible 
mass	41511	$NodalMassFloor15	$Negligible	$Negligible 
mass	51511	$NodalMassFloor15	$Negligible	$Negligible 
mass	61511	$NodalMassFloor15	$Negligible	$Negligible 
mass	715	$NodalMassFloor15	$Negligible	$Negligible 

# Level16 
mass	11611	$NodalMassFloor16	$Negligible	$Negligible 
mass	21611	$NodalMassFloor16	$Negligible	$Negligible 
mass	31611	$NodalMassFloor16	$Negligible	$Negligible 
mass	41611	$NodalMassFloor16	$Negligible	$Negligible 
mass	51611	$NodalMassFloor16	$Negligible	$Negligible 
mass	61611	$NodalMassFloor16	$Negligible	$Negligible 
mass	716	$NodalMassFloor16	$Negligible	$Negligible 

# Level17 
mass	11711	$NodalMassFloor17	$Negligible	$Negligible 
mass	21711	$NodalMassFloor17	$Negligible	$Negligible 
mass	31711	$NodalMassFloor17	$Negligible	$Negligible 
mass	41711	$NodalMassFloor17	$Negligible	$Negligible 
mass	51711	$NodalMassFloor17	$Negligible	$Negligible 
mass	61711	$NodalMassFloor17	$Negligible	$Negligible 
mass	717	$NodalMassFloor17	$Negligible	$Negligible 

# Level18 
mass	11811	$NodalMassFloor18	$Negligible	$Negligible 
mass	21811	$NodalMassFloor18	$Negligible	$Negligible 
mass	31811	$NodalMassFloor18	$Negligible	$Negligible 
mass	41811	$NodalMassFloor18	$Negligible	$Negligible 
mass	51811	$NodalMassFloor18	$Negligible	$Negligible 
mass	61811	$NodalMassFloor18	$Negligible	$Negligible 
mass	718	$NodalMassFloor18	$Negligible	$Negligible 

# Level19 
mass	11911	$NodalMassFloor19	$Negligible	$Negligible 
mass	21911	$NodalMassFloor19	$Negligible	$Negligible 
mass	31911	$NodalMassFloor19	$Negligible	$Negligible 
mass	41911	$NodalMassFloor19	$Negligible	$Negligible 
mass	51911	$NodalMassFloor19	$Negligible	$Negligible 
mass	61911	$NodalMassFloor19	$Negligible	$Negligible 
mass	719	$NodalMassFloor19	$Negligible	$Negligible 

# Level20 
mass	12011	$NodalMassFloor20	$Negligible	$Negligible 
mass	22011	$NodalMassFloor20	$Negligible	$Negligible 
mass	32011	$NodalMassFloor20	$Negligible	$Negligible 
mass	42011	$NodalMassFloor20	$Negligible	$Negligible 
mass	52011	$NodalMassFloor20	$Negligible	$Negligible 
mass	62011	$NodalMassFloor20	$Negligible	$Negligible 
mass	720	$NodalMassFloor20	$Negligible	$Negligible 

puts "Nodal mass defined"

#####################################################################
#                OLD CODE
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
#####################################################################
