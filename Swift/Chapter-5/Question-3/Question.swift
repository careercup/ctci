/*
Given a positive integer, print the next smallest and the next largest number that have the same number of 1 bits in their binary representation.
*/

import Cocoa

/* 
@param: c:Int Input Number
@return: returns the next Higher number with the same number of 1's
*/
func nextHiger(x:Int) -> Int {
    var rightOne:Int
    var nextHigherOneBit:Int
    var rightOnesPattern:Int
    
    var next = 0;
    if(x > 0)
    {
        
        // right most set bit
        rightOne = x & -x;
        
        // reset the pattern and set next higher bit
        // left part of x will be here
        nextHigherOneBit = x + rightOne;
        
        // nextHigherOneBit is now part [D] of the above explanation.
        
        // isolate the pattern
        rightOnesPattern = x ^ nextHigherOneBit;
        
        // right adjust pattern
        rightOnesPattern = (rightOnesPattern)/rightOne;
        
        // correction factor
        rightOnesPattern >>= 2;
        
        // rightOnesPattern is now part [A] of the above explanation.
        
        // integrate new pattern (Add [D] and [A])
        next = nextHigherOneBit | rightOnesPattern;
    }
    return next
}


//tested in Playground
//nextHiger(32) 




