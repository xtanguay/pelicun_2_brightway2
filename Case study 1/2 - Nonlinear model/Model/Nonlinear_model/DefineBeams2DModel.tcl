# This file will be used to define beam elements 


# Define beams 
element	elasticBeamColumn	2121221	1215	2213	[lindex $BeamLevel2 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel2 6]]	$CorotationalTransf;
element	elasticBeamColumn	2221321	2215	3213	[lindex $BeamLevel2 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel2 6]]	$CorotationalTransf;
element	elasticBeamColumn	2321421	3215	4213	[lindex $BeamLevel2 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel2 6]]	$CorotationalTransf;
element	elasticBeamColumn	2421521	4215	5213	[lindex $BeamLevel2 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel2 6]]	$CorotationalTransf;
element	elasticBeamColumn	2521621	5215	6213	[lindex $BeamLevel2 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel2 6]]	$CorotationalTransf;
element	truss	262172	6211	72	$AreaRigid	$TrussMatID; 		
								
# Level3								
element	elasticBeamColumn	2131231	1315	2313	[lindex $BeamLevel3 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel3 6]]	$CorotationalTransf;
element	elasticBeamColumn	2231331	2315	3313	[lindex $BeamLevel3 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel3 6]]	$CorotationalTransf;
element	elasticBeamColumn	2331431	3315	4313	[lindex $BeamLevel3 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel3 6]]	$CorotationalTransf;
element	elasticBeamColumn	2431531	4315	5313	[lindex $BeamLevel3 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel3 6]]	$CorotationalTransf;
element	elasticBeamColumn	2531631	5315	6313	[lindex $BeamLevel3 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel3 6]]	$CorotationalTransf;
element	truss	263173	6311	73	$AreaRigid	$TrussMatID; 		
								
# Level4								
element	elasticBeamColumn	2141241	1415	2413	[lindex $BeamLevel4 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel4 6]]	$CorotationalTransf;
element	elasticBeamColumn	2241341	2415	3413	[lindex $BeamLevel4 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel4 6]]	$CorotationalTransf;
element	elasticBeamColumn	2341441	3415	4413	[lindex $BeamLevel4 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel4 6]]	$CorotationalTransf;
element	elasticBeamColumn	2441541	4415	5413	[lindex $BeamLevel4 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel4 6]]	$CorotationalTransf;
element	elasticBeamColumn	2541641	5415	6413	[lindex $BeamLevel4 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel4 6]]	$CorotationalTransf;
element	truss	264174	6411	74	$AreaRigid	$TrussMatID; 		
								
# Level5								
element	elasticBeamColumn	2151251	1515	2513	[lindex $BeamLevel5 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel5 6]]	$CorotationalTransf;
element	elasticBeamColumn	2251351	2515	3513	[lindex $BeamLevel5 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel5 6]]	$CorotationalTransf;
element	elasticBeamColumn	2351451	3515	4513	[lindex $BeamLevel5 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel5 6]]	$CorotationalTransf;
element	elasticBeamColumn	2451551	4515	5513	[lindex $BeamLevel5 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel5 6]]	$CorotationalTransf;
element	elasticBeamColumn	2551651	5515	6513	[lindex $BeamLevel5 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel5 6]]	$CorotationalTransf;
element	truss	265175	6511	75	$AreaRigid	$TrussMatID; 		
								
# Level6								
element	elasticBeamColumn	2161261	1615	2613	[lindex $BeamLevel6 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel6 6]]	$CorotationalTransf;
element	elasticBeamColumn	2261361	2615	3613	[lindex $BeamLevel6 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel6 6]]	$CorotationalTransf;
element	elasticBeamColumn	2361461	3615	4613	[lindex $BeamLevel6 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel6 6]]	$CorotationalTransf;
element	elasticBeamColumn	2461561	4615	5613	[lindex $BeamLevel6 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel6 6]]	$CorotationalTransf;
element	elasticBeamColumn	2561661	5615	6613	[lindex $BeamLevel6 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel6 6]]	$CorotationalTransf;
element	truss	266176	6611	76	$AreaRigid	$TrussMatID; 		
								
# Level7								
element	elasticBeamColumn	2171271	1715	2713	[lindex $BeamLevel7 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel7 6]]	$CorotationalTransf;
element	elasticBeamColumn	2271371	2715	3713	[lindex $BeamLevel7 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel7 6]]	$CorotationalTransf;
element	elasticBeamColumn	2371471	3715	4713	[lindex $BeamLevel7 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel7 6]]	$CorotationalTransf;
element	elasticBeamColumn	2471571	4715	5713	[lindex $BeamLevel7 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel7 6]]	$CorotationalTransf;
element	elasticBeamColumn	2571671	5715	6713	[lindex $BeamLevel7 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel7 6]]	$CorotationalTransf;
element	truss	267177	6711	77	$AreaRigid	$TrussMatID; 		
								
