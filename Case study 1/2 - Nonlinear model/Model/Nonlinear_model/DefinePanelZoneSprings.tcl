# This file will be used to define springs in panel zone 

# Procedure command:
# rotPanelZone2D	eleID NodeR NodeC E Fy d_Col bf_Col tf_Col tw_Col d_Beam Ix_Col mu tdp trib ts Response_ID

# Level2
#rotPanelZone2D	912100	1203	1204	$Es	$Fy	35.20	16.00	1.89	1.04	37.10	....;

rotPanelZone2D	912100	1203	1204	$Es	$Fy	[lindex $ExteriorColumnStory1 1]	[lindex $ExteriorColumnStory1 3]	[lindex $ExteriorColumnStory1 5]	[lindex $ExteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $ExteriorColumnStory1 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	922100	2203	2204	$Es	$Fy	[lindex $InteriorColumnStory1 1]	[lindex $InteriorColumnStory1 3]	[lindex $InteriorColumnStory1 5]	[lindex $InteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $InteriorColumnStory1 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	932100	3203	3204	$Es	$Fy	[lindex $InteriorColumnStory1 1]	[lindex $InteriorColumnStory1 3]	[lindex $InteriorColumnStory1 5]	[lindex $InteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $InteriorColumnStory1 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	942100	4203	4204	$Es	$Fy	[lindex $InteriorColumnStory1 1]	[lindex $InteriorColumnStory1 3]	[lindex $InteriorColumnStory1 5]	[lindex $InteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $InteriorColumnStory1 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	952100	5203	5204	$Es	$Fy	[lindex $InteriorColumnStory1 1]	[lindex $InteriorColumnStory1 3]	[lindex $InteriorColumnStory1 5]	[lindex $InteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $InteriorColumnStory1 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	962100	6203	6204	$Es	$Fy	[lindex $ExteriorColumnStory1 1]	[lindex $ExteriorColumnStory1 3]	[lindex $ExteriorColumnStory1 5]	[lindex $ExteriorColumnStory1 4]	[lindex $BeamLevel2 1]	[lindex $ExteriorColumnStory1 6] 0.3 0.0 0 0 2; 

# Level3
rotPanelZone2D	913100	1303	1304	$Es	$Fy	[lindex $ExteriorColumnStory2 1]	[lindex $ExteriorColumnStory2 3]	[lindex $ExteriorColumnStory2 5]	[lindex $ExteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $ExteriorColumnStory2 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	923100	2303	2304	$Es	$Fy	[lindex $InteriorColumnStory2 1]	[lindex $InteriorColumnStory2 3]	[lindex $InteriorColumnStory2 5]	[lindex $InteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $InteriorColumnStory2 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	933100	3303	3304	$Es	$Fy	[lindex $InteriorColumnStory2 1]	[lindex $InteriorColumnStory2 3]	[lindex $InteriorColumnStory2 5]	[lindex $InteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $InteriorColumnStory2 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	943100	4303	4304	$Es	$Fy	[lindex $InteriorColumnStory2 1]	[lindex $InteriorColumnStory2 3]	[lindex $InteriorColumnStory2 5]	[lindex $InteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $InteriorColumnStory2 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	953100	5303	5304	$Es	$Fy	[lindex $InteriorColumnStory2 1]	[lindex $InteriorColumnStory2 3]	[lindex $InteriorColumnStory2 5]	[lindex $InteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $InteriorColumnStory2 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	963100	6303	6304	$Es	$Fy	[lindex $ExteriorColumnStory2 1]	[lindex $ExteriorColumnStory2 3]	[lindex $ExteriorColumnStory2 5]	[lindex $ExteriorColumnStory2 4]	[lindex $BeamLevel3 1]	[lindex $ExteriorColumnStory2 6] 0.3 0.0 0 0 2; 

# Level4
rotPanelZone2D	914100	1403	1404	$Es	$Fy	[lindex $ExteriorColumnStory3 1]	[lindex $ExteriorColumnStory3 3]	[lindex $ExteriorColumnStory3 5]	[lindex $ExteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $ExteriorColumnStory3 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	924100	2403	2404	$Es	$Fy	[lindex $InteriorColumnStory3 1]	[lindex $InteriorColumnStory3 3]	[lindex $InteriorColumnStory3 5]	[lindex $InteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $InteriorColumnStory3 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	934100	3403	3404	$Es	$Fy	[lindex $InteriorColumnStory3 1]	[lindex $InteriorColumnStory3 3]	[lindex $InteriorColumnStory3 5]	[lindex $InteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $InteriorColumnStory3 6] 0.3 0.94 0 0 2; 
rotPanelZone2D	944100	4403	4404	$Es	$Fy	3[lindex $InteriorColumnStory3 1]	[lindex $InteriorColumnStory3 3]	[lindex $InteriorColumnStory3 5]	[lindex $InteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $InteriorColumnStory3 6] 0.3 0.94 0 0 2; 
rotPanelZone2D	954100	5403	5404	$Es	$Fy	[lindex $InteriorColumnStory3 1]	[lindex $InteriorColumnStory3 3]	[lindex $InteriorColumnStory3 5]	[lindex $InteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $InteriorColumnStory3 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	964100	6403	6404	$Es	$Fy	[lindex $ExteriorColumnStory3 1]	[lindex $ExteriorColumnStory3 3]	[lindex $ExteriorColumnStory3 5]	[lindex $ExteriorColumnStory3 4]	[lindex $BeamLevel4 1]	[lindex $ExteriorColumnStory3 6] 0.3 0.0 0 0 2; 

# Level5
rotPanelZone2D	915100	1503	1504	$Es	$Fy	[lindex $ExteriorColumnStory4 1]	[lindex $ExteriorColumnStory4 3]	[lindex $ExteriorColumnStory4 5]	[lindex $ExteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $ExteriorColumnStory4 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	925100	2503	2504	$Es	$Fy	[lindex $InteriorColumnStory4 1]	[lindex $InteriorColumnStory4 3]	[lindex $InteriorColumnStory4 5]	[lindex $InteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $InteriorColumnStory4 6] 0.3 1.57 0 0 2; 
rotPanelZone2D	935100	3503	3504	$Es	$Fy	[lindex $InteriorColumnStory4 1]	[lindex $InteriorColumnStory4 3]	[lindex $InteriorColumnStory4 5]	[lindex $InteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $InteriorColumnStory4 6] 0.3 1.57 0 0 2; 
rotPanelZone2D	945100	4503	4504	$Es	$Fy	[lindex $InteriorColumnStory4 1]	[lindex $InteriorColumnStory4 3]	[lindex $InteriorColumnStory4 5]	[lindex $InteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $InteriorColumnStory4 6] 0.3 1.57 0 0 2; 
rotPanelZone2D	955100	5503	5504	$Es	$Fy	[lindex $InteriorColumnStory4 1]	[lindex $InteriorColumnStory4 3]	[lindex $InteriorColumnStory4 5]	[lindex $InteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $InteriorColumnStory4 6] 0.3 1.57 0 0 2; 
rotPanelZone2D	965100	6503	6504	$Es	$Fy	[lindex $ExteriorColumnStory4 1]	[lindex $ExteriorColumnStory4 3]	[lindex $ExteriorColumnStory4 5]	[lindex $ExteriorColumnStory4 4]	[lindex $BeamLevel5 1]	[lindex $ExteriorColumnStory4 6] 0.3 0.35 0 0 2; 

# Level6
rotPanelZone2D	916100	1603	1604	$Es	$Fy	[lindex $ExteriorColumnStory5 1]	[lindex $ExteriorColumnStory5 3]	[lindex $ExteriorColumnStory5 5]	[lindex $ExteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $ExteriorColumnStory5 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	926100	2603	2604	$Es	$Fy	[lindex $InteriorColumnStory5 1]	[lindex $InteriorColumnStory5 3]	[lindex $InteriorColumnStory5 5]	[lindex $InteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $InteriorColumnStory5 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	936100	3603	3604	$Es	$Fy	[lindex $InteriorColumnStory5 1]	[lindex $InteriorColumnStory5 3]	[lindex $InteriorColumnStory5 5]	[lindex $InteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $InteriorColumnStory5 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	946100	4603	4604	$Es	$Fy	[lindex $InteriorColumnStory5 1]	[lindex $InteriorColumnStory5 3]	[lindex $InteriorColumnStory5 5]	[lindex $InteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $InteriorColumnStory5 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	956100	5603	5604	$Es	$Fy	[lindex $InteriorColumnStory5 1]	[lindex $InteriorColumnStory5 3]	[lindex $InteriorColumnStory5 5]	[lindex $InteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $InteriorColumnStory5 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	966100	6603	6604	$Es	$Fy	[lindex $ExteriorColumnStory5 1]	[lindex $ExteriorColumnStory5 3]	[lindex $ExteriorColumnStory5 5]	[lindex $ExteriorColumnStory5 4]	[lindex $BeamLevel6 1]	[lindex $ExteriorColumnStory5 6] 0.3 0.0 0 0 2; 

# Level7
rotPanelZone2D	917100	1703	1704	$Es	$Fy	[lindex $ExteriorColumnStory6 1]	[lindex $ExteriorColumnStory6 3]	[lindex $ExteriorColumnStory6 5]	[lindex $ExteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $ExteriorColumnStory6 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	927100	2703	2704	$Es	$Fy	[lindex $InteriorColumnStory6 1]	[lindex $InteriorColumnStory6 3]	[lindex $InteriorColumnStory6 5]	[lindex $InteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $InteriorColumnStory6 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	937100	3703	3704	$Es	$Fy	[lindex $InteriorColumnStory6 1]	[lindex $InteriorColumnStory6 3]	[lindex $InteriorColumnStory6 5]	[lindex $InteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $InteriorColumnStory6 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	947100	4703	4704	$Es	$Fy	[lindex $InteriorColumnStory6 1]	[lindex $InteriorColumnStory6 3]	[lindex $InteriorColumnStory6 5]	[lindex $InteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $InteriorColumnStory6 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	957100	5703	5704	$Es	$Fy	[lindex $InteriorColumnStory6 1]	[lindex $InteriorColumnStory6 3]	[lindex $InteriorColumnStory6 5]	[lindex $InteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $InteriorColumnStory6 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	967100	6703	6704	$Es	$Fy	[lindex $ExteriorColumnStory6 1]	[lindex $ExteriorColumnStory6 3]	[lindex $ExteriorColumnStory6 5]	[lindex $ExteriorColumnStory6 4]	[lindex $BeamLevel7 1]	[lindex $ExteriorColumnStory6 6] 0.3 0.0 0 0 2; 

# Level8
rotPanelZone2D	918100	1803	1804	$Es	$Fy	[lindex $ExteriorColumnStory7 1]	[lindex $ExteriorColumnStory7 3]	[lindex $ExteriorColumnStory7 5]	[lindex $ExteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $ExteriorColumnStory7 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	928100	2803	2804	$Es	$Fy	[lindex $InteriorColumnStory7 1]	[lindex $InteriorColumnStory7 3]	[lindex $InteriorColumnStory7 5]	[lindex $InteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $InteriorColumnStory7 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	938100	3803	3804	$Es	$Fy	[lindex $InteriorColumnStory7 1]	[lindex $InteriorColumnStory7 3]	[lindex $InteriorColumnStory7 5]	[lindex $InteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $InteriorColumnStory7 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	948100	4803	4804	$Es	$Fy	[lindex $InteriorColumnStory7 1]	[lindex $InteriorColumnStory7 3]	[lindex $InteriorColumnStory7 5]	[lindex $InteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $InteriorColumnStory7 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	958100	5803	5804	$Es	$Fy	[lindex $InteriorColumnStory7 1]	[lindex $InteriorColumnStory7 3]	[lindex $InteriorColumnStory7 5]	[lindex $InteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $InteriorColumnStory7 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	968100	6803	6804	$Es	$Fy	[lindex $ExteriorColumnStory7 1]	[lindex $ExteriorColumnStory7 3]	[lindex $ExteriorColumnStory7 5]	[lindex $ExteriorColumnStory7 4]	[lindex $BeamLevel8 1]	[lindex $ExteriorColumnStory7 6] 0.3 0.35 0 0 2; 

# Level9
rotPanelZone2D	919100	1903	1904	$Es	$Fy	[lindex $ExteriorColumnStory8 1]	[lindex $ExteriorColumnStory8 3]	[lindex $ExteriorColumnStory8 5]	[lindex $ExteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $ExteriorColumnStory8 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	929100	2903	2904	$Es	$Fy	[lindex $InteriorColumnStory8 1]	[lindex $InteriorColumnStory8 3]	[lindex $InteriorColumnStory8 5]	[lindex $InteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $InteriorColumnStory8 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	939100	3903	3904	$Es	$Fy	[lindex $InteriorColumnStory8 1]	[lindex $InteriorColumnStory8 3]	[lindex $InteriorColumnStory8 5]	[lindex $InteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $InteriorColumnStory8 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	949100	4903	4904	$Es	$Fy	[lindex $InteriorColumnStory8 1]	[lindex $InteriorColumnStory8 3]	[lindex $InteriorColumnStory8 5]	[lindex $InteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $InteriorColumnStory8 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	959100	5903	5904	$Es	$Fy	[lindex $InteriorColumnStory8 1]	[lindex $InteriorColumnStory8 3]	[lindex $InteriorColumnStory8 5]	[lindex $InteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $InteriorColumnStory8 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	969100	6903	6904	$Es	$Fy	[lindex $ExteriorColumnStory8 1]	[lindex $ExteriorColumnStory8 3]	[lindex $ExteriorColumnStory8 5]	[lindex $ExteriorColumnStory8 4]	[lindex $BeamLevel9 1]	[lindex $ExteriorColumnStory8 6] 0.3 0.0 0 0 2; 

# Level10
rotPanelZone2D	9110100	11003	11004	$Es	$Fy	[lindex $ExteriorColumnStory9 1]	[lindex $ExteriorColumnStory9 3]	[lindex $ExteriorColumnStory9 5]	[lindex $ExteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $ExteriorColumnStory9 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9210100	21003	21004	$Es	$Fy	[lindex $InteriorColumnStory9 1]	[lindex $InteriorColumnStory9 3]	[lindex $InteriorColumnStory9 5]	[lindex $InteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $InteriorColumnStory9 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9310100	31003	31004	$Es	$Fy	[lindex $InteriorColumnStory9 1]	[lindex $InteriorColumnStory9 3]	[lindex $InteriorColumnStory9 5]	[lindex $InteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $InteriorColumnStory9 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9410100	41003	41004	$Es	$Fy	[lindex $InteriorColumnStory9 1]	[lindex $InteriorColumnStory9 3]	[lindex $InteriorColumnStory9 5]	[lindex $InteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $InteriorColumnStory9 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9510100	51003	51004	$Es	$Fy	[lindex $InteriorColumnStory9 1]	[lindex $InteriorColumnStory9 3]	[lindex $InteriorColumnStory9 5]	[lindex $InteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $InteriorColumnStory9 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9610100	61003	61004	$Es	$Fy	[lindex $ExteriorColumnStory9 1]	[lindex $ExteriorColumnStory9 3]	[lindex $ExteriorColumnStory9 5]	[lindex $ExteriorColumnStory9 4]	[lindex $BeamLevel10 1]	[lindex $ExteriorColumnStory9 6] 0.3 0.0 0 0 2; 

# Level11
rotPanelZone2D	9111100	11103	11104	$Es	$Fy	[lindex $ExteriorColumnStory10 1]	[lindex $ExteriorColumnStory10 3]	[lindex $ExteriorColumnStory10 5]	[lindex $ExteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $ExteriorColumnStory10 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9211100	21103	21104	$Es	$Fy	[lindex $InteriorColumnStory10 1]	[lindex $InteriorColumnStory10 3]	[lindex $InteriorColumnStory10 5]	[lindex $InteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $InteriorColumnStory10 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9311100	31103	31104	$Es	$Fy	[lindex $InteriorColumnStory10 1]	[lindex $InteriorColumnStory10 3]	[lindex $InteriorColumnStory10 5]	[lindex $InteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $InteriorColumnStory10 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9411100	41103	41104	$Es	$Fy	[lindex $InteriorColumnStory10 1]	[lindex $InteriorColumnStory10 3]	[lindex $InteriorColumnStory10 5]	[lindex $InteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $InteriorColumnStory10 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9511100	51103	51104	$Es	$Fy	[lindex $InteriorColumnStory10 1]	[lindex $InteriorColumnStory10 3]	[lindex $InteriorColumnStory10 5]	[lindex $InteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $InteriorColumnStory10 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9611100	61103	61104	$Es	$Fy	[lindex $ExteriorColumnStory10 1]	[lindex $ExteriorColumnStory10 3]	[lindex $ExteriorColumnStory10 5]	[lindex $ExteriorColumnStory10 4]	[lindex $BeamLevel11 1]	[lindex $ExteriorColumnStory10 6] 0.3 0.35 0 0 2; 

# Level12
rotPanelZone2D	9112100	11203	11204	$Es	$Fy	[lindex $ExteriorColumnStory11 1]	[lindex $ExteriorColumnStory11 3]	[lindex $ExteriorColumnStory11 5]	[lindex $ExteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $ExteriorColumnStory11 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9212100	21203	21204	$Es	$Fy	[lindex $InteriorColumnStory11 1]	[lindex $InteriorColumnStory11 3]	[lindex $InteriorColumnStory11 5]	[lindex $InteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $InteriorColumnStory11 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9312100	31203	31204	$Es	$Fy	[lindex $InteriorColumnStory11 1]	[lindex $InteriorColumnStory11 3]	[lindex $InteriorColumnStory11 5]	[lindex $InteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $InteriorColumnStory11 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9412100	41203	41204	$Es	$Fy	[lindex $InteriorColumnStory11 1]	[lindex $InteriorColumnStory11 3]	[lindex $InteriorColumnStory11 5]	[lindex $InteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $InteriorColumnStory11 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9512100	51203	51204	$Es	$Fy	[lindex $InteriorColumnStory11 1]	[lindex $InteriorColumnStory11 3]	[lindex $InteriorColumnStory11 5]	[lindex $InteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $InteriorColumnStory11 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9612100	61203	61204	$Es	$Fy	[lindex $ExteriorColumnStory11 1]	[lindex $ExteriorColumnStory11 3]	[lindex $ExteriorColumnStory11 5]	[lindex $ExteriorColumnStory11 4]	[lindex $BeamLevel12 1]	[lindex $ExteriorColumnStory11 6] 0.3 0.0 0 0 2; 

# Level13
rotPanelZone2D	9113100	11303	11304	$Es	$Fy	[lindex $ExteriorColumnStory12 1]	[lindex $ExteriorColumnStory12 3]	[lindex $ExteriorColumnStory12 5]	[lindex $ExteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $ExteriorColumnStory12 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9213100	21303	21304	$Es	$Fy	[lindex $InteriorColumnStory12 1]	[lindex $InteriorColumnStory12 3]	[lindex $InteriorColumnStory12 5]	[lindex $InteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $InteriorColumnStory12 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9313100	31303	31304	$Es	$Fy	[lindex $InteriorColumnStory12 1]	[lindex $InteriorColumnStory12 3]	[lindex $InteriorColumnStory12 5]	[lindex $InteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $InteriorColumnStory12 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9413100	41303	41304	$Es	$Fy	[lindex $InteriorColumnStory12 1]	[lindex $InteriorColumnStory12 3]	[lindex $InteriorColumnStory12 5]	[lindex $InteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $InteriorColumnStory12 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9513100	51303	51304	$Es	$Fy	[lindex $InteriorColumnStory12 1]	[lindex $InteriorColumnStory12 3]	[lindex $InteriorColumnStory12 5]	[lindex $InteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $InteriorColumnStory12 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9613100	61303	61304	$Es	$Fy	[lindex $ExteriorColumnStory12 1]	[lindex $ExteriorColumnStory12 3]	[lindex $ExteriorColumnStory12 5]	[lindex $ExteriorColumnStory12 4]	[lindex $BeamLevel13 1]	[lindex $ExteriorColumnStory12 6] 0.3 0.0 0 0 2; 

# Level14
rotPanelZone2D	9114100	11403	11404	$Es	$Fy	[lindex $ExteriorColumnStory13 1]	[lindex $ExteriorColumnStory13 3]	[lindex $ExteriorColumnStory13 5]	[lindex $ExteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $ExteriorColumnStory13 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9214100	21403	21404	$Es	$Fy	[lindex $InteriorColumnStory13 1]	[lindex $InteriorColumnStory13 3]	[lindex $InteriorColumnStory13 5]	[lindex $InteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $InteriorColumnStory13 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9314100	31403	31404	$Es	$Fy	[lindex $InteriorColumnStory13 1]	[lindex $InteriorColumnStory13 3]	[lindex $InteriorColumnStory13 5]	[lindex $InteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $InteriorColumnStory13 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9414100	41403	41404	$Es	$Fy	[lindex $InteriorColumnStory13 1]	[lindex $InteriorColumnStory13 3]	[lindex $InteriorColumnStory13 5]	[lindex $InteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $InteriorColumnStory13 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9514100	51403	51404	$Es	$Fy	[lindex $InteriorColumnStory13 1]	[lindex $InteriorColumnStory13 3]	[lindex $InteriorColumnStory13 5]	[lindex $InteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $InteriorColumnStory13 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9614100	61403	61404	$Es	$Fy	[lindex $ExteriorColumnStory13 1]	[lindex $ExteriorColumnStory13 3]	[lindex $ExteriorColumnStory13 5]	[lindex $ExteriorColumnStory13 4]	[lindex $BeamLevel14 1]	[lindex $ExteriorColumnStory13 6] 0.3 0.35 0 0 2; 

# Level15
rotPanelZone2D	9115100	11503	11504	$Es	$Fy	[lindex $ExteriorColumnStory14 1]	[lindex $ExteriorColumnStory14 3]	[lindex $ExteriorColumnStory14 5]	[lindex $ExteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $ExteriorColumnStory14 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9215100	21503	21504	$Es	$Fy	[lindex $InteriorColumnStory14 1]	[lindex $InteriorColumnStory14 3]	[lindex $InteriorColumnStory14 5]	[lindex $InteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $InteriorColumnStory14 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9315100	31503	31504	$Es	$Fy	[lindex $InteriorColumnStory14 1]	[lindex $InteriorColumnStory14 3]	[lindex $InteriorColumnStory14 5]	[lindex $InteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $InteriorColumnStory14 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9415100	41503	41504	$Es	$Fy	[lindex $InteriorColumnStory14 1]	[lindex $InteriorColumnStory14 3]	[lindex $InteriorColumnStory14 5]	[lindex $InteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $InteriorColumnStory14 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9515100	51503	51504	$Es	$Fy	[lindex $InteriorColumnStory14 1]	[lindex $InteriorColumnStory14 3]	[lindex $InteriorColumnStory14 5]	[lindex $InteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $InteriorColumnStory14 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9615100	61503	61504	$Es	$Fy	[lindex $ExteriorColumnStory14 1]	[lindex $ExteriorColumnStory14 3]	[lindex $ExteriorColumnStory14 5]	[lindex $ExteriorColumnStory14 4]	[lindex $BeamLevel15 1]	[lindex $ExteriorColumnStory14 6] 0.3 0.35 0 0 2; 

# Level16
rotPanelZone2D	9116100	11603	11604	$Es	$Fy	[lindex $ExteriorColumnStory15 1]	[lindex $ExteriorColumnStory15 3]	[lindex $ExteriorColumnStory15 5]	[lindex $ExteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $ExteriorColumnStory15 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9216100	21603	21604	$Es	$Fy	[lindex $InteriorColumnStory15 1]	[lindex $InteriorColumnStory15 3]	[lindex $InteriorColumnStory15 5]	[lindex $InteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $InteriorColumnStory15 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9316100	31603	31604	$Es	$Fy	[lindex $InteriorColumnStory15 1]	[lindex $InteriorColumnStory15 3]	[lindex $InteriorColumnStory15 5]	[lindex $InteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $InteriorColumnStory15 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9416100	41603	41604	$Es	$Fy	[lindex $InteriorColumnStory15 1]	[lindex $InteriorColumnStory15 3]	[lindex $InteriorColumnStory15 5]	[lindex $InteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $InteriorColumnStory15 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9516100	51603	51604	$Es	$Fy	[lindex $InteriorColumnStory15 1]	[lindex $InteriorColumnStory15 3]	[lindex $InteriorColumnStory15 5]	[lindex $InteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $InteriorColumnStory15 6] 0.3 0.79 0 0 2; 
rotPanelZone2D	9616100	61603	61604	$Es	$Fy	[lindex $ExteriorColumnStory15 1]	[lindex $ExteriorColumnStory15 3]	[lindex $ExteriorColumnStory15 5]	[lindex $ExteriorColumnStory15 4]	[lindex $BeamLevel16 1]	[lindex $ExteriorColumnStory15 6] 0.3 0.35 0 0 2; 

# Level17
rotPanelZone2D	9117100	11703	11704	$Es	$Fy	[lindex $ExteriorColumnStory16 1]	[lindex $ExteriorColumnStory16 3]	[lindex $ExteriorColumnStory16 5]	[lindex $ExteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $ExteriorColumnStory16 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9217100	21703	21704	$Es	$Fy	[lindex $InteriorColumnStory16 1]	[lindex $InteriorColumnStory16 3]	[lindex $InteriorColumnStory16 5]	[lindex $InteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $InteriorColumnStory16 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9317100	31703	31704	$Es	$Fy	[lindex $InteriorColumnStory16 1]	[lindex $InteriorColumnStory16 3]	[lindex $InteriorColumnStory16 5]	[lindex $InteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $InteriorColumnStory16 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9417100	41703	41704	$Es	$Fy	[lindex $InteriorColumnStory16 1]	[lindex $InteriorColumnStory16 3]	[lindex $InteriorColumnStory16 5]	[lindex $InteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $InteriorColumnStory16 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9517100	51703	51704	$Es	$Fy	[lindex $InteriorColumnStory16 1]	[lindex $InteriorColumnStory16 3]	[lindex $InteriorColumnStory16 5]	[lindex $InteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $InteriorColumnStory16 6] 0.3 1.26 0 0 2; 
rotPanelZone2D	9617100	61703	61704	$Es	$Fy	[lindex $ExteriorColumnStory16 1]	[lindex $ExteriorColumnStory16 3]	[lindex $ExteriorColumnStory16 5]	[lindex $ExteriorColumnStory16 4]	[lindex $BeamLevel17 1]	[lindex $ExteriorColumnStory16 6] 0.3 0.35 0 0 2; 

# Level18
rotPanelZone2D	9118100	11803	11804	$Es	$Fy	[lindex $ExteriorColumnStory17 1]	[lindex $ExteriorColumnStory17 3]	[lindex $ExteriorColumnStory17 5]	[lindex $ExteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $ExteriorColumnStory17 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9218100	21803	21804	$Es	$Fy	[lindex $InteriorColumnStory17 1]	[lindex $InteriorColumnStory17 3]	[lindex $InteriorColumnStory17 5]	[lindex $InteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $InteriorColumnStory17 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9318100	31803	31804	$Es	$Fy	[lindex $InteriorColumnStory17 1]	[lindex $InteriorColumnStory17 3]	[lindex $InteriorColumnStory17 5]	[lindex $InteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $InteriorColumnStory17 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9418100	41803	41804	$Es	$Fy	[lindex $InteriorColumnStory17 1]	[lindex $InteriorColumnStory17 3]	[lindex $InteriorColumnStory17 5]	[lindex $InteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $InteriorColumnStory17 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9518100	51803	51804	$Es	$Fy	[lindex $InteriorColumnStory17 1]	[lindex $InteriorColumnStory17 3]	[lindex $InteriorColumnStory17 5]	[lindex $InteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $InteriorColumnStory17 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9618100	61803	61804	$Es	$Fy	[lindex $ExteriorColumnStory17 1]	[lindex $ExteriorColumnStory17 3]	[lindex $ExteriorColumnStory17 5]	[lindex $ExteriorColumnStory17 4]	[lindex $BeamLevel18 1]	[lindex $ExteriorColumnStory17 6] 0.3 0.0 0 0 2; 

# Level19
rotPanelZone2D	9119100	11903	11904	$Es	$Fy	[lindex $ExteriorColumnStory18 1]	[lindex $ExteriorColumnStory18 3]	[lindex $ExteriorColumnStory18 5]	[lindex $ExteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $ExteriorColumnStory18 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9219100	21903	21904	$Es	$Fy	[lindex $InteriorColumnStory18 1]	[lindex $InteriorColumnStory18 3]	[lindex $InteriorColumnStory18 5]	[lindex $InteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $InteriorColumnStory18 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9319100	31903	31904	$Es	$Fy	[lindex $InteriorColumnStory18 1]	[lindex $InteriorColumnStory18 3]	[lindex $InteriorColumnStory18 5]	[lindex $InteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $InteriorColumnStory18 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9419100	41903	41904	$Es	$Fy	[lindex $InteriorColumnStory18 1]	[lindex $InteriorColumnStory18 3]	[lindex $InteriorColumnStory18 5]	[lindex $InteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $InteriorColumnStory18 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9519100	51903	51904	$Es	$Fy	[lindex $InteriorColumnStory18 1]	[lindex $InteriorColumnStory18 3]	[lindex $InteriorColumnStory18 5]	[lindex $InteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $InteriorColumnStory18 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9619100	61903	61904	$Es	$Fy	[lindex $ExteriorColumnStory18 1]	[lindex $ExteriorColumnStory18 3]	[lindex $ExteriorColumnStory18 5]	[lindex $ExteriorColumnStory18 4]	[lindex $BeamLevel19 1]	[lindex $ExteriorColumnStory18 6] 0.3 0.0 0 0 2; 

# Level20
rotPanelZone2D	9120100	12003	12004	$Es	$Fy	[lindex $ExteriorColumnStory19 1]	[lindex $ExteriorColumnStory19 3]	[lindex $ExteriorColumnStory19 5]	[lindex $ExteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $ExteriorColumnStory19 6] 0.3 0.0 0 0 2; 
rotPanelZone2D	9220100	22003	22004	$Es	$Fy	[lindex $InteriorColumnStory19 1]	[lindex $InteriorColumnStory19 3]	[lindex $InteriorColumnStory19 5]	[lindex $InteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $InteriorColumnStory19 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9320100	32003	32004	$Es	$Fy	[lindex $InteriorColumnStory19 1]	[lindex $InteriorColumnStory19 3]	[lindex $InteriorColumnStory19 5]	[lindex $InteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $InteriorColumnStory19 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9420100	42003	42004	$Es	$Fy	[lindex $InteriorColumnStory19 1]	[lindex $InteriorColumnStory19 3]	[lindex $InteriorColumnStory19 5]	[lindex $InteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $InteriorColumnStory19 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9520100	52003	52004	$Es	$Fy	[lindex $InteriorColumnStory19 1]	[lindex $InteriorColumnStory19 3]	[lindex $InteriorColumnStory19 5]	[lindex $InteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $InteriorColumnStory19 6] 0.3 0.35 0 0 2; 
rotPanelZone2D	9620100	62003	62004	$Es	$Fy	[lindex $ExteriorColumnStory19 1]	[lindex $ExteriorColumnStory19 3]	[lindex $ExteriorColumnStory19 5]	[lindex $ExteriorColumnStory19 4]	[lindex $BeamLevel20 1]	[lindex $ExteriorColumnStory19 6] 0.3 0.0 0 0 2; 

puts "Panel zone springs defined"