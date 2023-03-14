$fn = 40;

hole_distance = 1.5;
difference() {
  cube([0.5,4,4]);
  translate([-1, 2,2]) rotate([0,90,0]) cylinder(d=1.4, h=20);
  for(i=[0:6]) {
    translate([0, 2, 2]) rotate([i*360/6,0,0]) translate([-1,hole_distance,0]) rotate([0,90,0]) cylinder(d=0.4, h=20);
    translate([0, 2, 2]) rotate([i*360/6,0,0]) translate([0.2,hole_distance,0]) rotate([0,90,0]) cylinder(d=0.6, h=20);
  }
}

