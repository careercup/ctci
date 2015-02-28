/*
You are given two 32-bit numbers,N andM, andtwobitpositions, i andj. Write a method to insert Minto Nsuch that Mstarts at bit j and ends at bit i. Youcan assume that the bits j through i have enough space to fit all ofM. That is,ifM= 10011, you can assume that there are at least 5 bits between j and i. You would not, for example,havej-3 andi=2,becauseMcouldnotfully fitbetweenbit3andbit2.
EXAMPLE:
Input:N=16000000000, M=10011, i =2, j =6 Output: N = 10001001100
*/

import Cocoa
/* 
@param: n:Int
@param: bitPosition:Int
@return: Int bits cleared at position bitPosition
*/
func clearBit(n:Int, bitPosition:Int) -> Int {
    var mask = ~(1 << (bitPosition))
    return ((n) & (mask))
}
/*
@param: m:Int value which has to be changed
@param: i:Int Ending position of replacement
@param: j:Int Starting position of replacement
@return: Int result with bits cleared from j to i(including)
*/
func clearBitsBetweenIandJ(var m:Int,var i:Int, j:Int) -> Int{
    if(i >= j) {return m }    //base case
    for var count = i; count <= j; count++ {
    m = clearBit(m, count)
    }
    return m
}
/*
@param: m:Int value which has to be changed
@param: n:Int value which has to be inserted
@param: i:Int Ending position of replacement
@param: j:Int Starting position of replacement
@return: result with the elements cleared and replaced
*/
func setAllBits(n:Int, var m:Int,var i:Int, j:Int) -> Int {
    //clear bits for n
    var result = clearBitsBetweenIandJ(n,i,j)
    return (result | (m << (i)))    //Or with n to get the correct value
}

var r = setAllBits(1023, 0b00010011, 2, 6) //1111001111
println(String(r, radix:2))
r = setAllBits(1024, 0b00010011, 2, 6) //10001001100
println(String(r, radix:2))




