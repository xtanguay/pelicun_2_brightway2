# Define gravity dead and live loads

# Assign uniform beam dead load values (kip/inch)
#set	BeamDeadLoadFloor2	0.062500; 
#set	BeamDeadLoadFloor3	0.062500; 
#set	BeamDeadLoadFloor4	0.062500; 
#set	BeamDeadLoadFloor5	0.062500; 
#set	BeamDeadLoadFloor6	0.062500; 
#set	BeamDeadLoadFloor7	0.062500; 
#set	BeamDeadLoadFloor8	0.062500; 
#set	BeamDeadLoadFloor9	0.062500; 
#set	BeamDeadLoadFloor10	0.062500; 
#set	BeamDeadLoadFloor11	0.062500; 
#set	BeamDeadLoadFloor12	0.062500; 
#set	BeamDeadLoadFloor13	0.062500; 
#set	BeamDeadLoadFloor14	0.062500; 
#set	BeamDeadLoadFloor15	0.062500; 
#set	BeamDeadLoadFloor16	0.062500; 
#set	BeamDeadLoadFloor17	0.062500; 
#set	BeamDeadLoadFloor18	0.062500; 
#set	BeamDeadLoadFloor19	0.062500; 
#set	BeamDeadLoadFloor20	0.084375; 

# Assign uniform beam dead load values as random variables (kip/inch)
set	BeamDeadLoadFloor2	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor3	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor4	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor5	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor6	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor7	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor8	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor9	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor10	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor11	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor12	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor13	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor14	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor15	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor16	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor17	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor18	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor19	[expr $Dintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamDeadLoadFloor20	[expr $Drfmass/(30*5*12)**2*(30/2*12)];

# Assign uniform beam live load values (kip/inch)
#set	BeamLiveLoadFloor2	0.062500; 
#set	BeamLiveLoadFloor3	0.062500; 
#set	BeamLiveLoadFloor4	0.062500; 
#set	BeamLiveLoadFloor5	0.062500; 
#set	BeamLiveLoadFloor6	0.062500; 
#set	BeamLiveLoadFloor7	0.062500; 
#set	BeamLiveLoadFloor8	0.062500; 
#set	BeamLiveLoadFloor9	0.062500; 
#set	BeamLiveLoadFloor10	0.062500; 
#set	BeamLiveLoadFloor11	0.062500; 
#set	BeamLiveLoadFloor12	0.062500; 
#set	BeamLiveLoadFloor13	0.062500; 
#set	BeamLiveLoadFloor14	0.062500; 
#set	BeamLiveLoadFloor15	0.062500; 
#set	BeamLiveLoadFloor16	0.062500; 
#set	BeamLiveLoadFloor17	0.062500; 
#set	BeamLiveLoadFloor18	0.062500; 
#set	BeamLiveLoadFloor19	0.062500; 
#set	BeamLiveLoadFloor20	0.025000; 

# Assign uniform beam live load values (kip/inch)
set	BeamLiveLoadFloor2	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor3	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor4	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor5	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor6	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor7	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor8	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor9	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor10	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor11	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor12	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor13	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor14	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor15	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor16	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor17	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor18	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor19	[expr $Lintrmass/(30*5*12)**2*(30/2*12)]; 
set	BeamLiveLoadFloor20	[expr $Lrfmass/(30*5*12)**2*(30/2*12)];


# Assign point dead load values on leaning column: kip
#set	LeaningColumnDeadLoadFloor2	562.500000; 
#set	LeaningColumnDeadLoadFloor3	562.500000; 
#set	LeaningColumnDeadLoadFloor4	562.500000; 
#set	LeaningColumnDeadLoadFloor5	562.500000; 
#set	LeaningColumnDeadLoadFloor6	562.500000; 
#set	LeaningColumnDeadLoadFloor7	562.500000; 
#set	LeaningColumnDeadLoadFloor8	562.500000; 
#set	LeaningColumnDeadLoadFloor9	562.500000; 
#set	LeaningColumnDeadLoadFloor10	562.500000; 
#set	LeaningColumnDeadLoadFloor11	562.500000; 
#set	LeaningColumnDeadLoadFloor12	562.500000; 
#set	LeaningColumnDeadLoadFloor13	562.500000; 
#set	LeaningColumnDeadLoadFloor14	562.500000; 
#set	LeaningColumnDeadLoadFloor15	562.500000; 
#set	LeaningColumnDeadLoadFloor16	562.500000; 
#set	LeaningColumnDeadLoadFloor17	562.500000; 
#set	LeaningColumnDeadLoadFloor18	562.500000; 
#set	LeaningColumnDeadLoadFloor19	562.500000; 
#set	LeaningColumnDeadLoadFloor20	759.375000; 

# Assign point dead load values on leaning colum : kip
set	LeaningColumnDeadLoadFloor2	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor3	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor4	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor5	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor6	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor7	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor8	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor9	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor10	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor11	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor12	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor13	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor14	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor15	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor16	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor17	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor18	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor19	[expr $Dintrmass/2]; 
set	LeaningColumnDeadLoadFloor20	[expr $Drfmass/2]; 


# Assign point live load values on leaning column (kip)
#set	LeaningColumnLiveLoadFloor2	562.500000; 
#set	LeaningColumnLiveLoadFloor3	562.500000; 
#set	LeaningColumnLiveLoadFloor4	562.500000; 
#set	LeaningColumnLiveLoadFloor5	562.500000; 
#set	LeaningColumnLiveLoadFloor6	562.500000; 
#set	LeaningColumnLiveLoadFloor7	562.500000; 
#set	LeaningColumnLiveLoadFloor8	562.500000; 
#set	LeaningColumnLiveLoadFloor9	562.500000; 
#set	LeaningColumnLiveLoadFloor10	562.500000; 
#set	LeaningColumnLiveLoadFloor11	562.500000; 
#set	LeaningColumnLiveLoadFloor12	562.500000; 
#set	LeaningColumnLiveLoadFloor13	562.500000; 
#set	LeaningColumnLiveLoadFloor14	562.500000; 
#set	LeaningColumnLiveLoadFloor15	562.500000; 
#set	LeaningColumnLiveLoadFloor16	562.500000; 
#set	LeaningColumnLiveLoadFloor17	562.500000; 
#set	LeaningColumnLiveLoadFloor18	562.500000; 
#set	LeaningColumnLiveLoadFloor19	562.500000; 
#set	LeaningColumnLiveLoadFloor20	562.500000; 

# Assign point live load values on leaning column (kip)
set	LeaningColumnLiveLoadFloor2	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor3	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor4	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor5	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor6	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor7	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor8	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor9	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor10	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor11	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor12	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor13	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor14	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor15	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor16	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor17	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor18	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor19	[expr $Lintrmass/2]; 
set	LeaningColumnLiveLoadFloor20	[expr $Lrfmass/2];


#################################################
# Make the live load pattern :
#################################################
pattern	Plain	1002	Constant -fact 0.25	{

# Define point loads on leaning column
load	72	0	[expr -1*$LeaningColumnLiveLoadFloor2]	0; 
load	73	0	[expr -1*$LeaningColumnLiveLoadFloor3]	0; 
load	74	0	[expr -1*$LeaningColumnLiveLoadFloor4]	0; 
load	75	0	[expr -1*$LeaningColumnLiveLoadFloor5]	0; 
load	76	0	[expr -1*$LeaningColumnLiveLoadFloor6]	0; 
load	77	0	[expr -1*$LeaningColumnLiveLoadFloor7]	0; 
load	78	0	[expr -1*$LeaningColumnLiveLoadFloor8]	0; 
load	79	0	[expr -1*$LeaningColumnLiveLoadFloor9]	0; 
load	710	0	[expr -1*$LeaningColumnLiveLoadFloor10]	0; 
load	711	0	[expr -1*$LeaningColumnLiveLoadFloor11]	0; 
load	712	0	[expr -1*$LeaningColumnLiveLoadFloor12]	0; 
load	713	0	[expr -1*$LeaningColumnLiveLoadFloor13]	0; 
load	714	0	[expr -1*$LeaningColumnLiveLoadFloor14]	0; 
load	715	0	[expr -1*$LeaningColumnLiveLoadFloor15]	0; 
load	716	0	[expr -1*$LeaningColumnLiveLoadFloor16]	0; 
load	717	0	[expr -1*$LeaningColumnLiveLoadFloor17]	0; 
load	718	0	[expr -1*$LeaningColumnLiveLoadFloor18]	0; 
load	719	0	[expr -1*$LeaningColumnLiveLoadFloor19]	0; 
load	720	0	[expr -1*$LeaningColumnLiveLoadFloor20]	0; 


# Level2
eleLoad	-ele	2121221	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor2]; 
eleLoad	-ele	2221321	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor2]; 
eleLoad	-ele	2321421	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor2]; 
eleLoad	-ele	2421521	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor2]; 
eleLoad	-ele	2521621	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor2]; 

