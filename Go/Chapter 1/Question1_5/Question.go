package Question1_5

import "bytes"
import "fmt"

// Helper function that counts number of same characters following a position
func countSame(runeStr []rune, pos int) int {
	posCheck := pos + 1
	count := 1
	for posCheck < len(runeStr) && runeStr[posCheck] == runeStr[pos] {
		count++
		posCheck++
	}
	return count
}

// method to perform basic string compression
// using the counts of repeated characters
// example "aabcccccaaa" => "a2b1c5a3"
// But, if the compressed string is not smaller return the original
func compress(str string) string {
	//  most efficient way to concat a string in go - http://goo.gl/hIj38X
	var buffer bytes.Buffer
	originalStr := []rune(str)
	for i := 0; i < len(str); {
		buffer.WriteString(string(originalStr[i])) // append the char first
		countSame := countSame(originalStr, i)
		buffer.WriteString(fmt.Sprintf("%d", countSame)) // append its count then
		i = i + countSame
	}
	stringReturn := buffer.String()
	if len(stringReturn) > len(str) {
		return str
	}
	return stringReturn
}
