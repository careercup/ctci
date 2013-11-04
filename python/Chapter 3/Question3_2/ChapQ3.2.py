# Approach 1. Use a tuple to store data and min in every stack element
class StackWithMin(object):
	def __init__(self, storage = []):
		self.storage = storage
	def empty(self):
		return len(self.storage) == 0
	def push(self, value):
		if len(self.storage) == 0 or value < self.storage[-1][1]:
			self.storage.append((value, value))
		else:
			self.storage.append((value, self.storage[-1][1]))
	def pop(self):
		return self.storage.pop()[0]
	def get_top(self):
		if len(self.storage) == 0: return None
		return self.storage[-1][0]
	def get_min(self):
		if len(self.storage) == 0: return None
		return self.storage[-1][1]


# Approach 2. Use an additional python list to keep track of mins (Save space)
class StackWithMin2:
    def __init__(self):
        self.stack = []
        self.min = []
        
    def push(self, value):
        self.stack.append(value)
        if len(self.min) == 0 or value <= self.min[-1]:
            self.min.append(value)

    def pop(self):
        if len(self.stack) == 0:
            return None
        data = self.stack.pop()
        if data == self.min[-1]:
            self.min.pop()
        return data

    def get_min(self):
        if len(self.min)==0:
            return None
        return self.min[-1]




# Testing
from random import randrange
S1 = StackWithMin()
S2 = StackWithMin2()
test_list = [randrange(100) for x in xrange(10)]
for num in test_list:
	S1.push(num)
	S2.push(num)
	print num, 
print ""
for i in xrange(len(test_list)):
	print "new pop", S1.pop(), S2.pop()
	print "new min", S1.get_min(), S2.get_min()
 