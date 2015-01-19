
// Author: Prakash Natarajan (c) 2015
// Email: nprakashece@gmail.com | pn33@buffalo.edu
// License: GNU GPLv3


import UIKit

// 20.1
/*
Write a function that adds two numbers. You should not use + or any arithmetic op- erators.
*/
/* algorithm:
1) calculate the sum part and carry part
2) add the parts individually
*/

func sum(var a:Int, var b:Int) -> Int {
    var sum = 0;
    var carry = 0;
    while(b != 0) {
        sum = a ^ b;
        carry = (a & b) << 1;
        (a, b) = (sum, carry)
    }
    return a
}


//play ground samples
sum(-1,1)
sum(2,3)