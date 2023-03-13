h_top = 11.5;
h_bottom = 9.5;
n_blocks = 13;
depth = 10;
//                Top of of the cathedral
// <----------------------------------------------------


floor_thickness = 4;
cathedral_width = 5.6;

//                Height of the Red Book

wall_thickness = 0.2;
module floor_decor() {
  difference() {
    cube([wall_thickness + cathedral_width, 0.2, 2.0]);
    for(i=[0:6]) { translate([-0.5 + i,-0.2,2.0]) rotate([0,45,0]) cube([1,1,1]);}
  }
}
module floors() {
  translate([wall_thickness,0, h_bottom]) cube([cathedral_width,depth,.4]);
  translate([0,0,h_bottom]) floor_decor();
  cube([wall_thickness + cathedral_width,depth,.4]);
  floor_decor();
}

floors();

// <---------------------------------------------------




cm_per_block = h_bottom/n_blocks;
cube([wall_thickness, 10, h_bottom+h_top]);
translate([cathedral_width + wall_thickness ,0,0])
  cube([wall_thickness, 10, h_bottom+h_top]);
// ==========


