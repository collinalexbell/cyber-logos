
count = 0

class Joint:
    def __init__(self):
        global count
        self._id = count
        count += 1

    def id(self):
        return self._id
