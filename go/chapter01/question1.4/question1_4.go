// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

// Write a method to replace all spaces in a string with ‘%20’

/*
 Algorithm REPLACE_SPACE_BY_STRING(str): 
 1.Get the input string str
 2.Find the length of the string
 3.Identify the total number of spaces in the string
 4.Create an array of size (len(str)+(2*spaceCount))
 5.Copy each character to the array . When you find ' ' copy '%20' to the array instead of ' '
 6.return the array
*/
package main

import (
	"fmt"
)

func main() {
	str := " Helo Worl d! "
	fmt.Println("Input String :", str)
	fmt.Println(replaceSpaceByString(str))
}

func replaceSpaceByString(str string) []string {
	length := len(str)
	var count int

	for i := 0; i < length; i++ {
		ch := string([]rune(str)[i])
		if ch == " " {
			count++
		}
	}
	newLength := length + (2 * count)
	var sArr = make([]string, newLength)
	j := 0
	for i := 0; i < length; i++ {
		ch := string([]rune(str)[i])

		if ch == " " {
			sArr[j] = "%"
			j = j + 1
			sArr[j] = "2"
			j = j + 1
			sArr[j] = "0"
			j = j + 1
		} else {
			sArr[j] = ch
			j = j + 1
		}
	}
	return sArr
}
