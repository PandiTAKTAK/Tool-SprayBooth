use <./modules/lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 4, 
          points = [[0, 0], [396, 0], [396, 592], [0, 592], [0, 0]]
        , simple_tabs = [[180, -2, 0], [180, -2, 596]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [396, 0], [396, 592], [0, 592], [0, 0]]
        , simple_tabs = [[180, -2, 0]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [396, 0], [396, 492], [0, 492], [0, 0]]
        , finger_joints = [[0, 0, 2], [180, 0, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [396, 0], [396, 492], [0, 492], [0, 0]]
        , simple_tabs = [[0, -2, 492]]
        , finger_joints = [[0, 0, 2], [180, 0, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [492, 0], [492, 592], [0, 592], [0, 0]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 1, 2], [270, 1, 2]]
        , circles_remove = [[60, 121, 215], [60, 121, 385]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [46, 0], [46, 400], [0, 400], [0, 0]]
        , simple_tabs = [[180, -2, 0], [180, -2, 404]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [46, 0], [46, 400], [0, 400], [0, 0]]
        , simple_tabs = [[180, -2, 0]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 0, 2]]
        , circles_remove = [[10, 12.5, 204]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [46, 0], [46, 190], [0, 190], [0, 0]]
        , finger_joints = [[0, 0, 2], [180, 0, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [46, 0], [46, 190], [0, 190], [0, 0]]
        , simple_tabs = [[0, -2, 190]]
        , finger_joints = [[0, 0, 2], [180, 0, 2], [90, 0, 2]]
        ) 

lasercutout(thickness = 4, 
          points = [[0, 0], [190, 0], [190, 400], [0, 400], [0, 0]]
        , finger_joints = [[0, 1, 2], [180, 1, 2], [90, 1, 2], [270, 1, 2]]
        , circles_remove = [[60, 95, 119], [1.75, 155, 179], [1.75, 155, 59], [1.75, 35, 59], [1.75, 35, 179], [60, 95, 289], [1.75, 155, 349], [1.75, 155, 229], [1.75, 35, 229], [1.75, 35, 349]]
        ) 

;
}

flat();
