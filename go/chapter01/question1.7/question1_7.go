// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>
/*
 Algorithm MAKE_COL_ROW_NULL(arr): 
 1.Get the input array arr
 2.calculate row length and column length as [rowLen, colLen]
 3.Initialize two boolean arrays for rwo and column
 4.Identify the elements which has the value 0 in the input array and update the boolean arrays
 	for i from 1 to rowLen
 		for j from 1 to colLen
 			if arr[i][j]==0
 				rowLen[i] = true
 				colLen[j] = true

 5.for i from 1 to rowLen
 		for j from 1 to colLen
 			if rowLen[i] or colLen[j]
 				arr[i][j] = 0
 6.return arr
*/

package main

import (
	"fmt"
)

//Main function
func main() {
	arr:=[][]int{{1,2,3},{0,4,5},{6,0,8}}
	fmt.Println("Input : ", arr)
	fmt.Println("Output : ",makeColRowAsNull(arr))
}
//Function to make the entire row or column as 0 if any row or col val is 0
func makeColRowAsNull(arr [][]int)[][]int {

	rowLen := len(arr)
	colLen := len(arr[0])

	var rowBoolArr = make([]bool,rowLen)
	var colBoolArr = make([]bool, colLen)

	for i:=0;i<rowLen;i++ {
		for j:=0;j<colLen;j++ {
			if arr[i][j]==0{
				rowBoolArr[i] = true
				colBoolArr[j] = true
			}
		}
	}

	for i:=0;i<rowLen;i++ {
		for j:=0;j<colLen;j++ {
			if rowBoolArr[i] || colBoolArr[j]{
				arr[i][j] = 0
			}
		}
	}
	return arr
}
