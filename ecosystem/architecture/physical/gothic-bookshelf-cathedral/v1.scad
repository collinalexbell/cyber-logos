h_top = 11.5;
h_bottom = 9.5;
n_blocks = 13;
depth = 10;
//                Top of of the cathedral
// <----------------------------------------------------


floor_thickness = 4;
cathedral_width = 5.6;

//                Height of the Red Book

translate([0,0, h_bottom]) cube([cathedral_width,depth,.4]);
cube([cathedral_width,depth,.4]);

// <---------------------------------------------------



cm_per_block = h_bottom/n_blocks;
cube([0.05, 10, h_bottom+h_top]);
translate([cathedral_width,0,0])
  cube([0.05, 10, h_bottom+h_top]);






// ==========


