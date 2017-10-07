// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

// Write a method to replace all spaces in a string with ‘%20’
/*
 Algorithm COMPRESS_STRING(str): 
 1.Get the input string str
 2.Find the length of the string
 3.Get the 0th element as lastChar
 4.Initialize the count as 1
 5.for i from 1 to len(str)
		currentChar=str[i]
		if(currentChar!=lastChar) then append lastChar and count to resultString
		else 
			count++
			lastChar=currentChar
 6.Finally append the lastChar and count to resultString - [edge case]
 7.return resultString
*/

package main

import (
	"fmt"
	"strconv"
	"bytes"	
)

var sMap map[string]int

//Main function
func main() {
	str := "aaabbccccdd"
	fmt.Println("Input String :", str)
		
	legacyOut:=compressString(str)
	fmt.Print("Legacy Compress : ")
	for _,value:=range legacyOut{
	fmt.Print(value)
	}
	fmt.Println("\nPotential compress",potentialCompressString(str))
}

//Function to compress the string
func compressString(str string) []string {
	length := len(str)
	if str == "" {
		return nil
	}
	var count int = 1
	lastChar := string([]rune(str)[0])
	j := 0
	var resArr = make([]string, 2*length)
	for i := 1; i < length; i++ {
		currentChar := string([]rune(str)[i])
		if currentChar == lastChar {
			lastChar = currentChar
			count++
		} else {
			resArr[j] = lastChar
			j = j + 1
			resArr[j] = strconv.Itoa(count)
			j = j + 1
			count = 1
			lastChar = currentChar
		}
	}
	resArr[j] = lastChar
	j = j + 1
	resArr[j] = strconv.Itoa(count)

	return resArr
}

//Function to compress the string [potential]
func potentialCompressString(str string)string {
	length := len(str)
	if str == "" {
		return ""
	}
	var count int = 1
	lastChar := string([]rune(str)[0])
	
	var sBuffer bytes.Buffer
	for i := 1; i < length; i++ {
		currentChar := string([]rune(str)[i])
		if currentChar == lastChar {
			lastChar = currentChar
			count++
		} else {
			sBuffer.WriteString(lastChar)
			sBuffer.WriteString(strconv.Itoa(count))
			count = 1
			lastChar = currentChar
		}
	}
	sBuffer.WriteString(lastChar)
	sBuffer.WriteString(strconv.Itoa(count))

	return sBuffer.String()
}
