x_case = 40;
y_case = 20;
z_case = 47.38;
$fn=60;

module case() {
       cube([x_case,y_case,z_case]);
}



rotor_h = 47.38-43;
module rotor() {
       translate([0,0,z_case]) cylinder(d=3,h=rotor_h);
}

module 35kg_servo() {
  case();
  rotor();
}


35kg_servo();