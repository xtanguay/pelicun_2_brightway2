# This file will be used to define all nodes 
# Units: inch


# Set bay width and story height
set	BayWidth	[expr 30.00*12]; 
set	FirstStory	[expr 26.00*12]; 
set	TypicalStory	[expr 13.00*12]; 

# Set panel zone size as column depth and beam depth
# Level 1 
set	PanelSizeLevel1Column1	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
set	PanelSizeLevel1Column2	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
set	PanelSizeLevel1Column3	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
set	PanelSizeLevel1Column4	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
set	PanelSizeLevel1Column5	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
set	PanelSizeLevel1Column6	[list 0 0];# No panel zone on ground floor so using [0, 0] is okay
# Level 2 
set	PanelSizeLevel2Column1	[list [lindex $ExteriorColumnStory1 1] [lindex $BeamLevel2 1]];
set	PanelSizeLevel2Column2	[list [lindex $InteriorColumnStory1 1] [lindex $BeamLevel2 1]];
set	PanelSizeLevel2Column3	[list [lindex $InteriorColumnStory1 1] [lindex $BeamLevel2 1]];
set	PanelSizeLevel2Column4	[list [lindex $InteriorColumnStory1 1] [lindex $BeamLevel2 1]];
set	PanelSizeLevel2Column5	[list [lindex $InteriorColumnStory1 1] [lindex $BeamLevel2 1]];
set	PanelSizeLevel2Column6	[list [lindex $ExteriorColumnStory1 1] [lindex $BeamLevel2 1]];

