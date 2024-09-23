// To generate ->  python ./modules/lasercut/convert-2d.py --keep --library ./modules/lasercut/lasercut.scad SprayBooth.scad SprayBooth-Processed.dxf

include <modules/lasercut/lasercut.scad>;

/* [Booth Configuration] */
// material Thickness
Thickness = 4;
BoothWidth = 600;
BoothHeight = 500;
BoothDepth = 400;

/* [Fan Configuration] */
// depth of fan box
FanBoxDepth = 50;
// mounting hole size
FanMount = 3.5;

// ###########################################

/* [Hidden] */
// Filter media dimensions
// e.g. https://www.amazon.co.uk/HaoSheng-Portable-Airbrush-Accessories-Ventilation/dp/B01E2QE878
BoxWidth = 400 + (Thickness * 2);
BoxHeight = 190 + (Thickness * 2);
BoxDepth = FanBoxDepth;

// diameter (mm)
FanDiameter = 120;
// spacing (mm)
FanSpacing = 50;

FanRadius = FanDiameter / 2;

$fn = 60;

// ###########################################

// Box with fan cutouts
module Booth()
{
   x = BoothDepth;  
   y = BoothWidth;  
   z = BoothHeight;
   
     circles_remove_a = [
        [],
        [],
        [],
        [],
        [
           [FanRadius, (z / 4) - Thickness, (y / 2) - FanRadius - (FanSpacing / 2)], 
           [FanRadius, (z / 4) - Thickness, (y / 2) + FanRadius + (FanSpacing / 2)]
        ]
   ];
   lasercutoutBox(thickness = Thickness, x = x, y = y, z = z, sides = 5, circles_remove_a = circles_remove_a);
}

// Fan Box with mounting holes
module FanBox()
{
   x = BoxDepth;
   y = BoxWidth;
   z = BoxHeight;

   circles_remove_a = [
      [],
      [[10, x / 4, y / 2]],  // Single hole
      [],
      [],
      [
         // First fan
         [FanRadius, (z / 2) - Thickness, (y / 2) - FanRadius - (FanSpacing / 2)], 
         [FanMount / 2, (z / 2) - Thickness + FanRadius, (y / 2) - FanRadius - (FanSpacing / 2) + FanRadius], 
         [FanMount / 2, (z / 2) - Thickness + FanRadius, (y / 2) - FanRadius - (FanSpacing / 2) - FanRadius], 
         [FanMount / 2, (z / 2) - Thickness - FanRadius, (y / 2) - FanRadius - (FanSpacing / 2) - FanRadius], 
         [FanMount / 2, (z / 2) - Thickness - FanRadius, (y / 2) - FanRadius - (FanSpacing / 2) + FanRadius],

         // Second fan
         [FanRadius, (z / 2) - Thickness, (y / 2) + FanRadius + (FanSpacing / 2)], 
         [FanMount / 2, (z / 2) - Thickness + FanRadius, (y / 2) + FanRadius + (FanSpacing / 2) + FanRadius], 
         [FanMount / 2, (z / 2) - Thickness + FanRadius, (y / 2) + FanRadius + (FanSpacing / 2) - FanRadius], 
         [FanMount / 2, (z / 2) - Thickness - FanRadius, (y / 2) + FanRadius + (FanSpacing / 2) - FanRadius], 
         [FanMount / 2, (z / 2) - Thickness - FanRadius, (y / 2) + FanRadius + (FanSpacing / 2) + FanRadius]
       ]
   ];
   lasercutoutBox(thickness = Thickness, x = x, y = y, z = z, sides = 5, circles_remove_a = circles_remove_a);
}

// Assemble the spray booth with fan module on the rear face, if enabled
module SprayBooth()
{
   color("Gold", 0.75) Booth();
   // Whack fan box on the back for visuals
   translate([-BoxDepth, (BoothWidth / 2) - (BoxWidth / 2), (BoothHeight / 4) - (BoxHeight / 2)])
   {
      color("Green", 0.75) FanBox();
   }

}

// Render the spray booth
SprayBooth();
