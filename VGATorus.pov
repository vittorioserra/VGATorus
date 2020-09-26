#include "colors.inc"
#include "textures.inc"

camera
{
	location <0.0, 10.0, -20.0>
	look_at <0.0, -4.0,  0.0>
	right x*image_width/image_height
}

#for(i, 0, 8)
	light_source
	{
		y*-10
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

#fopen file "pov-image.txt" read

// #declare columns = 640;
// #declare rows = 480;
#read (file, columns, rows)

#declare frontPorch = columns*.1;
#declare backPorch = columns*.15;
#declare hSync = columns*.2;
#declare vSync = rows*.2;

#declare colFrontPorch = color Green;
#declare colBackPorch = color Red;
#declare colHSync = color Blue;
#declare colVSync = color Yellow;
#declare colData = color White;

/*
#declare colFrontPorch = Green_Glass;
#declare colBackPorch = Ruby_Glass;
#declare colHSync = Dark_Green_Glass;
#declare colVSync = Yellow_Glass;
#declare colData = Glass2;
*/

#declare MajorRadius = 10;
#declare MinorRadius = 3;

#declare dot = sphere { 0, .2 }

#declare totalC = columns + frontPorch + backPorch + hSync;
#declare totalR = rows + vSync;

#for (r, 0, totalR)
	#for (c, 0, totalC)
		object
		{
			dot
			translate y*MinorRadius
			rotate z*(c*360/totalC)
			translate x*MajorRadius
			rotate y*(r*360/totalR)
			pigment
			{
			#if (r < rows)
				#if (c < frontPorch)
					colFrontPorch
				#elseif (c < frontPorch + columns)
					#read (file, pixelColor)
					color pixelColor
				#elseif (c < frontPorch + columns + backPorch)
					colBackPorch
				#else
					colHSync
				#end
			#else
				colVSync
			#end
			}
			
					
		}
	#end
#end    


#declare ScrewMinorRadius = 3.5;
#declare ScrewMajorRadius = 10; 
#declare WindingFreq = 10; //Hz   
                                                              
        
                                                     
#for (phi, 0, 2*pi, 0.001)      

  #declare x_translation = (ScrewMajorRadius + ScrewMinorRadius * cos(2*pi*WindingFreq*phi))*cos(phi); 
  #declare y_translation = (ScrewMajorRadius + ScrewMinorRadius * cos(2*pi*WindingFreq*phi))*sin(phi);;
  #declare z_translation = ScrewMinorRadius * sin(2*pi*WindingFreq*phi);

  sphere{ <0,0,0>,0.1
          pigment{color Red filter 0.1}
          translate< x_translation, z_translation, y_translation>}

#end   