# Level 3 
set	PanelSizeLevel3Column1	[list [lindex $ExteriorColumnStory2 1] [lindex $BeamLevel3 1]];
set	PanelSizeLevel3Column2	[list [lindex $InteriorColumnStory2 1] [lindex $BeamLevel3 1]];
set	PanelSizeLevel3Column3	[list [lindex $InteriorColumnStory2 1] [lindex $BeamLevel3 1]];
set	PanelSizeLevel3Column4	[list [lindex $InteriorColumnStory2 1] [lindex $BeamLevel3 1]];
set	PanelSizeLevel3Column5	[list [lindex $InteriorColumnStory2 1] [lindex $BeamLevel3 1]];
set	PanelSizeLevel3Column6	[list [lindex $ExteriorColumnStory2 1] [lindex $BeamLevel3 1]];
# Level 4 
set	PanelSizeLevel4Column1	[list [lindex $ExteriorColumnStory3 1] [lindex $BeamLevel4 1]];
set	PanelSizeLevel4Column2	[list [lindex $InteriorColumnStory3 1] [lindex $BeamLevel4 1]];
set	PanelSizeLevel4Column3	[list [lindex $InteriorColumnStory3 1] [lindex $BeamLevel4 1]];
set	PanelSizeLevel4Column4	[list [lindex $InteriorColumnStory3 1] [lindex $BeamLevel4 1]];
set	PanelSizeLevel4Column5	[list [lindex $InteriorColumnStory3 1] [lindex $BeamLevel4 1]];
set	PanelSizeLevel4Column6	[list [lindex $ExteriorColumnStory3 1] [lindex $BeamLevel4 1]];
# Level 5 
set	PanelSizeLevel5Column1	[list [lindex $ExteriorColumnStory4 1] [lindex $BeamLevel5 1]];
set	PanelSizeLevel5Column2	[list [lindex $InteriorColumnStory4 1] [lindex $BeamLevel5 1]];
set	PanelSizeLevel5Column3	[list [lindex $InteriorColumnStory4 1] [lindex $BeamLevel5 1]];
set	PanelSizeLevel5Column4	[list [lindex $InteriorColumnStory4 1] [lindex $BeamLevel5 1]];
set	PanelSizeLevel5Column5	[list [lindex $InteriorColumnStory4 1] [lindex $BeamLevel5 1]];
set	PanelSizeLevel5Column6	[list [lindex $ExteriorColumnStory4 1] [lindex $BeamLevel5 1]];
# Level 6 
set	PanelSizeLevel6Column1	[list [lindex $ExteriorColumnStory5 1] [lindex $BeamLevel6 1]];
set	PanelSizeLevel6Column2	[list [lindex $InteriorColumnStory5 1] [lindex $BeamLevel6 1]];
set	PanelSizeLevel6Column3	[list [lindex $InteriorColumnStory5 1] [lindex $BeamLevel6 1]];
set	PanelSizeLevel6Column4	[list [lindex $InteriorColumnStory5 1] [lindex $BeamLevel6 1]];
set	PanelSizeLevel6Column5	[list [lindex $InteriorColumnStory5 1] [lindex $BeamLevel6 1]];
set	PanelSizeLevel6Column6	[list [lindex $ExteriorColumnStory5 1] [lindex $BeamLevel6 1]];
# Level 7 
set	PanelSizeLevel7Column1	[list [lindex $ExteriorColumnStory6 1] [lindex $BeamLevel7 1]];
set	PanelSizeLevel7Column2	[list [lindex $InteriorColumnStory6 1] [lindex $BeamLevel7 1]];
set	PanelSizeLevel7Column3	[list [lindex $InteriorColumnStory6 1] [lindex $BeamLevel7 1]];
set	PanelSizeLevel7Column4	[list [lindex $InteriorColumnStory6 1] [lindex $BeamLevel7 1]];
set	PanelSizeLevel7Column5	[list [lindex $InteriorColumnStory6 1] [lindex $BeamLevel7 1]];
set	PanelSizeLevel7Column6	[list [lindex $ExteriorColumnStory6 1] [lindex $BeamLevel7 1]];
# Level 8 
set	PanelSizeLevel8Column1	[list [lindex $ExteriorColumnStory7 1] [lindex $BeamLevel8 1]];
set	PanelSizeLevel8Column2	[list [lindex $InteriorColumnStory7 1] [lindex $BeamLevel8 1]];
set	PanelSizeLevel8Column3	[list [lindex $InteriorColumnStory7 1] [lindex $BeamLevel8 1]];
set	PanelSizeLevel8Column4	[list [lindex $InteriorColumnStory7 1] [lindex $BeamLevel8 1]];
set	PanelSizeLevel8Column5	[list [lindex $InteriorColumnStory7 1] [lindex $BeamLevel8 1]];
set	PanelSizeLevel8Column6	[list [lindex $ExteriorColumnStory7 1] [lindex $BeamLevel8 1]];
# Level 9 
set	PanelSizeLevel9Column1	[list [lindex $ExteriorColumnStory8 1] [lindex $BeamLevel9 1]];
set	PanelSizeLevel9Column2	[list [lindex $InteriorColumnStory8 1] [lindex $BeamLevel9 1]];
set	PanelSizeLevel9Column3	[list [lindex $InteriorColumnStory8 1] [lindex $BeamLevel9 1]];
set	PanelSizeLevel9Column4	[list [lindex $InteriorColumnStory8 1] [lindex $BeamLevel9 1]];
set	PanelSizeLevel9Column5	[list [lindex $InteriorColumnStory8 1] [lindex $BeamLevel9 1]];
set	PanelSizeLevel9Column6	[list [lindex $ExteriorColumnStory8 1] [lindex $BeamLevel9 1]];
# Level 10 
set	PanelSizeLevel10Column1	[list [lindex $ExteriorColumnStory9 1] [lindex $BeamLevel10 1]];
set	PanelSizeLevel10Column2	[list [lindex $InteriorColumnStory9 1] [lindex $BeamLevel10 1]];
set	PanelSizeLevel10Column3	[list [lindex $InteriorColumnStory9 1] [lindex $BeamLevel10 1]];
set	PanelSizeLevel10Column4	[list [lindex $InteriorColumnStory9 1] [lindex $BeamLevel10 1]];
set	PanelSizeLevel10Column5	[list [lindex $InteriorColumnStory9 1] [lindex $BeamLevel10 1]];
set	PanelSizeLevel10Column6	[list [lindex $ExteriorColumnStory9 1] [lindex $BeamLevel10 1]];
# Level 11 
set	PanelSizeLevel11Column1	[list [lindex $ExteriorColumnStory10 1] [lindex $BeamLevel11 1]];
set	PanelSizeLevel11Column2	[list [lindex $InteriorColumnStory10 1] [lindex $BeamLevel11 1]];
set	PanelSizeLevel11Column3	[list [lindex $InteriorColumnStory10 1] [lindex $BeamLevel11 1]];
set	PanelSizeLevel11Column4	[list [lindex $InteriorColumnStory10 1] [lindex $BeamLevel11 1]];
set	PanelSizeLevel11Column5	[list [lindex $InteriorColumnStory10 1] [lindex $BeamLevel11 1]];
set	PanelSizeLevel11Column6	[list [lindex $ExteriorColumnStory10 1] [lindex $BeamLevel11 1]];
# Level 12 
set	PanelSizeLevel12Column1	[list [lindex $ExteriorColumnStory11 1] [lindex $BeamLevel12 1]];
set	PanelSizeLevel12Column2	[list [lindex $InteriorColumnStory11 1] [lindex $BeamLevel12 1]];
set	PanelSizeLevel12Column3	[list [lindex $InteriorColumnStory11 1] [lindex $BeamLevel12 1]];
set	PanelSizeLevel12Column4	[list [lindex $InteriorColumnStory11 1] [lindex $BeamLevel12 1]];
set	PanelSizeLevel12Column5	[list [lindex $InteriorColumnStory11 1] [lindex $BeamLevel12 1]];
set	PanelSizeLevel12Column6	[list [lindex $ExteriorColumnStory11 1] [lindex $BeamLevel12 1]];
# Level 13 
set	PanelSizeLevel13Column1	[list [lindex $ExteriorColumnStory12 1] [lindex $BeamLevel13 1]];
set	PanelSizeLevel13Column2	[list [lindex $InteriorColumnStory12 1] [lindex $BeamLevel13 1]];
set	PanelSizeLevel13Column3	[list [lindex $InteriorColumnStory12 1] [lindex $BeamLevel13 1]];
set	PanelSizeLevel13Column4	[list [lindex $InteriorColumnStory12 1] [lindex $BeamLevel13 1]];
set	PanelSizeLevel13Column5	[list [lindex $InteriorColumnStory12 1] [lindex $BeamLevel13 1]];
set	PanelSizeLevel13Column6	[list [lindex $ExteriorColumnStory12 1] [lindex $BeamLevel13 1]];
# Level 14 
set	PanelSizeLevel14Column1	[list [lindex $ExteriorColumnStory13 1] [lindex $BeamLevel14 1]];
set	PanelSizeLevel14Column2	[list [lindex $InteriorColumnStory13 1] [lindex $BeamLevel14 1]];
set	PanelSizeLevel14Column3	[list [lindex $InteriorColumnStory13 1] [lindex $BeamLevel14 1]];
set	PanelSizeLevel14Column4	[list [lindex $InteriorColumnStory13 1] [lindex $BeamLevel14 1]];
set	PanelSizeLevel14Column5	[list [lindex $InteriorColumnStory13 1] [lindex $BeamLevel14 1]];
set	PanelSizeLevel14Column6	[list [lindex $ExteriorColumnStory13 1] [lindex $BeamLevel14 1]];
# Level 15 
set	PanelSizeLevel15Column1	[list [lindex $ExteriorColumnStory14 1] [lindex $BeamLevel15 1]];
set	PanelSizeLevel15Column2	[list [lindex $InteriorColumnStory14 1] [lindex $BeamLevel15 1]];
set	PanelSizeLevel15Column3	[list [lindex $InteriorColumnStory14 1] [lindex $BeamLevel15 1]];
set	PanelSizeLevel15Column4	[list [lindex $InteriorColumnStory14 1] [lindex $BeamLevel15 1]];
set	PanelSizeLevel15Column5	[list [lindex $InteriorColumnStory14 1] [lindex $BeamLevel15 1]];
set	PanelSizeLevel15Column6	[list [lindex $ExteriorColumnStory14 1] [lindex $BeamLevel15 1]];
# Level 16 
set	PanelSizeLevel16Column1	[list [lindex $ExteriorColumnStory15 1] [lindex $BeamLevel16 1]];
set	PanelSizeLevel16Column2	[list [lindex $InteriorColumnStory15 1] [lindex $BeamLevel16 1]];
set	PanelSizeLevel16Column3	[list [lindex $InteriorColumnStory15 1] [lindex $BeamLevel16 1]];
set	PanelSizeLevel16Column4	[list [lindex $InteriorColumnStory15 1] [lindex $BeamLevel16 1]];
set	PanelSizeLevel16Column5	[list [lindex $InteriorColumnStory15 1] [lindex $BeamLevel16 1]];
set	PanelSizeLevel16Column6	[list [lindex $ExteriorColumnStory15 1] [lindex $BeamLevel16 1]];
# Level 17 
set	PanelSizeLevel17Column1	[list [lindex $ExteriorColumnStory16 1] [lindex $BeamLevel17 1]];
set	PanelSizeLevel17Column2	[list [lindex $InteriorColumnStory16 1] [lindex $BeamLevel17 1]];
set	PanelSizeLevel17Column3	[list [lindex $InteriorColumnStory16 1] [lindex $BeamLevel17 1]];
set	PanelSizeLevel17Column4	[list [lindex $InteriorColumnStory16 1] [lindex $BeamLevel17 1]];
set	PanelSizeLevel17Column5	[list [lindex $InteriorColumnStory16 1] [lindex $BeamLevel17 1]];
set	PanelSizeLevel17Column6	[list [lindex $ExteriorColumnStory16 1] [lindex $BeamLevel17 1]];
# Level 18 
set	PanelSizeLevel18Column1	[list [lindex $ExteriorColumnStory17 1] [lindex $BeamLevel18 1]];
set	PanelSizeLevel18Column2	[list [lindex $InteriorColumnStory17 1] [lindex $BeamLevel18 1]];
set	PanelSizeLevel18Column3	[list [lindex $InteriorColumnStory17 1] [lindex $BeamLevel18 1]];
set	PanelSizeLevel18Column4	[list [lindex $InteriorColumnStory17 1] [lindex $BeamLevel18 1]];
set	PanelSizeLevel18Column5	[list [lindex $InteriorColumnStory17 1] [lindex $BeamLevel18 1]];
set	PanelSizeLevel18Column6	[list [lindex $ExteriorColumnStory17 1] [lindex $BeamLevel18 1]];
# Level 19 
set	PanelSizeLevel19Column1	[list [lindex $ExteriorColumnStory18 1] [lindex $BeamLevel19 1]];
set	PanelSizeLevel19Column2	[list [lindex $InteriorColumnStory18 1] [lindex $BeamLevel19 1]];
set	PanelSizeLevel19Column3	[list [lindex $InteriorColumnStory18 1] [lindex $BeamLevel19 1]];
set	PanelSizeLevel19Column4	[list [lindex $InteriorColumnStory18 1] [lindex $BeamLevel19 1]];
set	PanelSizeLevel19Column5	[list [lindex $InteriorColumnStory18 1] [lindex $BeamLevel19 1]];
set	PanelSizeLevel19Column6	[list [lindex $ExteriorColumnStory18 1] [lindex $BeamLevel19 1]];
# Level 20 
set	PanelSizeLevel20Column1	[list [lindex $ExteriorColumnStory19 1] [lindex $BeamLevel20 1]];
set	PanelSizeLevel20Column2	[list [lindex $InteriorColumnStory19 1] [lindex $BeamLevel20 1]];
set	PanelSizeLevel20Column3	[list [lindex $InteriorColumnStory19 1] [lindex $BeamLevel20 1]];
set	PanelSizeLevel20Column4	[list [lindex $InteriorColumnStory19 1] [lindex $BeamLevel20 1]];
set	PanelSizeLevel20Column5	[list [lindex $InteriorColumnStory19 1] [lindex $BeamLevel20 1]];
set	PanelSizeLevel20Column6	[list [lindex $ExteriorColumnStory19 1] [lindex $BeamLevel20 1]];