# Level3
eleLoad	-ele	2131231	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor3]; 
eleLoad	-ele	2231331	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor3]; 
eleLoad	-ele	2331431	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor3]; 
eleLoad	-ele	2431531	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor3]; 
eleLoad	-ele	2531631	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor3]; 

# Level4
eleLoad	-ele	2141241	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor4]; 
eleLoad	-ele	2241341	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor4]; 
eleLoad	-ele	2341441	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor4]; 
eleLoad	-ele	2441541	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor4]; 
eleLoad	-ele	2541641	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor4]; 

# Level5
eleLoad	-ele	2151251	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor5]; 
eleLoad	-ele	2251351	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor5]; 
eleLoad	-ele	2351451	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor5]; 
eleLoad	-ele	2451551	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor5]; 
eleLoad	-ele	2551651	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor5]; 

# Level6
eleLoad	-ele	2161261	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor6]; 
eleLoad	-ele	2261361	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor6]; 
eleLoad	-ele	2361461	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor6]; 
eleLoad	-ele	2461561	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor6]; 
eleLoad	-ele	2561661	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor6]; 

# Level7
eleLoad	-ele	2171271	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor7]; 
eleLoad	-ele	2271371	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor7]; 
eleLoad	-ele	2371471	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor7]; 
eleLoad	-ele	2471571	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor7]; 
eleLoad	-ele	2571671	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor7]; 

