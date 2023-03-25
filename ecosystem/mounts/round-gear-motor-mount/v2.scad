$fn = 40;

module round_gear_motor_mount() {
  hole_distance = 1.5;
  part_width = 5.4;
  part_height = 4;
  difference() {
    cube([0.5,part_width, part_height]);
    translate([-1, part_width/2,2]) rotate([0,90,0]) cylinder(d=1.4, h=20);
    for(i=[0:6]) {
      translate([0, part_width/2, 2]) rotate([i*360/6,0,0]) translate([-1,hole_distance,0]) rotate([0,90,0]) cylinder(d=0.4, h=20);
      translate([0, part_width/2, 2]) rotate([i*360/6,0,0]) translate([0.2,hole_distance,0]) rotate([0,90,0]) cylinder(d=0.6, h=20);
    }
  }
}