# Set max number of columns (excluding leaning column) and floors (counting 1 for ground)
set	MaximumFloor	20; 
set	MaximumCol	6; 

# Define nodes for the frame 
# Level 1 
NodesAroundPanelZone	1	1	[expr 0*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	1	[expr 1*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	1	[expr 2*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	1	[expr 3*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	1	[expr 4*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	1	[expr 5*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory]	$PanelSizeLevel1Column6	$MaximumFloor	$MaximumCol; 
# Level 2 
NodesAroundPanelZone	1	2	[expr 0*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	2	[expr 1*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	2	[expr 2*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	2	[expr 3*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	2	[expr 4*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	2	[expr 5*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory]	$PanelSizeLevel2Column6	$MaximumFloor	$MaximumCol; 
# Level 3 
NodesAroundPanelZone	1	3	[expr 0*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	3	[expr 1*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	3	[expr 2*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	3	[expr 3*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	3	[expr 4*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	3	[expr 5*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory]	$PanelSizeLevel3Column6	$MaximumFloor	$MaximumCol; 
# Level 4 
NodesAroundPanelZone	1	4	[expr 0*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	4	[expr 1*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	4	[expr 2*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	4	[expr 3*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	4	[expr 4*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	4	[expr 5*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory]	$PanelSizeLevel4Column6	$MaximumFloor	$MaximumCol; 
# Level 5 
NodesAroundPanelZone	1	5	[expr 0*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	5	[expr 1*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	5	[expr 2*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	5	[expr 3*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	5	[expr 4*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	5	[expr 5*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory]	$PanelSizeLevel5Column6	$MaximumFloor	$MaximumCol; 
# Level 6 
NodesAroundPanelZone	1	6	[expr 0*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	6	[expr 1*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	6	[expr 2*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	6	[expr 3*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	6	[expr 4*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	6	[expr 5*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory]	$PanelSizeLevel6Column6	$MaximumFloor	$MaximumCol; 
# Level 7 
NodesAroundPanelZone	1	7	[expr 0*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	7	[expr 1*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	7	[expr 2*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	7	[expr 3*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	7	[expr 4*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	7	[expr 5*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory]	$PanelSizeLevel7Column6	$MaximumFloor	$MaximumCol; 
# Level 8 
NodesAroundPanelZone	1	8	[expr 0*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	8	[expr 1*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	8	[expr 2*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	8	[expr 3*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	8	[expr 4*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	8	[expr 5*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory]	$PanelSizeLevel8Column6	$MaximumFloor	$MaximumCol; 
# Level 9 
NodesAroundPanelZone	1	9	[expr 0*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	9	[expr 1*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	9	[expr 2*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	9	[expr 3*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	9	[expr 4*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	9	[expr 5*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory]	$PanelSizeLevel9Column6	$MaximumFloor	$MaximumCol; 
# Level 10 
NodesAroundPanelZone	1	10	[expr 0*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	10	[expr 1*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	10	[expr 2*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	10	[expr 3*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	10	[expr 4*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	10	[expr 5*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory]	$PanelSizeLevel10Column6	$MaximumFloor	$MaximumCol; 
# Level 11 
NodesAroundPanelZone	1	11	[expr 0*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	11	[expr 1*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	11	[expr 2*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	11	[expr 3*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	11	[expr 4*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	11	[expr 5*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory]	$PanelSizeLevel11Column6	$MaximumFloor	$MaximumCol; 
# Level 12 
NodesAroundPanelZone	1	12	[expr 0*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	12	[expr 1*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	12	[expr 2*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	12	[expr 3*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	12	[expr 4*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	12	[expr 5*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory]	$PanelSizeLevel12Column6	$MaximumFloor	$MaximumCol; 
# Level 13 
NodesAroundPanelZone	1	13	[expr 0*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	13	[expr 1*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	13	[expr 2*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	13	[expr 3*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	13	[expr 4*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	13	[expr 5*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory]	$PanelSizeLevel13Column6	$MaximumFloor	$MaximumCol; 
# Level 14 
NodesAroundPanelZone	1	14	[expr 0*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	14	[expr 1*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	14	[expr 2*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	14	[expr 3*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	14	[expr 4*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	14	[expr 5*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory]	$PanelSizeLevel14Column6	$MaximumFloor	$MaximumCol; 
# Level 15 
NodesAroundPanelZone	1	15	[expr 0*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	15	[expr 1*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	15	[expr 2*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	15	[expr 3*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	15	[expr 4*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	15	[expr 5*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory]	$PanelSizeLevel15Column6	$MaximumFloor	$MaximumCol; 
# Level 16 
NodesAroundPanelZone	1	16	[expr 0*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	16	[expr 1*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	16	[expr 2*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	16	[expr 3*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	16	[expr 4*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	16	[expr 5*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory]	$PanelSizeLevel16Column6	$MaximumFloor	$MaximumCol; 
# Level 17 
NodesAroundPanelZone	1	17	[expr 0*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	17	[expr 1*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	17	[expr 2*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	17	[expr 3*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	17	[expr 4*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	17	[expr 5*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory]	$PanelSizeLevel17Column6	$MaximumFloor	$MaximumCol; 
# Level 18 
NodesAroundPanelZone	1	18	[expr 0*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	18	[expr 1*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	18	[expr 2*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	18	[expr 3*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	18	[expr 4*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	18	[expr 5*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory]	$PanelSizeLevel18Column6	$MaximumFloor	$MaximumCol; 
# Level 19 
NodesAroundPanelZone	1	19	[expr 0*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	19	[expr 1*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	19	[expr 2*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	19	[expr 3*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	19	[expr 4*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	19	[expr 5*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory]	$PanelSizeLevel19Column6	$MaximumFloor	$MaximumCol; 
# Level 20 
NodesAroundPanelZone	1	20	[expr 0*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column1	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	2	20	[expr 1*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column2	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	3	20	[expr 2*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column3	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	4	20	[expr 3*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column4	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	5	20	[expr 4*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column5	$MaximumFloor	$MaximumCol; 
NodesAroundPanelZone	6	20	[expr 5*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory]	$PanelSizeLevel20Column6	$MaximumFloor	$MaximumCol; 

puts "Nodes for frame defined" 

# Define nodes for leaning column 
node	 71	[expr 6*$BayWidth]	[expr 0*$FirstStory+0*$TypicalStory];	#Level 1
node	 72	[expr 6*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory];	#Level 2
node	 73	[expr 6*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	# Level 3
node	 74	[expr 6*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	# Level 4
node	 75	[expr 6*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	# Level 5
node	 76	[expr 6*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	# Level 6
node	 77	[expr 6*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	# Level 7
node	 78	[expr 6*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	# Level 8
node	 79	[expr 6*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	# Level 9
node	 710	[expr 6*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	# Level 10
node	 711	[expr 6*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	# Level 11
node	 712	[expr 6*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	# Level 12
node	 713	[expr 6*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	# Level 13
node	 714	[expr 6*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	# Level 14
node	 715	[expr 6*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	# Level 15
node	 716	[expr 6*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	# Level 16
node	 717	[expr 6*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	# Level 17
node	 718	[expr 6*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	# Level 18
node	 719	[expr 6*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	# Level 19
node	 720	[expr 6*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	# Level 20

puts "Nodes for leaning column defined" 

# Define extra nodes needed to define leaning column springs 
node	722	[expr 6*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory];	# Node below floor level 2
node	724	[expr 6*$BayWidth]	[expr 1*$FirstStory+0*$TypicalStory];	# Node above floor level 2
node	732	[expr 6*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	# Node below floor level 3
node	734	[expr 6*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	# Node above floor level 3
node	742	[expr 6*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	# Node below floor level 4
node	744	[expr 6*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	# Node above floor level 4
node	752	[expr 6*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	# Node below floor level 5
node	754	[expr 6*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	# Node above floor level 5
node	762	[expr 6*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	# Node below floor level 6
node	764	[expr 6*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	# Node above floor level 6
node	772	[expr 6*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	# Node below floor level 7
node	774	[expr 6*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	# Node above floor level 7
node	782	[expr 6*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	# Node below floor level 8
node	784	[expr 6*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	# Node above floor level 8
node	792	[expr 6*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	# Node below floor level 9
node	794	[expr 6*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	# Node above floor level 9
node	7102	[expr 6*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	# Node below floor level 10
node	7104	[expr 6*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	# Node above floor level 10
node	7112	[expr 6*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	# Node below floor level 11
node	7114	[expr 6*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	# Node above floor level 11
node	7122	[expr 6*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	# Node below floor level 12
node	7124	[expr 6*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	# Node above floor level 12
node	7132	[expr 6*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	# Node below floor level 13
node	7134	[expr 6*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	# Node above floor level 13
node	7142	[expr 6*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	# Node below floor level 14
node	7144	[expr 6*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	# Node above floor level 14
node	7152	[expr 6*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	# Node below floor level 15
node	7154	[expr 6*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	# Node above floor level 15
node	7162	[expr 6*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	# Node below floor level 16
node	7164	[expr 6*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	# Node above floor level 16
node	7172	[expr 6*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	# Node below floor level 17
node	7174	[expr 6*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	# Node above floor level 17
node	7182	[expr 6*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	# Node below floor level 18
node	7184	[expr 6*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	# Node above floor level 18
node	7192	[expr 6*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	# Node below floor level 19
node	7194	[expr 6*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	# Node above floor level 19
node	7202	[expr 6*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	# Node below floor level 20

puts "Extra nodes for leaning column springs defined"

# Define relevant nodes for story drift checks : 
set SDR_nodes {
	72
	73
	74
	75
	76
	77
	78
	79
	710
	711
	712
	713
	714
	715
	716
	717
	718
	719
	720
} ; 

set num_storeys [llength $SDR_nodes] ; 

set H_storeys {}
	lappend H_storeys [expr 1*$FirstStory+0*$TypicalStory-(0*$FirstStory+0*$TypicalStory)] ; 
	lappend H_storeys [expr 1*$FirstStory+1*$TypicalStory-(1*$FirstStory+0*$TypicalStory)] ; 
	lappend H_storeys [expr 1*$FirstStory+2*$TypicalStory-(1*$FirstStory+1*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+3*$TypicalStory-(1*$FirstStory+2*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+4*$TypicalStory-(1*$FirstStory+3*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+5*$TypicalStory-(1*$FirstStory+4*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+6*$TypicalStory-(1*$FirstStory+5*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+7*$TypicalStory-(1*$FirstStory+6*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+8*$TypicalStory-(1*$FirstStory+7*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+9*$TypicalStory-(1*$FirstStory+8*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+10*$TypicalStory-(1*$FirstStory+9*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+11*$TypicalStory-(1*$FirstStory+10*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+12*$TypicalStory-(1*$FirstStory+11*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+13*$TypicalStory-(1*$FirstStory+12*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+14*$TypicalStory-(1*$FirstStory+13*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+15*$TypicalStory-(1*$FirstStory+14*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+16*$TypicalStory-(1*$FirstStory+15*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+17*$TypicalStory-(1*$FirstStory+16*$TypicalStory)];
	lappend H_storeys [expr 1*$FirstStory+18*$TypicalStory-(1*$FirstStory+17*$TypicalStory)];

puts "Story drift nodes and heights identified." ;