# Level8								
element	elasticBeamColumn	2181281	1815	2813	[lindex $BeamLevel8 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel8 6]]	$CorotationalTransf;
element	elasticBeamColumn	2281381	2815	3813	[lindex $BeamLevel8 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel8 6]]	$CorotationalTransf;
element	elasticBeamColumn	2381481	3815	4813	[lindex $BeamLevel8 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel8 6]]	$CorotationalTransf;
element	elasticBeamColumn	2481581	4815	5813	[lindex $BeamLevel8 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel8 6]]	$CorotationalTransf;
element	elasticBeamColumn	2581681	5815	6813	[lindex $BeamLevel8 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel8 6]]	$CorotationalTransf;
element	truss	268178	6811	78	$AreaRigid	$TrussMatID; 		
								
# Level9								
element	elasticBeamColumn	2191291	1915	2913	[lindex $BeamLevel9 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel9 6]]	$CorotationalTransf;
element	elasticBeamColumn	2291391	2915	3913	[lindex $BeamLevel9 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel9 6]]	$CorotationalTransf;
element	elasticBeamColumn	2391491	3915	4913	[lindex $BeamLevel9 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel9 6]]	$CorotationalTransf;
element	elasticBeamColumn	2491591	4915	5913	[lindex $BeamLevel9 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel9 6]]	$CorotationalTransf;
element	elasticBeamColumn	2591691	5915	6913	[lindex $BeamLevel9 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel9 6]]	$CorotationalTransf;
element	truss	269179	6911	79	$AreaRigid	$TrussMatID; 		
								
# Level10								
element	elasticBeamColumn	211012101	11015	21013	[lindex $BeamLevel10 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel10 6]]	$CorotationalTransf;
element	elasticBeamColumn	221013101	21015	31013	[lindex $BeamLevel10 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel10 6]]	$CorotationalTransf;
element	elasticBeamColumn	231014101	31015	41013	[lindex $BeamLevel10 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel10 6]]	$CorotationalTransf;
element	elasticBeamColumn	241015101	41015	51013	[lindex $BeamLevel10 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel10 6]]	$CorotationalTransf;
element	elasticBeamColumn	251016101	51015	61013	[lindex $BeamLevel10 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel10 6]]	$CorotationalTransf;
element	truss	26101710	61011	710	$AreaRigid	$TrussMatID; 		
								
# Level11								
element	elasticBeamColumn	211112111	11115	21113	[lindex $BeamLevel11 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel11 6]]	$CorotationalTransf;
element	elasticBeamColumn	221113111	21115	31113	[lindex $BeamLevel11 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel11 6]]	$CorotationalTransf;
element	elasticBeamColumn	231114111	31115	41113	[lindex $BeamLevel11 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel11 6]]	$CorotationalTransf;
element	elasticBeamColumn	241115111	41115	51113	[lindex $BeamLevel11 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel11 6]]	$CorotationalTransf;
element	elasticBeamColumn	251116111	51115	61113	[lindex $BeamLevel11 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel11 6]]	$CorotationalTransf;
element	truss	26111711	61111	711	$AreaRigid	$TrussMatID; 		
								
# Level12								
element	elasticBeamColumn	211212121	11215	21213	[lindex $BeamLevel12 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel12 6]]	$CorotationalTransf;
element	elasticBeamColumn	221213121	21215	31213	[lindex $BeamLevel12 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel12 6]]	$CorotationalTransf;
element	elasticBeamColumn	231214121	31215	41213	[lindex $BeamLevel12 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel12 6]]	$CorotationalTransf;
element	elasticBeamColumn	241215121	41215	51213	[lindex $BeamLevel12 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel12 6]]	$CorotationalTransf;
element	elasticBeamColumn	251216121	51215	61213	[lindex $BeamLevel12 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel12 6]]	$CorotationalTransf;
element	truss	26121712	61211	712	$AreaRigid	$TrussMatID; 		
								
# Level13								
element	elasticBeamColumn	211312131	11315	21313	[lindex $BeamLevel13 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel13 6]]	$CorotationalTransf;
element	elasticBeamColumn	221313131	21315	31313	[lindex $BeamLevel13 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel13 6]]	$CorotationalTransf;
element	elasticBeamColumn	231314131	31315	41313	[lindex $BeamLevel13 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel13 6]]	$CorotationalTransf;
element	elasticBeamColumn	241315131	41315	51313	[lindex $BeamLevel13 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel13 6]]	$CorotationalTransf;
element	elasticBeamColumn	251316131	51315	61313	[lindex $BeamLevel13 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel13 6]]	$CorotationalTransf;
element	truss	26131713	61311	713	$AreaRigid	$TrussMatID; 		
								
# Level14								
element	elasticBeamColumn	211412141	11415	21413	[lindex $BeamLevel14 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel14 6]]	$CorotationalTransf;
element	elasticBeamColumn	221413141	21415	31413	[lindex $BeamLevel14 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel14 6]]	$CorotationalTransf;
element	elasticBeamColumn	231414141	31415	41413	[lindex $BeamLevel14 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel14 6]]	$CorotationalTransf;
element	elasticBeamColumn	241415141	41415	51413	[lindex $BeamLevel14 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel14 6]]	$CorotationalTransf;
element	elasticBeamColumn	251416141	51415	61413	[lindex $BeamLevel14 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel14 6]]	$CorotationalTransf;
element	truss	26141714	61411	714	$AreaRigid	$TrussMatID; 		
								
