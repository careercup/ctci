package Question1_6

// Given an N X N integer matrix, rotate it by 90 degrees in place.
import (
    "bytes"
    "fmt"
)

type matrixNN [][]int32

// helper function to print a matrix
func (mat matrixNN) String() string {
    var buffer bytes.Buffer
    buffer.WriteString(fmt.Sprintf("\n%v x %v Matrix\n", len(mat), len(mat)))
    for _, rowArr := range mat {
        buffer.WriteString("  ")
        for _, elem := range rowArr {
            buffer.WriteString(fmt.Sprintf("%v  ", elem))
        }
        buffer.WriteString("\n")
    }

    return buffer.String()
}
// helper function to compare matrices
func (mat matrixNN) compare(mat2 matrixNN) bool {
    if (len(mat) != len(mat2)) {
         return false
    }
    for rowIndex, rowArr := range mat {
        for i := 0; i < len(rowArr); i++ {
            if(rowArr[i] != mat2[rowIndex][i]) {
                return false
            }
        }
    }
    return true
}
/*
    The key is to solve this problem in “layers” from outer ones to inner ones.
    At each layer we are gonna loop through the elements and swap them as follows:
    1- Save the ith element in the top array in a temporary variable.
    2- Move the ith element from left to top.
    3- Move the ith element from bottom to left.
    4- Move the ith element from right to bottom.
    5- Save the value of our temporary variable in the ith position in the right array.
*/
func (mat matrixNN) rotate90() {
    n := len(mat)
    layers := n / 2
    length := n - 1
    for layer := 0; layer < layers; layer++ { // loop from outer layer till inner most layer
			for i := layer; i < length-layer; i++ { // index of each element (except last) in the top row of layer
				top := mat[layer][i] // save top
				// left -> top
				mat[layer][i] = mat[length - i][layer];
				// bottom -> left
				mat[length - i][layer] = mat[length - layer][length - i];
				// right -> bottom
				mat[length - layer][length - i] = mat[i][length - layer];
				// top -> right
				mat[i][length - layer] = top; // right <- saved top
			}
		}
}

func main() {
    mat := matrixNN{{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}
    fmt.Println(mat)
}
