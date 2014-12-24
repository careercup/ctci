// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 For ASCII
 Algorithm IS_PERMUTATION(str1, str2): 
 1.Get the input strings str1, str2
 2.Find the length of the strings
 3.If len(str1)!=len(str2) then return false
 4.create a map of type [string]int
 5.for i from 1 to len(str1)
		increment the count by 1 in the map
 6.for j from 1 to len(str2)
		decrement the count by 1
 7. Itreate throught the map
		if any value is not equal to zero then return false
	8.return true
*/

package main

import (
	"fmt"
)

var sMap map[string]int


func main() {	
	var inputMap = map[string]string{"apple": "papel","carrot":"tarroc","hello":"llloh",}
	for str1,str2 := range inputMap{	
	fmt.Println(str1,",",str2," Is Anagram? ",isPermutation(str1, str2))
	}
}

func isPermutation(str1, str2 string) bool {

	length1 := len(str1)
	length2 := len(str2)

	if length1 != length2 {
		return false
	}

	sMap = make(map[string]int)

	for i := 0; i < length1; i++ {
		ch := string([]rune(str1)[i])
		sMap[ch] = sMap[ch] + 1
	}

	for i := 0; i < length2; i++ {
		ch := string([]rune(str2)[i])
		sMap[ch] = sMap[ch] - 1
	}

	for k, _ := range sMap {
		//fmt.Println(k,sMap[k])	
		if sMap[k] != 0 {
			return false
		}
	}
	return true
}
