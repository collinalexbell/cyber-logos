
$fn=80;
translate([0,0,40]) cylinder(d=39.9, h=7.8);

// object will require a clamp

clamp_h=10;
difference() {
  union() {
    translate([0,-25,0]) cube([25,50,clamp_h]);
    translate([-50/2,-50/2,0]) cube([25,50,clamp_h]);
  }
  translate([0,0,-1]) cylinder(d=40, h=40);
  hole_size = 8;
  translate([-hole_size/2,-0,-1]){
    cube([hole_size,50,20]);
  }
}

//bolt

module bolt() {
cylinder(d=4.7, h=25);
cylinder(d=8.5, h=5);
}

translate([-25/2,30,clamp_h/2]) rotate([0,90,0]) bolt();