/**
 * TA1-1
 * 
 * Tree Cybernetics
 *  Arm
 *   1st Model
 *     1st Iteration
 */

#include "Arduino.h"
#include <Servo.h>
#include <ArduinoJson.h>

#ifndef LED_BUILTIN
#define LED_BUILTIN 13
#endif

int side_arm_pin = 2;
int main_arm_pin = 3;
Servo side_arm;
Servo main_arm;

int i = 0;
void echo() {
  DynamicJsonDocument doc(1024);
  doc["model"] = "tree_arm";
  doc["version"] = 1;
  doc["iteration"] = 1;
  serializeJson(doc, Serial);
}

void init_servos() {
  side_arm.attach(side_arm_pin);
  main_arm.attach(main_arm_pin);
  side_arm.write(170);
  main_arm.write(0);
}



void drive_motor_full_range(Servo servo, int start, int stop)
{
	int expected_times = 4;
	int i = start+1;
	int delta = 1;
	int times = 0;
	while(times != expected_times) {
		if(i>=stop || i<=start) {
			delta = delta * -1;
			times++;
      Serial.println(times);
		}
    i = i + delta;
    servo.write(i);
    delay(40);
	}
}

int pos = 150;
void calibrate() {
	int flex = 170;
	if(pos != flex) {
		pos++;
		side_arm.write(pos);
		delay(40);
	}
}


void loop() {
	//calibrate();
}



void setup()
{
  // initialize LED digital pin as an output.
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
  echo();
  init_servos();
	drive_motor_full_range(main_arm, 0,180);
}
