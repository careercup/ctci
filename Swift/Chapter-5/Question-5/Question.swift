/*
Write a function to determine the number of bits required to convert integer A to integer B
Input: 31, 14 Output: 2
*/

import Cocoa
/*
@param: a:Int Input first
@param: b:Int Input Two
@return Int 	Number of bit changes required
*/

func bitsRequiredToConvertAtoB(a:Int, b:Int) -> Int { //O(number of resulting bits in a ^ b)
    return numberOf1(a ^ b)
}

/* 
@param: c:Int Input Number
@return: returns the number of 1's present in the binary representation of the number
*/
func numberOf1(var c:Int) -> Int { //O(number of bits in c)
    var count = 0
    while(c != 0) {
        if ((c & 1) == 1 ) {
        count++
        }
        c = c >> 1
    }
    return count
}

//tested in Playground
//bitsRequiredToConvertAtoB(31, 30)




