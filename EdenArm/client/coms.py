from serial import Serial
import json

class Coms:
    def __init__(self, port):
	    self.serial = Serial(port)

    def write(self, obj):
        payload = json.dumps(obj)
        self.serial.write(payload.encode())
