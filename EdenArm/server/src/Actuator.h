#include <Servo.h>
#include "Procedure.h"
#include <ArduinoSTL.h>

class Actuator {
		Servo servo;	
		Procedure* procedures[100];
		int procedure_count;
		int id;
	
	public:
	Actuator(int id, int position) {
		procedure_count = 0;
		servo.attach(5);
		this->id = id;
	}
	void step(){}
	~Actuator() {
		for(int i=0; i < procedure_count; i++){
			delete procedures[i];
		}
		free(procedures);
	}
};
