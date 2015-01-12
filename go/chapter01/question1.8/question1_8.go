// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

// Write a method to replace all spaces in a string with ‘%20’
/*
 Algorithm IS_ROTATED_STRING(str): 
 1.Get the input strings str1 and str2
 2.Find the length of the strings
 3.if len(str1) != len(str2) then return false
 4.get the concatenated string concatStr=str1+str1
 5.if substr(concatStr,str2) then return true
		else return false
*/

package main

import (
	"fmt"
	"strings"
)

//Main function
func main() {
	inputMap:=map[string]string{"apple":"pleap", "waterbottle":"erbottlewat", "camera":"macera"}
	
	for str1,str2:=range inputMap{
		fmt.Println(str1,str2," Is Rotated? ",isRotatedString(str1, str2))
	}

}
//Function to verify whether the first string is the left rotation of the string
func isRotatedString(str1,str2 string)bool {

	if str1 == ""{
		return false
	}
	if str2 == ""{
		return false
	}
		
	length1 := len(str1)
	length2 := len(str2)
	
	if(length1 != length2){
		return false
	}
	
	concatStr:=str1+str1
	if strings.Contains(concatStr,str2){
	return true
	}		
	
	return false
}
