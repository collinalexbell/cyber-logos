$fn = 50;

// system of coordinates: x is the long coordinate
hole_length = 150;
length = 160;
part_x = length;
width = 10;
part_y = width;
thickness = 5;
part_z = thickness;

cut_margin = 5;

hole_d = 5;
module hole() {
       cylinder(d=5, h=50);       
}

module vert_control_ligament() {
       difference() {
        color([0,0,0.7]) cube([part_x, part_y, part_z]);
        translate([5,part_y/2,-cut_margin]) hole();
        translate([5 + hole_length ,part_y/2,-cut_margin]) hole();
       }
}

vert_control_ligament();