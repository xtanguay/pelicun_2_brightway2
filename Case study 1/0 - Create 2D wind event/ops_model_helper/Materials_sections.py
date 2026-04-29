# -*- coding: utf-8 -*-
"""
Created on Fri Aug 16 09:15:56 2024

@author: xtang
"""

import openseespy.opensees as ops
import opsvis
import matplotlib.pyplot as plt

class Materials_sections():
   def add_materials(): 
      """
      Define the materials which are to be included in the assessment (their properties, behavior post-yield point, etc.) 
      
      """


       ###############################
       # FIX UNIT DISCREPANCIES--- MODEL IN METERS, MPa = N/mm2
       #################################



      MPa = 1

      # Elements covered by this material : BEAMS AND COLUMNS

      # Steel01 : bilinear steel
      # matTag  : Unique identifier for this material
      # Fy      : Yield stress
      # E0      : Young modulus before yield stress    
      # b       : Strain-hardening ratio (ratio between post-yield modulus and Young modulus before yield point)
      # a1      : isotropic hardening parameter, increase of compression yield envelope as proportion of yield strength after plastic strain of a2*(Fy/E0)
      # a2      : See a1
      # a3      : Same as a1, but for tensile yield envelope, using a4*(Fy/E0)
      # a4      : See a3.     
       
                           #mat_name,   matTag,          Fy,           E0,      b,   a1,   a2,  a3,  a4
      ops.uniaxialMaterial('Steel01',       1,      350*MPa,      2E5*MPa,   1E-2,     0,    1,  0,   1)
       
      # Elements covered by this material : Default material (no yielding expected)
       
      # Elastic : Elastic uniaxial material
      # matTag  : Unique identifier for this material
      # E       : Young modulus
      # eta     : damping tangent 
      # Eneg    : tangent in compression
       
                           #mat_name,   matTag,       E,   eta,   Eneg
      ops.uniaxialMaterial('Elastic',        2,       2.9E-2*MPa,     0,      0) 


      # Elements covered by this material : Torsional materials 
      
                           #mat_name,   matTag,       E,   eta,   Eneg
      ops.uniaxialMaterial('Elastic',        3,       7.9E4*MPa,     0,      0) 
      
      
      # Elements covered by this material : Self-centering concentric bracing (SCC braces)
      
      # SelfCentering : Flag-shaped self-centering material with optional recoverable slip and optional stiffness increase
      # matTag        : Unique identifier 
      # k1            : Initial stiffness
      # k2            : Post-activation stiffness (with 0<k2<k1)
      # sigAct        : Forward activation stress/force
      # beta          : Ratio of forward to reverse activation stress force 
      # epsSlip       : slip strain deformation (if epsSlip = 0 means no slippage)
      # epsBear       : Bearing Strain/deformation (if epsBear = 0, no bearing)
      # rBear         : Ratio of bearing stiffness to initial stiffness k1
     
                                 #mat_name, matTag,               k1,               k2,           sigAct,   beta,   epsSlip 
      ops.uniaxialMaterial('SelfCentering',      4, 1559941945/10**6,15599419.45/10**6,2175037.875/10**6,   0.75,    0.0736)
      
      
     
      ### Note : Bezabeh's model uses 798 SCC materials (to define different k1/k2 stiffnesses)
      



   def add_sections():
       
       """
       Implement unique section shapes (not readily available within the choice of sections)
       
       - Define cross-sections (for materials which do not use rigidity but rather stress-strain curves/elastic modulus)
       - Define cross-sections for any element that will require complex inputs (i.e. that cannot accept area, inertia about y & z axis directly)
       
       """
       
       
       #######################################
       #######################################
       
       #        CHECK UNIT CONSISTENCY
       
       #######################################
       #######################################
       
       #-------------------------------------------------------------------------------------------------------------------------------------------
       # Section command : 
       # Fiber     : Fibersection object composed of individual fibers, with each fiber made from a uniaxial material 
       # secTag    : Unique section identifier
       # -GJ       : Linear-elastic torsional stiffness flag 
       # GJ        : Linear-elastic torsional stiffness parameters if 2D: [P, Mz]     if 3D : [P, Mz, My, T]
       
           
        # Patches command (to add fibers to sections)
        # Generate a quadrilateral shaped patch (geometry defined by four vertices : I J K L, coordinates specified COUNTERCLOCKWISE)
        
        # matTag        : Unique identifier linking section to uniaxial material tag 
        # num subdivIJ  : Number of subdivisions (fibers) in IJ direction 
        # num subdiv JK : Number of subdivisions (fibers) in JK direction
        ########### All coordinates are in the local coordinate system 
        # crdsI (Iy,Iz) : Node I according to y-y then z-z axes
        # crdsJ (Jy,Jz) : Node J according to y-y then z-z axes
        # crdsK (Ky,Kz) : Node K according to y-y then z-z axes
        # crdsL (Ly,Lz) : Node L according to y-y then z-z axes       
           
       
        # AISC BEAM made from PATCHES----------------------------------------------    
        # Fiber section made of patches : simpler if defined through the ops_vis library : 
                      #  command, sectionName,         secTag,     -GJ,   GJ 
       fiber_sect1 = [['section',     'Fiber',              1,   '-GJ',  7.9E4],
                      #  command, Patch type,   matTag,  num subdivIJ,    num subdivJK,        Iy,           Iz,         Jy,        Jz,        Ky,        Kz,         Ly,        Lz                    
                      #['patch',       'quad',        1,             1,               6,   2.14E-1,      7.65E-2,    2.14E-1,  -7.65E-2,  -2.27E-1,  -7.65E-2,   -2.27E-1,   7.65E-2],
                      #['patch',       'quad',        1,             1,               6,  -2.14E-1,      4.00E-3,   -2.14E-1,  -4.00E-3,  -2.14E-1,  -4.00E-3,   -2.14E-1,   4.00E-3],
                      #['patch',       'quad',        1,             6,               1,  -2.27E-1,      7.65E-2,   -2.27E-1,  -7.65E-2,  -2.14E-1,  -7.65E-2,   -2.14E-1,   7.65E-2],
                      #]

                       #TEST CODE
                      ['patch',       'quad',        1,             1,               4,   -0.2015,  0.0885, -0.2015,  -0.0885, -0.1906,  -0.0885, -0.1906,  0.0885],
                      ['patch',       'quad',        1,             1,               4,   -0.1906, 0.00375, -0.1906, -0.00375,  0.1906, -0.00375,  0.1906,  0.00375],
                      ['patch',       'quad',        1,             1,               4,    0.1906,  0.0885,  0.1906,  -0.0885,  0.2015,  -0.0885,  0.2015,   0.0885],
                      ]



       # Visualize the section (currently not available to be plotted within the whole structure): 
       opsvis.fib_sec_list_to_cmds(fiber_sect1)
       opsvis.plot_fiber_section(fiber_sect1)
       plt.axis('equal')

       # Original code : 
       #ops.section('Fiber',      'Fiber',         1,   '-GJ',  7.9E4)
       #ops.patch('quad',        1,             1,               6,   2.14E-1,      7.65E-2,    2.14E-1,  -7.65E-2,  -2.27E-1,  -7.65E-2,   -2.27E-1,   7.65E-2)
       #ops.patch('quad',        1,             1,               6,  -2.14E-1,      4.00E-3,   -2.14E-1,  -4.00E-3,  -2.14E-1,  -4.00E-3,   -2.14E-1,   4.00E-3)
       #ops.patch('quad',        1,             6,               1,  -2.27E-1,      7.65E-2,   -2.27E-1,  -7.65E-2,  -2.14E-1,  -7.65E-2,   -2.14E-1,   7.65E-2)
       
       
       
       # COLUMN made from PATCHES----------------------------------------------    
        # Fiber section made of patches : simpler if defined through the ops_vis library : 
                      #  command, sectionName,         secTag,     -GJ,   GJ 
       fiber_sect2 = [['section',     'Fiber',              2,   '-GJ',  7.9E4],
                      #  command, Patch type,   matTag,  num subdivIJ,    num subdivJK,        Iy,           Iz,         Jy,        Jz,        Ky,        Kz,         Ly,        Lz                    
                      #['patch',       'quad',        1,             1,               6,   2.14E-1,      7.65E-2,    2.14E-1,  -7.65E-2,  -2.27E-1,  -7.65E-2,   -2.27E-1,   7.65E-2],
                      #['patch',       'quad',        1,             1,               6,  -2.14E-1,      4.00E-3,   -2.14E-1,  -4.00E-3,  -2.14E-1,  -4.00E-3,   -2.14E-1,   4.00E-3],
                      #['patch',       'quad',        1,             6,               1,  -2.27E-1,      7.65E-2,   -2.27E-1,  -7.65E-2,  -2.14E-1,  -7.65E-2,   -2.14E-1,   7.65E-2],
                      #]
       

                       #TEST CODE
                      ['patch',       'quad',        1,             4,               1,   0.032, 0.317, -0.311, 0.067, -0.266, 0.005,0.077,0.254],
                      ['patch',       'quad',        1,             1,               4,  -0.075, 0.144, -0.114, 0.116, 0.075, -0.144,0.114,-0.116],
                      ['patch',       'quad',        1,             4,               1,  0.266, -0.005, -0.077, -0.254, -0.032, -0.317,0.311,-0.067],
                      ]


       # Original code :     
       #ops.section('Fiber',2,'-GJ',7.9E4)
       #ops.patch('quad',        1,             6,               1,   1.6E-1,       2.12E-1,     1.6E-1,  -2.12E-1,   2.37E-1,  -2.12E-2,    2.37E-1,   2.12E-1)
       #ops.patch('quad',        1,             1,               6,  -1.6E-1,       2.39E-2,    -1.6E-1,  -2.39E-2,    1.6E-1,  -2.39E-2,     1.6E-1,   2.39E-2)
       #ops.patch('quad',        1,             6,               1,  -2.37E-1,      2.12E-2,   -2.37E-1,  -2.12E-1,   -1.6E-1,  -2.12E-1,    -1.6E-1,   2.12E-1)     
       
       # Visualize the section (currently not available to be plotted within the whole structure): 
       opsvis.fib_sec_list_to_cmds(fiber_sect2)
       opsvis.plot_fiber_section(fiber_sect2)
       plt.axis('equal')
       
       
       # Section BEAM  (also works for columns) --------------------------------------------------------------------------------------------------------------- 
       # sectionName   : Section type 'Elastic'
       # E_mod         : Young's Modulus
       # A             : Cross-sectional area
       # Iz            : Second moment of inertia about z axis
       # Iy            : Second moment of inertia about y axis
       # G_mod         : Shear modulus 
       # Jxx           : Torsional moment of inertia of section 
       # alphaY        : shear shape factor along y-axis 
       # alphaZ        : shear shape factor along z-axis
       
           # sectionName, secTag, E_mod,           A,           Iz,          Iy,         G_mod,             J,         alphaY,      alphaZ   
       ops.section('Elastic',    4,   2E5,  7.61288E-6,   2.5473E-10,  7.9916E-11,     7.72213E4,  3.371475E-12,     1.271186E1, 1.271186E1)
    






    
  
    
    
    

    
