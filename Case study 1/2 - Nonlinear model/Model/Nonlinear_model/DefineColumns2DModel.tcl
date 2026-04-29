# This file will be used to define columns 

# Define columns
# Story 1 								
element	elasticBeamColumn	3111121	1114	1216	[lindex $ExteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3211221	2114	2216	[lindex $InteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3311321	3114	3216	[lindex $InteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3411421	4114	4216	[lindex $InteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3511521	5114	5216	[lindex $InteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3611621	6114	6216	[lindex $ExteriorColumnStory1 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory1 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371722	71	722	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 2 								
element	elasticBeamColumn	3121131	1214	1316	[lindex $ExteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3221231	2214	2316	[lindex $InteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3321331	3214	3316	[lindex $InteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3421431	4214	4316	[lindex $InteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3521531	5214	5316	[lindex $InteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3621631	6214	6316	[lindex $ExteriorColumnStory2 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory2 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3724732	724	732	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 3 								
element	elasticBeamColumn	3131141	1314	1416	[lindex $ExteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3231241	2314	2416	[lindex $InteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3331341	3314	3416	[lindex $InteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3431441	4314	4416	[lindex $InteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3531541	5314	5416	[lindex $InteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3631641	6314	6416	[lindex $ExteriorColumnStory3 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory3 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3734742	734	742	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 4 								
element	elasticBeamColumn	3141151	1414	1516	[lindex $ExteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3241251	2414	2516	[lindex $InteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3341351	3414	3516	[lindex $InteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3441451	4414	4516	[lindex $InteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3541551	5414	5516	[lindex $InteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3641651	6414	6516	[lindex $ExteriorColumnStory4 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory4 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3744752	744	752	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 5 								
element	elasticBeamColumn	3151161	1514	1616	[lindex $ExteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3251261	2514	2616	[lindex $InteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3351361	3514	3616	[lindex $InteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3451461	4514	4616	[lindex $InteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3551561	5514	5616	[lindex $InteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3651661	6514	6616	[lindex $ExteriorColumnStory5 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory5 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3754762	754	762	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 6 								
element	elasticBeamColumn	3161171	1614	1716	[lindex $ExteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3261271	2614	2716	[lindex $InteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3361371	3614	3716	[lindex $InteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3461471	4614	4716	[lindex $InteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3561571	5614	5716	[lindex $InteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3661671	6614	6716	[lindex $ExteriorColumnStory6 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory6 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3764772	764	772	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 7 								
element	elasticBeamColumn	3171181	1714	1816	[lindex $ExteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3271281	2714	2816	[lindex $InteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3371381	3714	3816	[lindex $InteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3471481	4714	4816	[lindex $InteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3571581	5714	5816	[lindex $InteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3671681	6714	6816	[lindex $ExteriorColumnStory7 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory7 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3774782	774	782	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 8 								
element	elasticBeamColumn	3181191	1814	1916	[lindex $ExteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3281291	2814	2916	[lindex $InteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3381391	3814	3916	[lindex $InteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3481491	4814	4916	[lindex $InteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3581591	5814	5916	[lindex $InteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3681691	6814	6916	[lindex $ExteriorColumnStory8 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory8 6]]	$PDeltaTransf; 
element	elasticBeamColumn	3784792	784	792	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 9 								
element	elasticBeamColumn	31911101	1914	11016	[lindex $ExteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	32912101	2914	21016	[lindex $InteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	33913101	3914	31016	[lindex $InteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	34914101	4914	41016	[lindex $InteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	35915101	5914	51016	[lindex $InteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	36916101	6914	61016	[lindex $ExteriorColumnStory9 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory9 6]]	$PDeltaTransf; 
element	elasticBeamColumn	37947102	794	7102	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 10 								
element	elasticBeamColumn	311011111	11014	11116	[lindex $ExteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321012111	21014	21116	[lindex $InteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331013111	31014	31116	[lindex $InteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341014111	41014	41116	[lindex $InteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351015111	51014	51116	[lindex $InteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361016111	61014	61116	[lindex $ExteriorColumnStory10 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory10 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371047112	7104	7112	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 11 								
element	elasticBeamColumn	311111121	11114	11216	[lindex $ExteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321112121	21114	21216	[lindex $InteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331113121	31114	31216	[lindex $InteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341114121	41114	41216	[lindex $InteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351115121	51114	51216	[lindex $InteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361116121	61114	61216	[lindex $ExteriorColumnStory11 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory11 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371147122	7114	7122	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 12 								
element	elasticBeamColumn	311211131	11214	11316	[lindex $ExteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321212131	21214	21316	[lindex $InteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331213131	31214	31316	[lindex $InteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341214131	41214	41316	[lindex $InteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351215131	51214	51316	[lindex $InteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361216131	61214	61316	[lindex $ExteriorColumnStory12 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory12 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371247132	7124	7132	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 13 								
element	elasticBeamColumn	311311141	11314	11416	[lindex $ExteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321312141	21314	21416	[lindex $InteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331313141	31314	31416	[lindex $InteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341314141	41314	41416	[lindex $InteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351315141	51314	51416	[lindex $InteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361316141	61314	61416	[lindex $ExteriorColumnStory13 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory13 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371347142	7134	7142	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 14 								
element	elasticBeamColumn	311411151	11414	11516	[lindex $ExteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321412151	21414	21516	[lindex $InteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331413151	31414	31516	[lindex $InteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341414151	41414	41516	[lindex $InteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351415151	51414	51516	[lindex $InteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361416151	61414	61516	[lindex $ExteriorColumnStory14 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory14 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371447152	7144	7152	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 15 								
element	elasticBeamColumn	311511161	11514	11616	[lindex $ExteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321512161	21514	21616	[lindex $InteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331513161	31514	31616	[lindex $InteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341514161	41514	41616	[lindex $InteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351515161	51514	51616	[lindex $InteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361516161	61514	61616	[lindex $ExteriorColumnStory15 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory15 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371547162	7154	7162	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 16 								
element	elasticBeamColumn	311611171	11614	11716	[lindex $ExteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321612171	21614	21716	[lindex $InteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331613171	31614	31716	[lindex $InteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341614171	41614	41716	[lindex $InteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351615171	51614	51716	[lindex $InteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361616171	61614	61716	[lindex $ExteriorColumnStory16 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory16 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371647172	7164	7172	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 17 								
element	elasticBeamColumn	311711181	11714	11816	[lindex $ExteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321712181	21714	21816	[lindex $InteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331713181	31714	31816	[lindex $InteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341714181	41714	41816	[lindex $InteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351715181	51714	51816	[lindex $InteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361716181	61714	61816	[lindex $ExteriorColumnStory17 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory17 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371747182	7174	7182	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 18 								
element	elasticBeamColumn	311811191	11814	11916	[lindex $ExteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321812191	21814	21916	[lindex $InteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331813191	31814	31916	[lindex $InteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341814191	41814	41916	[lindex $InteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351815191	51814	51916	[lindex $InteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361816191	61814	61916	[lindex $ExteriorColumnStory18 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory18 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371847192	7184	7192	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 
								
# Story 19 								
element	elasticBeamColumn	311911201	11914	12016	[lindex $ExteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	321912201	21914	22016	[lindex $InteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	331913201	31914	32016	[lindex $InteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	341914201	41914	42016	[lindex $InteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	351915201	51914	52016	[lindex $InteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $InteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	361916201	61914	62016	[lindex $ExteriorColumnStory19 2]	$Es	[expr ($n+1.0)/$n*[lindex $ExteriorColumnStory19 6]]	$PDeltaTransf; 
element	elasticBeamColumn	371947202	7194	7202	$AreaRigid	$Es	$IRigid	$PDeltaTransf; 

puts "Columns defined"

