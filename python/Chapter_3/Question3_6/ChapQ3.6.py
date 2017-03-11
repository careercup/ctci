class Stack(list):
	def peak(self):
		return self[-1]
	def push(self, item):
		self.append(item)
	def empty(self):
		return len(self) == 0

	def sort_stack(s):
		r = Stack()
		while not s.empty():			
			tmp = s.pop()
			while not r.empty() and r.peak() > tmp:
				s.push(r.pop())
			r.push(tmp)
			while not s.empty() and s.peak() >= r.peak():
				#warning, >= here
				r.push(s.pop())
		return r

#testing
from random import randrange
test_items = [randrange(20) for x in xrange(20)]
print test_items
S = Stack()
for item in test_items:
	S.push(item)
S = Stack.sort_stack(S)
for i, item in enumerate(sorted(test_items)):
	print "item", item, S[i]
