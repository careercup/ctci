"""write a method to replace all space in a string with '%20'
"""

# using a list to store each char and change space to '%20', then join list into a string
def replaceSpace(string):
	charList = []
	for char in string:
		if char == ' ':
			char = '%20'
		charList.append(char)
	return ''.join(charList)

#test
inputStr = " Smith    q m "
expectOutput = "%20Smith%20%20%20%20q%20m%20"
if replaceSpace(inputStr) == expectOutput:
	print "test passed"
else:
	print "test failed"
