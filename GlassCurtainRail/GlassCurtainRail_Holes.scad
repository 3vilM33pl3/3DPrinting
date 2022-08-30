delta = 0.005;

main_w = 30; // depth of main block
main_d = 61; // width of main block
main_h = 18; // height of main block

cyl_h = 29; // cylinder cutout height
cyl_r = 12; // cylinder cutout radius 
cyl_fn = 254; // cylinder segments (more is smoother) 

cyl_hole_h = 4.2; // cylinder hole cutout height
cyl_hole_r_bottom = 3.2 / 2; // cylinder hole cutout radius 
cyl_hole_r_top = 6 / 2; // cylinder cutout radius 
cyl__hole_fn = 254; // cylinder segments (more is smoother) 

cyl_loc_x = 15; // x location cutout cylinder
cyl_loc_y = 15.5; // y location cutout cylinder 

floor_h = 4; // height of floor 

cutout_w = 25;
cutout_d = 70;
cutout_h = 20;

depth_cutout = 11;





difference() {
    difference() {
        difference() {
            difference() {
                difference() {
                    cube([main_w,main_d,main_h], false);
                    union() {
                        color("aqua")
                        translate([cyl_loc_x, main_d - cyl_loc_y, floor_h])
                        cylinder(cyl_h, cyl_r, cyl_r, $fn=cyl_fn);
                        
                        color("aqua")
                        translate([cyl_loc_x, cyl_loc_y, floor_h])
                        cylinder(cyl_h, cyl_r, cyl_r, $fn=cyl_fn);    
                    }
                };
                
                union() {
                    translate([cyl_loc_x, cyl_loc_y, -0.1])
                    cylinder(cyl_hole_h, cyl_hole_r_bottom, cyl_hole_r_top, $fn=cyl_fn);

                    translate([cyl_loc_x, main_d - cyl_loc_y, -0.1])
                    cylinder(cyl_hole_h, cyl_hole_r_bottom, cyl_hole_r_top, $fn=cyl_fn);
                }
                
            };

            color("aqua")
            translate([depth_cutout, -1, 4.0])
            cube([cutout_w,cutout_d,cutout_h], false);
        }
    }
    translate([14,0,0])
    {
        color("blue")
        translate([0,60,0])
        translate([0,-3,-2])
        {
            linear_extrude(10)
            polygon([[0,0], [4,0], [3.2,4.001], [0.8,4.001]]);
            translate([2,0,0])
            cylinder(10, 2, 2, $fn=128);
        }

        color("blue")
        translate([5,0,-2])
        mirror([0,1,0])
        {
            translate([0,-4,0])
            {
                linear_extrude(10)
                polygon([[0,0], [4,0], [3.2,4.001], [0.8,4.001]]);
                translate([2,0,0])
                cylinder(10, 2, 2, $fn=128);
            }
        }
    }
}


translate([14,0,0])
{

    translate([5,60,0])
    scale([0.95, 0.95,1])
    mirror([0,1,0])
    translate([0.1,-5,0])
    {
        linear_extrude(4)
        polygon([[0,0], [4,0], [3.2,4], [0.8,4]]);
        translate([2,0,0])
        cylinder(4, 2, 2, $fn=128);
    }

    mirror([0,1,0])
    {
        scale([0.95, 0.95,1])
        mirror([0,1,0])
        translate([0.1,-4,0])
        {
            linear_extrude(4)
            polygon([[0,0], [4,0], [3.2,4], [0.8,4]]);
            translate([2,0,0])
            cylinder(4, 2, 2, $fn=128);
        }
    }
}
