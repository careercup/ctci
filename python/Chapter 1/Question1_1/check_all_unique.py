def is_string_unique(input_string):
	"""
	:param input_string: string to be tested
	:return: boolean if string is having all unique characters
	"""
	input_size = len(input_string)
	if  input_size > 256:
		return False
	return len(input_string) == len(set(input_string))

print is_string_unique("abcdef")
print is_string_unique("abcdeaf")
