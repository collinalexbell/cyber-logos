cut_margin = 5;
rough_x = 40;
rough_y = 25;
rough_z = 140;

bottom_cut_x = 16;
bottom_cut_y = rough_y + cut_margin;
bottom_cut_z = 40;

module bottom_cut() {
       cube([bottom_cut_x, bottom_cut_y, bottom_cut_z]);
}


top_cut_x = 14;
top_cut_y = rough_y;
top_cut_z = 33;

module top_cut() {
       cube([top_cut_x, top_cut_y+cut_margin, top_cut_z+cut_margin]);
}

difference() {
  color([0,0, 0.8]) cube([rough_x, rough_y, rough_z]);
  color([0.4, 0,0.4]) translate([rough_x/2-bottom_cut_x/2, -cut_margin/2, -cut_margin]) bottom_cut();
  color([0.4, 0,0.4]) translate([rough_x/2-bottom_cut_x/2, -cut_margin/2, rough_z-top_cut_z+cut_margin]) top_cut();
}