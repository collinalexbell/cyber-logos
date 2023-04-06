#include <unity.h>
#include "Actuator.h"

void setUp(void) {
	// set stuff up here
}

void tearDown(void) {
	// clean stuff up here
}

void test_ingsoc() {
	TEST_ASSERT_TRUE(2 + 2 == 4);
}

void test_Actuator_constructor() {
	Actuator my_actuator(0, 0);
}

int main( int argc, char **argv) {
	UNITY_BEGIN();
	UNITY_END();
}

