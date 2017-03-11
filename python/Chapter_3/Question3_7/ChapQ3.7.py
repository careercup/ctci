class AnimalQueue(object):
	def __init__(self):
		from collections import deque
		self.dog_q = deque()
		self.cat_q = deque()
		self.time_stamp = 0

	def enqueue(self, animal_type, animal_name):
		if animal_type == "dog":
			self.dog_q.appendleft((animal_name, self.time_stamp))
			self.time_stamp += 1
		elif animal_type == "cat":
			self.cat_q.appendleft((animal_name, self.time_stamp))
			self.time_stamp += 1
		else:
			print "invalid animal type"

	def dequeue_any(self):
		dog = self.dog_q.pop() if not len(self.dog_q) == 0 else (None, -1)
		cat = self.cat_q.pop() if not len(self.cat_q) == 0 else (None, -1)
		if dog[1] == -1 and cat[1] == -1:
			return None
		elif dog[1] < cat[1]:
			self.cat_q.append(cat)
			return dog[0]
		else:
			self.dog_q.append(dog)
			return cat[0]

	def dequeue_cat(self):
		if not len(self.cat_q) == 0:
			return self.cat_q.pop()[0]

	def dequeue_dog(self):
		if not len(self.dog_q) == 0:
			return self.dog_q.pop()[0]

#testing
Q = AnimalQueue()

from random import randrange
test_list = [randrange(7) for x in xrange(20)]
for i, x in enumerate(test_list):
	if x < 4:
		if i%2: 
			animal_type = "cat" 
		else: 
			animal_type = "dog"
		test_list[i] = ("enqueue", Q.enqueue, animal_type, animal_type + "#" + str(i))
	elif x == 4:
		test_list[i] = ("dequeue any", Q.dequeue_any)
	elif x == 5:
		test_list[i] = ("dequeue cat", Q.dequeue_cat)
	elif x == 6:
		test_list[i] = ("dequeue dog", Q.dequeue_dog)


for operation in test_list:
	if len(operation) == 4:
		print operation[0], operation[2], operation[3]
		operation[1](operation[2], operation[3])
	else:
		print operation[0],
		print operation[1]()

