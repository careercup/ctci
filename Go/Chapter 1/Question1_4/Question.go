package Question1_4

// method to replace all spaces in a string with ‘%20’
// assuming that the string has sufficient space at the end
func ReplaceSpace(charsArr []rune, originalLen int) {
	countSpaces := 0
	for i := 0; i < originalLen; i++ {
		if charsArr[i] == rune(' ') {
			countSpaces++
		}
	}
  index := len(charsArr)
	for i := originalLen-1; i >= 0; i-- {
		if charsArr[i] == rune(' ') {
      charsArr[index-1] = '0';
      charsArr[index-2] = '2';
      charsArr[index-3] = '%';
      index = index-3;
		} else {
      charsArr[index-1] = charsArr[i]
			index--
		}
	}
}
