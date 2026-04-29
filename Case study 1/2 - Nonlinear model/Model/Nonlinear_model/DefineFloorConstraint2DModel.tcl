# This file will be used to define floor constraint 
# Nodes at same floor level have identical lateral displacement


# Select the leaning column node as the master node.

set	ConstrainDOF	1;  # X-direction

# Level 2 
equalDOF	72	1211	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	72	2211	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	72	3211	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	72	4211	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	72	5211	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	72	6211	$ConstrainDOF; #Pier 6 to Leaning column

# Level 3 
equalDOF	73	1311	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	73	2311	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	73	3311	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	73	4311	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	73	5311	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	73	6311	$ConstrainDOF; #Pier 6 to Leaning column

# Level 4 
equalDOF	74	1411	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	74	2411	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	74	3411	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	74	4411	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	74	5411	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	74	6411	$ConstrainDOF; #Pier 6 to Leaning column

# Level 5 
equalDOF	75	1511	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	75	2511	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	75	3511	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	75	4511	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	75	5511	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	75	6511	$ConstrainDOF; #Pier 6 to Leaning column

# Level 6
equalDOF	76	1611	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	76	2611	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	76	3611	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	76	4611	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	76	5611	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	76	6611	$ConstrainDOF; #Pier 6 to Leaning column

# Level 7 
equalDOF	77	1711	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	77	2711	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	77	3711	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	77	4711	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	77	5711	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	77	6711	$ConstrainDOF; #Pier 6 to Leaning column

# Level 8 
equalDOF	78	1811	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	78	2811	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	78	3811	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	78	4811	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	78	5811	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	78	6811	$ConstrainDOF; #Pier 6 to Leaning column

# Level 9 
equalDOF	79	1911	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	79	2911	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	79	3911	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	79	4911	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	79	5911	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	79	6911	$ConstrainDOF; #Pier 6 to Leaning column

# Level 10 
equalDOF	710	11011	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	710	21011	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	710	31011	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	710	41011	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	710	51011	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	710	61011	$ConstrainDOF; #Pier 6 to Leaning column

# Level 11 
equalDOF	711	11111	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	711	21111	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	711	31111	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	711	41111	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	711	51111	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	711	61111	$ConstrainDOF; #Pier 6 to Leaning column

# Level 12 
equalDOF	712	11211	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	712	21211	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	712	31211	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	712	41211	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	712	51211	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	712	61211	$ConstrainDOF; #Pier 6 to Leaning column

# Level 13 
equalDOF	713	11311	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	713	21311	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	713	31311	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	713	41311	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	713	51311	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	713	61311	$ConstrainDOF; #Pier 6 to Leaning column

# Level 14 
equalDOF	714	11411	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	714	21411	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	714	31411	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	714	41411	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	714	51411	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	714	61411	$ConstrainDOF; #Pier 6 to Leaning column

# Level 15 
equalDOF	715	11511	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	715	21511	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	715	31511	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	715	41511	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	715	51511	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	715	61511	$ConstrainDOF; #Pier 6 to Leaning column

# Level 16 
equalDOF	716	11611	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	716	21611	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	716	31611	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	716	41611	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	716	51611	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	716	61611	$ConstrainDOF; #Pier 6 to Leaning column

# Level 17 
equalDOF	717	11711	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	717	21711	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	717	31711	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	717	41711	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	717	51711	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	717	61711	$ConstrainDOF; #Pier 6 to Leaning column

# Level 18 
equalDOF	718	11811	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	718	21811	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	718	31811	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	718	41811	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	718	51811	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	718	61811	$ConstrainDOF; #Pier 6 to Leaning column

# Level 19 
equalDOF	719	11911	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	719	21911	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	719	31911	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	719	41911	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	719	51911	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	719	61911	$ConstrainDOF; #Pier 6 to Leaning column

# Level 20 
equalDOF	720	12011	$ConstrainDOF; #Pier 1 to Leaning column
equalDOF 	720	22011	$ConstrainDOF; #Pier 2 to Leaning column
equalDOF	720	32011	$ConstrainDOF; #Pier 3 to Leaning column
equalDOF	720	42011	$ConstrainDOF; #Pier 4 to Leaning column
equalDOF	720	52011	$ConstrainDOF; #Pier 5 to Leaning column
equalDOF	720	62011	$ConstrainDOF; #Pier 6 to Leaning column

puts "Floor constraint defined"