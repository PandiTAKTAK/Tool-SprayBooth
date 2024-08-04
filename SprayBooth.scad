include <modules/lasercut/lasercut.scad>;

/* [Booth Configuration] */
// material thickness
thickness = 4;
booth_width = 600;
booth_height = 500;
booth_depth = 400;

/* [Fan Configuration] */
// depth of fan box
fan_box_depth = 50;
// mounting hole size
fan_mount = 3.5;

// ###########################################

/* [Hidden] */
// Filter media dimensions
// e.g. https://www.amazon.co.uk/HaoSheng-Portable-Airbrush-Accessories-Ventilation/dp/B01E2QE878
box_width = 400 + (thickness * 2);
box_height = 190 + (thickness * 2);
box_depth = fan_box_depth;

// diameter (mm)
fan_diameter = 120;
// spacing (mm)
fan_spacing = 50;

$fn = 60;

// ###########################################

// Box with fan cutouts
module booth()
{
    x = booth_depth;
    y = booth_width;
    z = booth_height;

    circles_remove_a = [
        [],
        [],
        [],
        [],
        [
            [fan_diameter / 2, z / 4 - thickness, y / 2 - fan_diameter / 2 - fan_spacing / 2], 
            [fan_diameter / 2, z / 4 - thickness, y / 2 + fan_diameter / 2 + fan_spacing / 2]
        ]
    ];
    lasercutoutBox(thickness = thickness, x = x, y = y, z = z, sides = 5, circles_remove_a = circles_remove_a);
}

// Fan Box with mounting holes
module fan_box()
{
    x = box_depth;
    y = box_width;
    z = box_height;

    circles_remove_a = [
        [],
        [[10, x / 4, y / 2]],  // Single hole
        [],
        [],
        [
            // First fan
            [fan_diameter / 2, z / 2 - thickness, y / 2 - fan_diameter / 2 - fan_spacing / 2], 
            [fan_mount / 2, z / 2 - thickness + fan_diameter / 2, y / 2 - fan_diameter / 2 - fan_spacing / 2 + fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness + fan_diameter / 2, y / 2 - fan_diameter / 2 - fan_spacing / 2 - fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness - fan_diameter / 2, y / 2 - fan_diameter / 2 - fan_spacing / 2 - fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness - fan_diameter / 2, y / 2 - fan_diameter / 2 - fan_spacing / 2 + fan_diameter / 2],
            
            // Second fan
            [fan_diameter / 2, z / 2 - thickness, y / 2 + fan_diameter / 2 + fan_spacing / 2], 
            [fan_mount / 2, z / 2 - thickness + fan_diameter / 2, y / 2 + fan_diameter / 2 + fan_spacing / 2 + fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness + fan_diameter / 2, y / 2 + fan_diameter / 2 + fan_spacing / 2 - fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness - fan_diameter / 2, y / 2 + fan_diameter / 2 + fan_spacing / 2 - fan_diameter / 2], 
            [fan_mount / 2, z / 2 - thickness - fan_diameter / 2, y / 2 + fan_diameter / 2 + fan_spacing / 2 + fan_diameter / 2]
        ]
    ];
    lasercutoutBox(thickness = thickness, x = x, y = y, z = z, sides = 5, circles_remove_a = circles_remove_a);
}

// Assemble the spray booth with fan module on the rear face, if enabled
module spray_booth()
{
    color("Gold", 0.75) booth();
    // Whack fan box on the back for visuals
    translate([-box_depth, booth_width / 2 - box_width / 2, booth_height / 4 - box_height / 2])
    {
        color("Green", 0.75) fan_box();
    }

}

// Render the spray booth
spray_booth();
