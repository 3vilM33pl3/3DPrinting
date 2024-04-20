include <BOSL/constants.scad>
use <BOSL/masks.scad>
use <BOSL/transforms.scad>

resolution_base=600;

resolution_hole=200;

difference() {
    difference() {
        scale([0.52,0.9,1])
        difference() {
            cylinder(h=4, r1=50, r2=49, $fn=resolution_base);
            up(4) fillet_cylinder_mask(r=49.23, fillet=0.77, xtilt=0, ytilt=0, $fn=resolution_hole);
        }
        color("lightblue", 1.0)
        translate([0,0,3])
        cylinder(h=5,r1=6.1,r2=6.2,$fn=resolution_hole);
    }
    up(4) fillet_hole_mask(r=6.1, fillet=0.4, $fn=resolution_hole);
}