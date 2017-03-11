class MyQueue(object):
	def __init__(self):
		self.s = [[], []]
	def push(self, value):
		self.s[0].append(value)
	def pop(self):
		if len(self.s[1]) > 0:
			return self.s[1].pop()
		while len(self.s[0]) > 0:
			self.s[1].append(self.s[0].pop())
		if len(self.s[1]) == 0:
			return None
		return self.s[1].pop()
	
	def length(self):
		return len(self.s[0]) + len(self.s[1])

	def empty(self):
		return self.length() == 0

q1 = MyQueue()
from Queue import Queue
q2 = Queue()

#testing
from random import randrange
for step in xrange(20):
	operation = randrange(10)
	if operation < 7:
		q1.push(operation)
		q2.put(operation)
		print "push", operation
	elif not q2.empty():
		print "pop", q1.pop(), q2.get()
while not q2.empty():
	print "pop", q1.pop(), q2.get()