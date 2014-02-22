from collections import OrderedDict

def compress(s):
	d = OrderedDict()
	for i in s:
		if i in d:
			d[i] += 1
		else:
			d[i] = 1
	cs = ''
	for i in zip(d.keys(), d.values()):
		cs += str(i[0]) # letter, eg. a
		cs += str(i[1]) # count, eg. 3
	return cs if len(cs) < len(s) else s

if __name__ == '__main__':
    words = ('aaabbbbcccccdee', 'abc', 'a', '', ' ', 'aabccdde', 'aab', 'aaabb')
    for w in words:
        print('compress({}): {}'.format(w, compress(w)))
