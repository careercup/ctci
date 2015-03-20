package Question1_7

/*
 * Write an algorithm such that if an element in an MxN matrix is 0,
 * its entire row and column are set to 0.
 */
import (
    "bytes"
    "fmt"
)

type matrixMN [][]int32

// helper function to print a matrix
func (mat matrixMN) String() string {
    var buffer bytes.Buffer
    buffer.WriteString(fmt.Sprintf("\n%v x %v Matrix\n", len(mat), len(mat[0])))
    for _, rowArr := range mat {
        buffer.WriteString("  ")
        buffer.WriteString(fmt.Sprintf("%v", rowArr))
        buffer.WriteString("\n")
    }

    return buffer.String()
}
// helper function to compare matrices
func (mat matrixMN) compare(mat2 matrixMN) bool {
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

func (mat matrixMN) setZeroes() {
    noOfRows := len(mat)
    noOfCols := len(mat[0])
    rowZeros := make([]bool, noOfRows)
    colZeros := make([]bool, noOfCols)
    // find the rows and cols with zero elems
    for i := 0; i < noOfRows; i++ {
        for j := 0; j < noOfCols; j++ {
             if(mat[i][j] == 0) {
                 rowZeros[i] = true
                 colZeros[j] = true
             }
		}
	}
    // Nullify rows
    for i, elem := range rowZeros {
        if(elem) {
            for j := 0; j < noOfCols; j++ {
                mat[i][j] = 0
            }
        }
    }
    // Nullify Cols
    for j, elem := range colZeros {
        if(elem) {
            for i := 0; i < noOfRows; i++ {
                mat[i][j] = 0
            }
        }
    }
}
