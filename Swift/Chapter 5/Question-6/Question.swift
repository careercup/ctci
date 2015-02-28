

// Author: Prakash Natarajan (c) 2014
// Email: nprakashece@gmail.com | pn33@buffalo.edu
// License: GNU GPLv3

import UIKit

class Question5_6 {
    func swapOddEvenBits(var x:Int) -> Int {
        // 0x55555555 = 1431655765 for even place masking
        // 0xaaaaaaaa = 2863311530 for odd place masking
        return ( ((x & 2863311530) >> 1) | ((x & 1431655765) << 1) )
    }
}

var pgm = Question5_6()
String(103217, radix:2)
var res = pgm.swapOddEvenBits(103217)
String(res, radix:2)



