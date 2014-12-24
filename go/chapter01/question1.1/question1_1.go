// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
Algorithm IS_DUPLICATE_EXIST(str):
 1.Get the input string
 2.Create a map of [string]boolean
 4.For i from 1 to n iterate through the characters ch of the string
		if ch present in the map then return false
		else put ch to the map --> map[ch]=true
	5.return true
*/
package main

import (
	"fmt"
)

var sMap map[string]bool

func main() {

	words:=[]string{"abcde", "hello", "apple", "kite", "padle"};
	for _,value:=range words {
		fmt.Println("Input : ",value," Is Unique? ",isUnique(value))
	}
}

func isUnique(str string) bool {

	sMap = make(map[string]bool)
	var ch string
	for i := 0; i < len(str); i++ {
		ch = string([]rune(str)[i])
		if sMap[ch] {
			return false
		} else {
			sMap[ch] = true
		}
	}
	return true
}
