# 8.1 Write a function that adds two numbers. 
# You should not use + or any arithmetic perators.
# Assuming integer arithmetic, below will not work with floats.

def add(a, b):

	if b == 0:
		return a

	sum_no_carry = a ^ b # add without carrying
	carry = (a & b) << 1 # carry, but don't add

	return add(sum_no_carry, carry) # recurse


#-------------test-------------

from random import randrange

def test():
	
	TEST_DATA = []

	for i in range(10):
		a = randrange(1000)
		b = randrange(1000)
		TEST_DATA.append((a, b, a+b))
	print TEST_DATA

	for t in TEST_DATA:
		if add(t[0], t[1]) == t[2]:
			print 'test passed for %d + %d = %d' % t
		else:
			print 'test failed'

if __name__ == '__main__':
	test()
