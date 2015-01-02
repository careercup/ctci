

// Author: Prakash Natarajan (c) 2015
// Email: nprakashece@gmail.com | pn33@buffalo.edu
// License: GNU GPLv3

/*An array A contains all the integers from 0 through n, except for one number which is missing. In this problem, we cannot access an entire integer in A with a single opera- tion. The elements of A are represented in binary, and the only operation we can use toaccessthemis"fetchthejthbitofAfi]," whichtakesconstanttime.Writecodeto find the missing integer. Canyou do it in 0(n) time?
*/
/*
Algorithm
Start with least sig bit.
1. Count occurrence of 1's vs 0's.
2. There are 3 possibilities:

n is odd, so the number of 0 bits and 1 bits should be the same. They won't be, so the lower number is obviously the missing one.
n is even, so the number of 0 bits should be 1 greater than the number of 1 bits. If they're equal, it's the 0 bit that's missing.
As above, n is even. If the number of 0 bits is 2 greater than the number of 1 bits, the 1 bit is the missing one.
3.If count(1) < count(0) => the missing number has a 1 as it's least sig bit, else it has a 0.
4.Remove all numbers with least sig bit not matching result found in step 3.
5.Repeat steps 1->4, iterating from least sig bit -> 2nd least sig bit -> ... -> most sig bit
*/
import Cocoa


class Question5_7 {
    func  findMissing(var num:[Int]) -> Int{
        if(num.count == 0) {    //empty list
            println("Enter a valid array")
        }
        return findMissingHelper(num, size: num.count - 1)
        
    }
    
    func findMissingHelper(var num:[Int], var size:Int) -> Int {
        if( size < 0 ) { return 0 }
        var oneBit:[Int] = [],zeroBit:[Int] = []    //got variable not declared error so added []
        for element in num {
            if(element % 2) == 0 {
                zeroBit.append(element >> 1)
            } else {
                oneBit.append(element >> 1)
            }
        }
        if(zeroBit.count <= oneBit.count) {
            var v = findMissingHelper(zeroBit, size: zeroBit.count - 1)
            return v << 1
        }
        else {
            var v = findMissingHelper(oneBit, size: oneBit.count - 1)
            return (v << 1) | 1
        }
    }
    
}

var program = Question5_7()
var num = [0,1,2,3,5,6]

var result = program.findMissing(num)
result

