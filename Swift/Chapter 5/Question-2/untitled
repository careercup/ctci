
// Author: Prakash Natarajan (c) 2014
// Email: nprakashece@gmail.com | pn33@buffalo.edu
// License: GNU GPLv3

import UIKit

class Question5_2 {
    func binary2(var num:Double) -> String {
        if(num <= 0 || num >= 1)
        { return "ERROR" }
        var binary:String = "."
        while (num > 0.0) {
            if(binary.utf16Count > 32) { return "ERROR" }
            
            var r = num * 2
            if(r >= 1) {
                binary += "1"
                num = r - 1
            }
            else {
                binary += "0"
                num = r
            }
        }
        return binary
    }

}

var pgm = Question5_2()
pgm.binary2(0.125)

