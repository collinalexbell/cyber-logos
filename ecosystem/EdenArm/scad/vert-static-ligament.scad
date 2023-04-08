$fn = 60;
cut_margin = 5;

hole_distance = 135;

part_length = 150;
x = part_length;

part_width = 11.5;
y = part_width;

part_thickness = 5;
z = part_thickness;

hole_offset = (x-hole_distance)/2;

module hole() {
       cylinder(d=5, h=50);       
}

module vert_static_ligament() {
       difference() {
        color([0,0,0.8]) cube([x,y,z]);
        translate([hole_offset,y/2,-cut_margin]) hole();
        translate([hole_distance+hole_offset,y/2,-cut_margin]) hole();
       }
}

vert_static_ligament();