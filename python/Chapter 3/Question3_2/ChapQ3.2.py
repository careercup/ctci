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

#testing
S1 = StackWithMin()
from random import randrange
test_list = [randrange(10) for x in xrange(10)]
for num in test_list:
	S1.push(num)
	print num, 
print ""
S2 = test_list
for i in xrange(len(test_list)-1):
	print "new pop", S1.pop(), S2.pop()
	print "new min", S1.get_min(), min(S2)
