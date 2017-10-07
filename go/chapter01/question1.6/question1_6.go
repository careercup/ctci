// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 Algorithm ROTATE_ARRAY(matrix, n): 
 1.Get the input array matrix and size n
 2.for layer from 1 to n/2
		first = layer
		last = n-layer-1
		for i=first to last
			offset = i-first
			top = matrix[first][i]
			matrix[first][i] = matrix[last-offset][first]
			matrix[last-offset][first] = matrix[last][last-offset]
			matrix[last][last-offset] = matrix[i][last]
			matrix[i][last] = top
3. return matrix
*/
package main

import (
	"fmt"
)

//Main function
func main() {
	matrix := [][]int{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}
	fmt.Println("Input : ", matrix)
	fmt.Println("Output : ",rotateMatrix(matrix, len(matrix)))
}

//Function to rotate the matrix
func rotateMatrix(matrix [][]int, n int) [][]int {
	for layer := 0; layer < n/2;layer++ {
		first := layer
		last := n - 1 - layer
		for i := first; i < last;i++ {
			offset := i - first
			top := matrix[first][i]
			matrix[first][i] = matrix[last-offset][first]
			matrix[last-offset][first] = matrix[last][last-offset]
			matrix[last][last-offset] = matrix[i][last]
			matrix[i][last] = top
		}
	}

	return matrix
}
