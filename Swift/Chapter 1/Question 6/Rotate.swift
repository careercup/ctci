

// Author: Prakash Natarajan (c) 2015
// Email: nprakashece@gmail.com | pn33@buffalo.edu
// License: GNU GPLv3


import UIKit

// 1.6
/*
Given an image represented by an NxN matrix, where each pixel in the image is 4
bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
*/
/* algorithm:
1)get the transpose of the input
2) swap first and Nth column, second and N-1th column until u reach the N/2th column
*/
class Rotate {
    /* @param: number of rows and column
        @return: array initialised to 0 
*/
    func initialiseTo0( numRow:Int, numCol:Int) -> [[Int]] {
    var InitArray = [[Int]]()
    for col in 0...(numCol-1) {
        InitArray.append(Array(count: numRow, repeatedValue: Int()))
    }
    return InitArray
    }
    /*@param:inp array, num of rows and columns
@return: transpose array
*/
    func transpose( inp:[[Int]], numRow:Int, numCol:Int) -> [[Int]] {
        var tArray:[[Int]] = initialiseTo0(numRow, numCol: numCol)
        for(var i = 0; i < numRow; i++) {
        for(var j = 0; j < numCol; j++) {
            tArray[j][i] = inp[i][j]
        }
        }
        return tArray
    }
    
    func rotate(inout inp: [[Int]], numRow:Int, numCol:Int) {
        inp = transpose(inp, numRow: numRow, numCol: numCol)
        var end:Int = numCol
        for i in 0...(numCol/2) {
            end = end - 1
            swapCol(&inp, startColumn: i, endColumn: end, rowCount: numRow );
        }
    }
    //to swap the columns
    func swapCol(inout a:[[Int]], startColumn:Int, endColumn:Int, rowCount:Int) {
        var temp:Int
        for j in 0...(rowCount-1) {
            temp = a[j][startColumn]
            a[j][startColumn] = a[j][endColumn]
            a[j][endColumn] = temp
        }
    }
}

//Validation
var program = Rotate()
var a = [
    [ 1, 2, 3],
    [ 4, 5, 6],
    [ 7, 8, 9]
]
program.rotate(&a, numRow: 3, numCol: 3)
a