# Level8
eleLoad	-ele	2181281	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor8]; 
eleLoad	-ele	2281381	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor8]; 
eleLoad	-ele	2381481	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor8]; 
eleLoad	-ele	2481581	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor8]; 
eleLoad	-ele	2581681	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor8]; 

# Level9
eleLoad	-ele	2191291	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor9]; 
eleLoad	-ele	2291391	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor9]; 
eleLoad	-ele	2391491	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor9]; 
eleLoad	-ele	2491591	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor9]; 
eleLoad	-ele	2591691	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor9]; 

# Level10
eleLoad	-ele	211012101	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor10]; 
eleLoad	-ele	221013101	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor10]; 
eleLoad	-ele	231014101	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor10]; 
eleLoad	-ele	241015101	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor10]; 
eleLoad	-ele	251016101	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor10]; 

# Level11
eleLoad	-ele	211112111	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor11]; 
eleLoad	-ele	221113111	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor11]; 
eleLoad	-ele	231114111	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor11]; 
eleLoad	-ele	241115111	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor11]; 
eleLoad	-ele	251116111	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor11]; 

# Level12
eleLoad	-ele	211212121	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor12]; 
eleLoad	-ele	221213121	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor12]; 
eleLoad	-ele	231214121	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor12]; 
eleLoad	-ele	241215121	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor12]; 
eleLoad	-ele	251216121	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor12]; 

# Level13
eleLoad	-ele	211312131	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor13]; 
eleLoad	-ele	221313131	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor13]; 
eleLoad	-ele	231314131	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor13]; 
eleLoad	-ele	241315131	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor13]; 
eleLoad	-ele	251316131	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor13]; 

# Level14
eleLoad	-ele	211412141	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor14]; 
eleLoad	-ele	221413141	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor14]; 
eleLoad	-ele	231414141	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor14]; 
eleLoad	-ele	241415141	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor14]; 
eleLoad	-ele	251416141	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor14]; 

# Level15
eleLoad	-ele	211512151	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor15]; 
eleLoad	-ele	221513151	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor15]; 
eleLoad	-ele	231514151	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor15]; 
eleLoad	-ele	241515151	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor15]; 
eleLoad	-ele	251516151	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor15]; 

# Level16
eleLoad	-ele	211612161	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor16]; 
eleLoad	-ele	221613161	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor16]; 
eleLoad	-ele	231614161	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor16]; 
eleLoad	-ele	241615161	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor16]; 
eleLoad	-ele	251616161	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor16]; 

