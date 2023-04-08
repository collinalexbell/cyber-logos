$fn = 60;
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



z_to_hole = 14;

module bottom_holes() {
      color([0.4, 0,0.4]){
        translate([-cut_margin,rough_y/2,z_to_hole]){
          rotate([0,90,0]) cylinder(d=5, h=rough_x + (2 * cut_margin));
        }
      }
}

z_bot_hole_to_top_hole = 118;

module top_holes() {
      color([0.4, 0,0.4]){
        translate([-cut_margin,rough_y/2,z_to_hole+z_bot_hole_to_top_hole]){
          rotate([0,90,0]) cylinder(d=5, h=rough_x + (2 * cut_margin));
        }
      }
}

z_to_first_weight_optimization_cut = 45;
weight_optimization_z = 25;
weight_optimization_y = 15;
weight_optimization_x = rough_x + (2 * cut_margin);
hole_seperation_space = 8;
hole_seperation_translate_z = weight_optimization_z + hole_seperation_space;

module weight_optimization_cut(index) {
      color([0.4, 0,0.4]){
        translate([-cut_margin,rough_y/2-weight_optimization_y/2, z_to_first_weight_optimization_cut+(index*hole_seperation_translate_z)]){
          rotate([0,0,0]) cube([weight_optimization_x, weight_optimization_y, weight_optimization_z]);
        }
      }
}

taper_z = 58;
taper_x = 8.5 + cut_margin;
taper_y = rough_y + (2*cut_margin);
x_axis_taper_translate_z = z_to_first_weight_optimization_cut;

module x_axis_taper() {
      color([0.4, 0,0.4]){
                  translate([-cut_margin,-cut_margin, x_axis_taper_translate_z]) {
                    cube([taper_x, taper_y, taper_z]);
                  }
      }
}

difference() {
  color([0,0, 0.8]) cube([rough_x, rough_y, rough_z]);
  color([0.4, 0,0.4]) translate([rough_x/2-bottom_cut_x/2, -cut_margin/2, -cut_margin]) bottom_cut();
  color([0.4, 0,0.4]) translate([rough_x/2-bottom_cut_x/2, -cut_margin/2, rough_z-top_cut_z+cut_margin]) top_cut();
  bottom_holes();
  top_holes();
  weight_optimization_cut(0);
  weight_optimization_cut(1);
  x_axis_taper();
}



