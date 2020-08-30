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

#declare columns = 640;
#declare rows = 480;
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

#declare dot = sphere { 0, .1 }

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
					colData
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

