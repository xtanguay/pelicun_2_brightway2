# Define beam section sizes 

set	BeamLevel2	[SectionProperty W36X210]; 
set	BeamLevel3	[SectionProperty W36X210]; 
set	BeamLevel4	[SectionProperty W36X194]; 
set	BeamLevel5	[SectionProperty W36X194]; 
set	BeamLevel6	[SectionProperty W36X170]; 
set	BeamLevel7	[SectionProperty W36X170]; 
set	BeamLevel8	[SectionProperty W36X170]; 
set	BeamLevel9	[SectionProperty W36X150]; 
set	BeamLevel10	[SectionProperty W36X150]; 
set	BeamLevel11	[SectionProperty W36X150]; 
set	BeamLevel12	[SectionProperty W33X130]; 
set	BeamLevel13	[SectionProperty W33X130]; 
set	BeamLevel14	[SectionProperty W33X130]; 
set	BeamLevel15	[SectionProperty W27X114]; 
set	BeamLevel16	[SectionProperty W27X114]; 
set	BeamLevel17	[SectionProperty W27X114]; 
set	BeamLevel18	[SectionProperty W21X57]; 
set	BeamLevel19	[SectionProperty W21X57]; 
set	BeamLevel20	[SectionProperty W21X57];


# Define exterior column section sizes 
set	ExteriorColumnStory1	[SectionProperty W36X441]; 
set	ExteriorColumnStory2	[SectionProperty W36X441]; 
set	ExteriorColumnStory3	[SectionProperty W36X441]; 
set	ExteriorColumnStory4	[SectionProperty W36X330]; 
set	ExteriorColumnStory5	[SectionProperty W36X330]; 
set	ExteriorColumnStory6	[SectionProperty W36X330]; 
set	ExteriorColumnStory7	[SectionProperty W36X282]; 
set	ExteriorColumnStory8	[SectionProperty W36X282]; 
set	ExteriorColumnStory9	[SectionProperty W36X282]; 
set	ExteriorColumnStory10	[SectionProperty W36X262]; 
set	ExteriorColumnStory11	[SectionProperty W36X262]; 
set	ExteriorColumnStory12	[SectionProperty W36X262]; 
set	ExteriorColumnStory13	[SectionProperty W33X201]; 
set	ExteriorColumnStory14	[SectionProperty W33X201]; 
set	ExteriorColumnStory15	[SectionProperty W33X201]; 
set	ExteriorColumnStory16	[SectionProperty W24X192]; 
set	ExteriorColumnStory17	[SectionProperty W24X192]; 
set	ExteriorColumnStory18	[SectionProperty W24X192]; 
set	ExteriorColumnStory19	[SectionProperty W24X192]; 


# Define interior column section sizes 
set	InteriorColumnStory1	[SectionProperty W36X395]; 
set	InteriorColumnStory2	[SectionProperty W36X395]; 
set	InteriorColumnStory3	[SectionProperty W36X395]; 
set	InteriorColumnStory4	[SectionProperty W36X302]; 
set	InteriorColumnStory5	[SectionProperty W36X302]; 
set	InteriorColumnStory6	[SectionProperty W36X302]; 
set	InteriorColumnStory7	[SectionProperty W36X262]; 
set	InteriorColumnStory8	[SectionProperty W36X262]; 
set	InteriorColumnStory9	[SectionProperty W36X262]; 
set	InteriorColumnStory10	[SectionProperty W36X232]; 
set	InteriorColumnStory11	[SectionProperty W36X232]; 
set	InteriorColumnStory12	[SectionProperty W36X232]; 
set	InteriorColumnStory13	[SectionProperty W33X221]; 
set	InteriorColumnStory14	[SectionProperty W33X221]; 
set	InteriorColumnStory15	[SectionProperty W33X221]; 
set	InteriorColumnStory16	[SectionProperty W27X194]; 
set	InteriorColumnStory17	[SectionProperty W27X194]; 
set	InteriorColumnStory18	[SectionProperty W27X194]; 
set	InteriorColumnStory19	[SectionProperty W27X194];


# Ensure the sections are appropriate (prints nothing if sections are appropriate): 
set Fy_MPa [expr $Fy*6.89476];

# Check beam classes :
check_class $BeamLevel2 $Fy_MPa
check_class $BeamLevel3 $Fy_MPa
check_class $BeamLevel4 $Fy_MPa
check_class $BeamLevel5 $Fy_MPa
check_class $BeamLevel6 $Fy_MPa
check_class $BeamLevel7 $Fy_MPa
check_class $BeamLevel8 $Fy_MPa
check_class $BeamLevel9 $Fy_MPa
check_class $BeamLevel10 $Fy_MPa
check_class $BeamLevel11 $Fy_MPa
check_class $BeamLevel12 $Fy_MPa
check_class $BeamLevel13 $Fy_MPa
check_class $BeamLevel14 $Fy_MPa
check_class $BeamLevel15 $Fy_MPa
check_class $BeamLevel16 $Fy_MPa
check_class $BeamLevel17 $Fy_MPa
check_class $BeamLevel18 $Fy_MPa
check_class $BeamLevel19 $Fy_MPa
check_class $BeamLevel20 $Fy_MPa

# Check Column classes : 
check_class $ExteriorColumnStory1 $Fy_MPa
check_class $ExteriorColumnStory2 $Fy_MPa
check_class $ExteriorColumnStory3 $Fy_MPa
check_class $ExteriorColumnStory4 $Fy_MPa
check_class $ExteriorColumnStory5 $Fy_MPa
check_class $ExteriorColumnStory6 $Fy_MPa
check_class $ExteriorColumnStory7 $Fy_MPa
check_class $ExteriorColumnStory8 $Fy_MPa
check_class $ExteriorColumnStory9 $Fy_MPa
check_class $ExteriorColumnStory10 $Fy_MPa
check_class $ExteriorColumnStory11 $Fy_MPa
check_class $ExteriorColumnStory12 $Fy_MPa
check_class $ExteriorColumnStory13 $Fy_MPa
check_class $ExteriorColumnStory14 $Fy_MPa
check_class $ExteriorColumnStory15 $Fy_MPa
check_class $ExteriorColumnStory16 $Fy_MPa
check_class $ExteriorColumnStory17 $Fy_MPa
check_class $ExteriorColumnStory18 $Fy_MPa
check_class $ExteriorColumnStory19 $Fy_MPa


check_class $InteriorColumnStory1 $Fy_MPa
check_class $InteriorColumnStory2 $Fy_MPa
check_class $InteriorColumnStory3 $Fy_MPa
check_class $InteriorColumnStory4 $Fy_MPa
check_class $InteriorColumnStory5 $Fy_MPa
check_class $InteriorColumnStory6 $Fy_MPa
check_class $InteriorColumnStory7 $Fy_MPa
check_class $InteriorColumnStory8 $Fy_MPa
check_class $InteriorColumnStory9 $Fy_MPa
check_class $InteriorColumnStory10 $Fy_MPa
check_class $InteriorColumnStory11 $Fy_MPa
check_class $InteriorColumnStory12 $Fy_MPa
check_class $InteriorColumnStory13 $Fy_MPa
check_class $InteriorColumnStory14 $Fy_MPa
check_class $InteriorColumnStory15 $Fy_MPa
check_class $InteriorColumnStory16 $Fy_MPa
check_class $InteriorColumnStory17 $Fy_MPa
check_class $InteriorColumnStory18 $Fy_MPa
check_class $InteriorColumnStory19 $Fy_MPa