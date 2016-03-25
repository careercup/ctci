def is_permutation(str1, str2):
	
	"""
	Checks to see if one string is permutation of the other using sets.
	If statement is necessary because the function will not output correct
	values for characters that occur more than once otherwise.

	INPUT: Two strings
	OUTPUT: True or False
	"""
        if len(str1) != len(str2):
            return False
        else:
            return set(str1) == set(str2)