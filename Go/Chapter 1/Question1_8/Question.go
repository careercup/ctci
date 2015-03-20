package Question1_8

/*
 * Assume you have a method isSubstring which checks if one word is a
 * substring of another. Given two strings, s1 and s2, write code to check
 * if s2 is a rotation of s1 using only one call to isSubstring
 * (e.g., "waterbottle" is a rotation of "erbottlewat").
 */

import (
    "strings"
)

func isRotation(s1, s2 string) bool {
	length1 := len(s1)
	if(length1 == len(s2) && length1 > 0) {
        /* Double the original string and check whether the rotated is a substring of it*/
        s1s1 := s1+s1
        if strings.Contains(s1s1, s2){
            return true
        }
	}
	return false
}
