# This file will be used to define all nodes 
# Units: inch 


# Set bay width and story height 
set	BayWidth	[expr 30.00*12]; 
set	FirstStory	[expr 26.00*12]; 
set	TypicalStory	[expr 13.00*12]; 


# Define nodes at corner of frames 
# Level 1 
node	111	[expr 0*$BayWidth]	[expr 0*$FirstStory];	 # Column #1 
node	211	[expr 1*$BayWidth]	[expr 0*$FirstStory];	 # Column #2 
node	311	[expr 2*$BayWidth]	[expr 0*$FirstStory];	 # Column #3 
node	411	[expr 3*$BayWidth]	[expr 0*$FirstStory];	 # Column #4 
node	511	[expr 4*$BayWidth]	[expr 0*$FirstStory];	 # Column #5 
node	611	[expr 5*$BayWidth]	[expr 0*$FirstStory];	 # Column #6 

# Level 2 
node	121	[expr 0*$BayWidth]	[expr 1*$FirstStory];	 # Column #1 
node	221	[expr 1*$BayWidth]	[expr 1*$FirstStory];	 # Column #2 
node	321	[expr 2*$BayWidth]	[expr 1*$FirstStory];	 # Column #3 
node	421	[expr 3*$BayWidth]	[expr 1*$FirstStory];	 # Column #4 
node	521	[expr 4*$BayWidth]	[expr 1*$FirstStory];	 # Column #5 
node	621	[expr 5*$BayWidth]	[expr 1*$FirstStory];	 # Column #6 

