package Question1_2

// function to reverse a C style string, by returning a new reversed string
func reverse(str string) string {
	length := len(str)
	revArr := []byte(str)
	for i := length / 2; i >= 0; i-- {
		revArr[i], revArr[length-i-1] = revArr[length-i-1], revArr[i]
	}
	return string(revArr)
}