# Level15								
element	elasticBeamColumn	211512151	11515	21513	[lindex $BeamLevel15 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel15 6]]	$CorotationalTransf;
element	elasticBeamColumn	221513151	21515	31513	[lindex $BeamLevel15 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel15 6]]	$CorotationalTransf;
element	elasticBeamColumn	231514151	31515	41513	[lindex $BeamLevel15 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel15 6]]	$CorotationalTransf;
element	elasticBeamColumn	241515151	41515	51513	[lindex $BeamLevel15 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel15 6]]	$CorotationalTransf;
element	elasticBeamColumn	251516151	51515	61513	[lindex $BeamLevel15 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel15 6]]	$CorotationalTransf;
element	truss	26151715	61511	715	$AreaRigid	$TrussMatID; 		
								
# Level16								
element	elasticBeamColumn	211612161	11615	21613	[lindex $BeamLevel16 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel16 6]]	$CorotationalTransf;
element	elasticBeamColumn	221613161	21615	31613	[lindex $BeamLevel16 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel16 6]]	$CorotationalTransf;
element	elasticBeamColumn	231614161	31615	41613	[lindex $BeamLevel16 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel16 6]]	$CorotationalTransf;
element	elasticBeamColumn	241615161	41615	51613	[lindex $BeamLevel16 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel16 6]]	$CorotationalTransf;
element	elasticBeamColumn	251616161	51615	61613	[lindex $BeamLevel16 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel16 6]]	$CorotationalTransf;
element	truss	26161716	61611	716	$AreaRigid	$TrussMatID; 		
								
# Level17								
element	elasticBeamColumn	211712171	11715	21713	[lindex $BeamLevel17 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel17 6]]	$CorotationalTransf;
element	elasticBeamColumn	221713171	21715	31713	[lindex $BeamLevel17 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel17 6]]	$CorotationalTransf;
element	elasticBeamColumn	231714171	31715	41713	[lindex $BeamLevel17 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel17 6]]	$CorotationalTransf;
element	elasticBeamColumn	241715171	41715	51713	[lindex $BeamLevel17 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel17 6]]	$CorotationalTransf;
element	elasticBeamColumn	251716171	51715	61713	[lindex $BeamLevel17 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel17 6]]	$CorotationalTransf;
element	truss	26171717	61711	717	$AreaRigid	$TrussMatID; 		
								
# Level18								
element	elasticBeamColumn	211812181	11815	21813	[lindex $BeamLevel18 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel18 6]]	$CorotationalTransf;
element	elasticBeamColumn	221813181	21815	31813	[lindex $BeamLevel18 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel18 6]]	$CorotationalTransf;
element	elasticBeamColumn	231814181	31815	41813	[lindex $BeamLevel18 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel18 6]]	$CorotationalTransf;
element	elasticBeamColumn	241815181	41815	51813	[lindex $BeamLevel18 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel18 6]]	$CorotationalTransf;
element	elasticBeamColumn	251816181	51815	61813	[lindex $BeamLevel18 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel18 6]]	$CorotationalTransf;
element	truss	26181718	61811	718	$AreaRigid	$TrussMatID; 		
								
# Level19								
element	elasticBeamColumn	211912191	11915	21913	[lindex $BeamLevel19 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel19 6]]	$CorotationalTransf;
element	elasticBeamColumn	221913191	21915	31913	[lindex $BeamLevel19 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel19 6]]	$CorotationalTransf;
element	elasticBeamColumn	231914191	31915	41913	[lindex $BeamLevel19 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel19 6]]	$CorotationalTransf;
element	elasticBeamColumn	241915191	41915	51913	[lindex $BeamLevel19 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel19 6]]	$CorotationalTransf;
element	elasticBeamColumn	251916191	51915	61913	[lindex $BeamLevel19 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel19 6]]	$CorotationalTransf;
element	truss	26191719	61911	719	$AreaRigid	$TrussMatID; 		
								
# Level20								
element	elasticBeamColumn	212012201	12015	22013	[lindex $BeamLevel20 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel20 6]]	$CorotationalTransf;
element	elasticBeamColumn	222013201	22015	32013	[lindex $BeamLevel20 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel20 6]]	$CorotationalTransf;
element	elasticBeamColumn	232014201	32015	42013	[lindex $BeamLevel20 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel20 6]]	$CorotationalTransf;
element	elasticBeamColumn	242015201	42015	52013	[lindex $BeamLevel20 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel20 6]]	$CorotationalTransf;
element	elasticBeamColumn	252016201	52015	62013	[lindex $BeamLevel20 2]	$Es	[expr ($n+1.0)/$n*[lindex $BeamLevel20 6]]	$CorotationalTransf;
element	truss	26201720	62011	720	$AreaRigid	$TrussMatID; 		
		

puts "Beams defined"