# Level17
eleLoad	-ele	211712171	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor17]; 
eleLoad	-ele	221713171	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor17]; 
eleLoad	-ele	231714171	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor17]; 
eleLoad	-ele	241715171	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor17]; 
eleLoad	-ele	251716171	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor17]; 

# Level18
eleLoad	-ele	211812181	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor18]; 
eleLoad	-ele	221813181	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor18]; 
eleLoad	-ele	231814181	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor18]; 
eleLoad	-ele	241815181	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor18]; 
eleLoad	-ele	251816181	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor18]; 

# Level19
eleLoad	-ele	211912191	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor19]; 
eleLoad	-ele	221913191	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor19]; 
eleLoad	-ele	231914191	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor19]; 
eleLoad	-ele	241915191	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor19]; 
eleLoad	-ele	251916191	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor19]; 

# Level20
eleLoad	-ele	212012201	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor20]; 
eleLoad	-ele	222013201	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor20]; 
eleLoad	-ele	232014201	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor20]; 
eleLoad	-ele	242015201	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor20]; 
eleLoad	-ele	252016201	-type	-beamUniform	[expr -1*$BeamLiveLoadFloor20]; 


}

##################################################
# Initiate the Dead load pattern
##################################################

pattern	Plain	1001	Constant -fact 1.0	{
# Level2
eleLoad	-ele	2121221	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor2]; 
eleLoad	-ele	2221321	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor2]; 
eleLoad	-ele	2321421	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor2]; 
eleLoad	-ele	2421521	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor2]; 
eleLoad	-ele	2521621	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor2]; 

# Level3
eleLoad	-ele	2131231	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor3]; 
eleLoad	-ele	2231331	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor3]; 
eleLoad	-ele	2331431	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor3]; 
eleLoad	-ele	2431531	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor3]; 
eleLoad	-ele	2531631	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor3]; 

# Level4
eleLoad	-ele	2141241	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor4]; 
eleLoad	-ele	2241341	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor4]; 
eleLoad	-ele	2341441	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor4]; 
eleLoad	-ele	2441541	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor4]; 
eleLoad	-ele	2541641	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor4]; 

# Level5
eleLoad	-ele	2151251	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor5]; 
eleLoad	-ele	2251351	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor5]; 
eleLoad	-ele	2351451	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor5]; 
eleLoad	-ele	2451551	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor5]; 
eleLoad	-ele	2551651	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor5]; 

# Level6
eleLoad	-ele	2161261	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor6]; 
eleLoad	-ele	2261361	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor6]; 
eleLoad	-ele	2361461	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor6]; 
eleLoad	-ele	2461561	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor6]; 
eleLoad	-ele	2561661	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor6]; 

# Level7
eleLoad	-ele	2171271	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor7]; 
eleLoad	-ele	2271371	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor7]; 
eleLoad	-ele	2371471	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor7]; 
eleLoad	-ele	2471571	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor7]; 
eleLoad	-ele	2571671	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor7]; 

# Level8
eleLoad	-ele	2181281	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor8]; 
eleLoad	-ele	2281381	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor8]; 
eleLoad	-ele	2381481	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor8]; 
eleLoad	-ele	2481581	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor8]; 
eleLoad	-ele	2581681	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor8]; 

# Level9
eleLoad	-ele	2191291	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor9]; 
eleLoad	-ele	2291391	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor9]; 
eleLoad	-ele	2391491	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor9]; 
eleLoad	-ele	2491591	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor9]; 
eleLoad	-ele	2591691	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor9]; 

# Level10
eleLoad	-ele	211012101	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor10]; 
eleLoad	-ele	221013101	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor10]; 
eleLoad	-ele	231014101	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor10]; 
eleLoad	-ele	241015101	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor10]; 
eleLoad	-ele	251016101	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor10]; 

# Level11
eleLoad	-ele	211112111	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor11]; 
eleLoad	-ele	221113111	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor11]; 
eleLoad	-ele	231114111	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor11]; 
eleLoad	-ele	241115111	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor11]; 
eleLoad	-ele	251116111	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor11]; 

