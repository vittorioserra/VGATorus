#include "colors.inc"
#include "textures.inc"

camera
{
	location <0.0, 10.0, -30.0>
	look_at <0.0, -4.0,  0.0>
	right x*image_width/image_height
}

#for(i, 0, 8)
	light_source
	{
		y*-40
		color White
		translate z*40
		rotate y*(i*360/8)
	}
#end
plane
{
	y, -50
	pigment { rgb <.7,.95,1> }
	finish { specular .5 reflection .2 }
}

#declare ScrewMinorRadius = 3.5;
#declare ScrewMajorRadius = 10; 
#declare WindingFreq = 10; //Hz   
                                                              
        
#declare phi = 0;
 
                                                           
#for (phi, 0, 2*pi, 0.001)      

  #declare x_translation = (ScrewMajorRadius + ScrewMinorRadius * cos(2*pi*WindingFreq*phi))*cos(phi); 
  #declare y_translation = (ScrewMajorRadius + ScrewMinorRadius * cos(2*pi*WindingFreq*phi))*sin(phi);;
  #declare z_translation = ScrewMinorRadius * sin(2*pi*WindingFreq*phi);

  sphere{ <0,0,0>,0.1
          pigment{ color rgb<1,0.65,0>}
          translate< x_translation, z_translation, y_translation>}

#end   