# Level 3 
node	131	[expr 0*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #1 
node	231	[expr 1*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #2 
node	331	[expr 2*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #3 
node	431	[expr 3*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #4 
node	531	[expr 4*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #5 
node	631	[expr 5*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	 # Column #6 

# Level 4 
node	141	[expr 0*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #1 
node	241	[expr 1*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #2 
node	341	[expr 2*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #3 
node	441	[expr 3*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #4 
node	541	[expr 4*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #5 
node	641	[expr 5*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	 # Column #6 

# Level 5 
node	151	[expr 0*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #1 
node	251	[expr 1*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #2 
node	351	[expr 2*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #3 
node	451	[expr 3*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #4 
node	551	[expr 4*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #5 
node	651	[expr 5*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	 # Column #6 

# Level 6 
node	161	[expr 0*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #1 
node	261	[expr 1*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #2 
node	361	[expr 2*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #3 
node	461	[expr 3*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #4 
node	561	[expr 4*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #5 
node	661	[expr 5*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	 # Column #6 

# Level 7 
node	171	[expr 0*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #1 
node	271	[expr 1*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #2 
node	371	[expr 2*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #3 
node	471	[expr 3*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #4 
node	571	[expr 4*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #5 
node	671	[expr 5*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	 # Column #6 

# Level 8 
node	181	[expr 0*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #1 
node	281	[expr 1*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #2 
node	381	[expr 2*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #3 
node	481	[expr 3*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #4 
node	581	[expr 4*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #5 
node	681	[expr 5*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	 # Column #6 

# Level 9 
node	191	[expr 0*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #1 
node	291	[expr 1*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #2 
node	391	[expr 2*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #3 
node	491	[expr 3*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #4 
node	591	[expr 4*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #5 
node	691	[expr 5*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	 # Column #6 

# Level 10 
node	1101	[expr 0*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #1 
node	2101	[expr 1*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #2 
node	3101	[expr 2*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #3 
node	4101	[expr 3*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #4 
node	5101	[expr 4*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #5 
node	6101	[expr 5*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	 # Column #6 

# Level 11 
node	1111	[expr 0*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #1 
node	2111	[expr 1*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #2 
node	3111	[expr 2*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #3 
node	4111	[expr 3*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #4 
node	5111	[expr 4*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #5 
node	6111	[expr 5*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	 # Column #6 

# Level 12 
node	1121	[expr 0*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #1 
node	2121	[expr 1*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #2 
node	3121	[expr 2*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #3 
node	4121	[expr 3*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #4 
node	5121	[expr 4*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #5 
node	6121	[expr 5*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	 # Column #6 

# Level 13 
node	1131	[expr 0*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #1 
node	2131	[expr 1*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #2 
node	3131	[expr 2*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #3 
node	4131	[expr 3*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #4 
node	5131	[expr 4*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #5 
node	6131	[expr 5*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	 # Column #6 

# Level 14 
node	1141	[expr 0*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #1 
node	2141	[expr 1*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #2 
node	3141	[expr 2*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #3 
node	4141	[expr 3*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #4 
node	5141	[expr 4*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #5 
node	6141	[expr 5*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	 # Column #6 

# Level 15 
node	1151	[expr 0*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #1 
node	2151	[expr 1*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #2 
node	3151	[expr 2*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #3 
node	4151	[expr 3*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #4 
node	5151	[expr 4*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #5 
node	6151	[expr 5*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	 # Column #6 

# Level 16 
node	1161	[expr 0*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #1 
node	2161	[expr 1*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #2 
node	3161	[expr 2*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #3 
node	4161	[expr 3*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #4 
node	5161	[expr 4*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #5 
node	6161	[expr 5*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	 # Column #6 

# Level 17 
node	1171	[expr 0*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #1 
node	2171	[expr 1*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #2 
node	3171	[expr 2*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #3 
node	4171	[expr 3*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #4 
node	5171	[expr 4*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #5 
node	6171	[expr 5*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	 # Column #6 

# Level 18 
node	1181	[expr 0*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #1 
node	2181	[expr 1*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #2 
node	3181	[expr 2*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #3 
node	4181	[expr 3*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #4 
node	5181	[expr 4*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #5 
node	6181	[expr 5*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	 # Column #6 

# Level 19 
node	1191	[expr 0*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #1 
node	2191	[expr 1*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #2 
node	3191	[expr 2*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #3 
node	4191	[expr 3*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #4 
node	5191	[expr 4*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #5 
node	6191	[expr 5*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	 # Column #6 

# Level 20 
node	1201	[expr 0*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #1 
node	2201	[expr 1*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #2 
node	3201	[expr 2*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #3 
node	4201	[expr 3*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #4 
node	5201	[expr 4*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #5 
node	6201	[expr 5*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	 # Column #6 

# puts "Nodes at frame corner defined" 

# Define nodes for leaning column 
node	71	[expr 6*$BayWidth]	[expr 0*$FirstStory]; 	# Level 1
node	72	[expr 6*$BayWidth]	[expr 1*$FirstStory]; 	# Level 2
node	73	[expr 6*$BayWidth]	[expr 1*$FirstStory+1*$TypicalStory];	# Level 3
node	74	[expr 6*$BayWidth]	[expr 1*$FirstStory+2*$TypicalStory];	# Level 4
node	75	[expr 6*$BayWidth]	[expr 1*$FirstStory+3*$TypicalStory];	# Level 5
node	76	[expr 6*$BayWidth]	[expr 1*$FirstStory+4*$TypicalStory];	# Level 6
node	77	[expr 6*$BayWidth]	[expr 1*$FirstStory+5*$TypicalStory];	# Level 7
node	78	[expr 6*$BayWidth]	[expr 1*$FirstStory+6*$TypicalStory];	# Level 8
node	79	[expr 6*$BayWidth]	[expr 1*$FirstStory+7*$TypicalStory];	# Level 9
node	710	[expr 6*$BayWidth]	[expr 1*$FirstStory+8*$TypicalStory];	# Level 10
node	711	[expr 6*$BayWidth]	[expr 1*$FirstStory+9*$TypicalStory];	# Level 11
node	712	[expr 6*$BayWidth]	[expr 1*$FirstStory+10*$TypicalStory];	# Level 12
node	713	[expr 6*$BayWidth]	[expr 1*$FirstStory+11*$TypicalStory];	# Level 13
node	714	[expr 6*$BayWidth]	[expr 1*$FirstStory+12*$TypicalStory];	# Level 14
node	715	[expr 6*$BayWidth]	[expr 1*$FirstStory+13*$TypicalStory];	# Level 15
node	716	[expr 6*$BayWidth]	[expr 1*$FirstStory+14*$TypicalStory];	# Level 16
node	717	[expr 6*$BayWidth]	[expr 1*$FirstStory+15*$TypicalStory];	# Level 17
node	718	[expr 6*$BayWidth]	[expr 1*$FirstStory+16*$TypicalStory];	# Level 18
node	719	[expr 6*$BayWidth]	[expr 1*$FirstStory+17*$TypicalStory];	# Level 19
node	720	[expr 6*$BayWidth]	[expr 1*$FirstStory+18*$TypicalStory];	# Level 20

# puts "Nodes for leaning column defined" 

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

# puts "Extra nodes for leaning column springs defined"