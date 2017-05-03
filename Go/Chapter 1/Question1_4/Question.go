package Question1_4

// method to replace all spaces in a string with ‘%20’
// assuming that the string has sufficient space at the end
func ReplaceSpace(charsArr []rune, originalLen int) {
	
	idx1, idx2 := originalLength - 1, len(input) - 1

	for idx1 > 0 {
		if charsArr[idx1] == ' ' {
			charsArr[idx2-2], charsArr[idx2-1], charsArr[idx2] = '%', '2', '0'
			idx2 -= 2
		} else {
			charsArr[idx2] = charsArr[idx1]
		}

		idx1--
		idx2--
	}
}