# Level12
eleLoad	-ele	211212121	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor12]; 
eleLoad	-ele	221213121	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor12]; 
eleLoad	-ele	231214121	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor12]; 
eleLoad	-ele	241215121	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor12]; 
eleLoad	-ele	251216121	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor12]; 

# Level13
eleLoad	-ele	211312131	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor13]; 
eleLoad	-ele	221313131	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor13]; 
eleLoad	-ele	231314131	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor13]; 
eleLoad	-ele	241315131	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor13]; 
eleLoad	-ele	251316131	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor13]; 

# Level14
eleLoad	-ele	211412141	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor14]; 
eleLoad	-ele	221413141	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor14]; 
eleLoad	-ele	231414141	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor14]; 
eleLoad	-ele	241415141	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor14]; 
eleLoad	-ele	251416141	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor14]; 

# Level15
eleLoad	-ele	211512151	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor15]; 
eleLoad	-ele	221513151	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor15]; 
eleLoad	-ele	231514151	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor15]; 
eleLoad	-ele	241515151	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor15]; 
eleLoad	-ele	251516151	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor15]; 

# Level16
eleLoad	-ele	211612161	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor16]; 
eleLoad	-ele	221613161	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor16]; 
eleLoad	-ele	231614161	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor16]; 
eleLoad	-ele	241615161	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor16]; 
eleLoad	-ele	251616161	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor16]; 

# Level17
eleLoad	-ele	211712171	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor17]; 
eleLoad	-ele	221713171	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor17]; 
eleLoad	-ele	231714171	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor17]; 
eleLoad	-ele	241715171	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor17]; 
eleLoad	-ele	251716171	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor17]; 

# Level18
eleLoad	-ele	211812181	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor18]; 
eleLoad	-ele	221813181	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor18]; 
eleLoad	-ele	231814181	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor18]; 
eleLoad	-ele	241815181	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor18]; 
eleLoad	-ele	251816181	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor18]; 

# Level19
eleLoad	-ele	211912191	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor19]; 
eleLoad	-ele	221913191	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor19]; 
eleLoad	-ele	231914191	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor19]; 
eleLoad	-ele	241915191	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor19]; 
eleLoad	-ele	251916191	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor19]; 

# Level20
eleLoad	-ele	212012201	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor20]; 
eleLoad	-ele	222013201	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor20]; 
eleLoad	-ele	232014201	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor20]; 
eleLoad	-ele	242015201	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor20]; 
eleLoad	-ele	252016201	-type	-beamUniform	[expr -1*$BeamDeadLoadFloor20]; 



# Define point loads on leaning column
load	72	0	[expr -1*$LeaningColumnDeadLoadFloor2]	0; 
load	73	0	[expr -1*$LeaningColumnDeadLoadFloor3]	0; 
load	74	0	[expr -1*$LeaningColumnDeadLoadFloor4]	0; 
load	75	0	[expr -1*$LeaningColumnDeadLoadFloor5]	0; 
load	76	0	[expr -1*$LeaningColumnDeadLoadFloor6]	0; 
load	77	0	[expr -1*$LeaningColumnDeadLoadFloor7]	0; 
load	78	0	[expr -1*$LeaningColumnDeadLoadFloor8]	0; 
load	79	0	[expr -1*$LeaningColumnDeadLoadFloor9]	0; 
load	710	0	[expr -1*$LeaningColumnDeadLoadFloor10]	0; 
load	711	0	[expr -1*$LeaningColumnDeadLoadFloor11]	0; 
load	712	0	[expr -1*$LeaningColumnDeadLoadFloor12]	0; 
load	713	0	[expr -1*$LeaningColumnDeadLoadFloor13]	0; 
load	714	0	[expr -1*$LeaningColumnDeadLoadFloor14]	0; 
load	715	0	[expr -1*$LeaningColumnDeadLoadFloor15]	0; 
load	716	0	[expr -1*$LeaningColumnDeadLoadFloor16]	0; 
load	717	0	[expr -1*$LeaningColumnDeadLoadFloor17]	0; 
load	718	0	[expr -1*$LeaningColumnDeadLoadFloor18]	0; 
load	719	0	[expr -1*$LeaningColumnDeadLoadFloor19]	0; 
load	720	0	[expr -1*$LeaningColumnDeadLoadFloor20]	0; 

}

