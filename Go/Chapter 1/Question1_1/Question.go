package Question1_1

// using a bitvector
func isUniqueChars(str string) bool {
	if len(str) > 128 {
		return false
	}
	var checker uint = 0; // use this int as a bit vector
	for _, char := range str {
		val := uint(char) - uint('a')
		if ((checker & (1 << val)) > 0) {
			return false
		}
		checker |= (1 << val)
	}
	return true
}

// using a boolean array
func isUniqueChars2(str string) bool {
	if len(str) > 128 {
		return false
	}
	var char_set [128]bool // every bool represents if a character was seen
	for _, val := range str {
		if char_set[val] {
			return false
		}
		char_set[val] = true
	}
	return true
}
