// Playground - noun: a place where people can play

import Cocoa

// 1.1

extension String {
    
    func isUnique() -> Bool {
        var countMap = [Character:Bool]()
        for c in self {
            
            if let count = countMap[c] {
                return false
            }
            
            countMap[c] = true
        }
        
        return true
    }
    
    func isUniqueWithoutAdditionalDataStructure() -> Bool {
        
        let strArray = Array(self)
        let strLen = countElements(strArray)
        
        for i in (0..<strLen) {
            
            for j in (0..<strLen) {
                
                if strArray[i] == strArray[j] && i != j {
                    
                    return false
                }
            }
        }
        
        return true
    }
    
    //added O(len) solution
    func isContainsDuplicate() -> Bool { //time: O(len)
        var str = Array(self)
        var strLen = countElements(str)
        if strLen > 256 { return false }
        var char_set = [Bool](count: 256, repeatedValue: false)
        var containerAsCString = Array(self.utf8).map { CChar($0) } + [0]
        for i in (0..<strLen) {
            var index = containerAsCString[i].hashValue //to get the value of the character
            if char_set[index] {
                return true
            }
            char_set[index] = true
        }
        return false
    }
}

println("hello".isUnique())
println("fox".isUnique())
println("hello".isUniqueWithoutAdditionalDataStructure())
println("fox".isUniqueWithoutAdditionalDataStructure())
println("hello".isContainsDuplicate())  //true
println("fox".isContainsDuplicate())    //false

// 1.2

extension String {
    
    func reverse() -> String {
        
        return reduce(self, "") { String($1) + $0 }
    }
}

println("abcd")
println("abcd".reverse())

// 1.3

extension String {
    
    func removeDuplicates() -> String {
        
        if countElements(self) < 2 {
            
            return self
        }
        
        var copy = Array(self)
        
        for i in (1..<countElements(copy)) {
            
            for j in (0..<i) {
                
                if copy[i] == copy[j] {
                    
                    copy[i] = "\0"
                }
            }
        }
        
        return String(copy)
    }
}

println("aabbcc")
println("aabbcc".removeDuplicates())
println("abc".removeDuplicates())
println("aaaa".removeDuplicates())

// 1.4

extension String {
    
    func isAnagram(var Of s2: String) -> Bool {
    
        if countElements(self) != countElements(s2) {
            
            return false
        }
        
        var strArray = Array(self)
        var s2Array = Array(s2)
        sort(&strArray)
        sort(&s2Array)
        
        return strArray == s2Array
    }
}

println("hello".isAnagram(Of: "olhe"))
println("hello".isAnagram(Of: "ollhe"))

// 1.5

extension String {
    
    func replaceSpaces() -> String {
        
        return reduce(self, "") { (var s, c) -> String in
            
            if c == " " {
                return s + "%20"
            }
            s.append(c)
            return s
        }
    }
}

println("hello, world")
println("hello, world".replaceSpaces())

// 1.6

func rotate(inout matrix: [[Int32]]) {
    
    let n = countElements(matrix)
}

var rot_matrix = [
    [ 1, 4, 5, 3],
    [ 2, 5, 6, 7],
    [ 8, 1, 1, 1],
    [ 7, 2, 4, 9]
]

// 1.7

func clearRowsAndColumns(inout matrix: [[Int]]) {
    
    var zeros = [(Int, Int)]()
    let nLen = countElements(matrix)
    let mLen = countElements(matrix[0])
    
    for i in (0..<nLen) {
        
        for j in (0..<mLen) {
            
            if matrix[i][j] == 0 {
                
                zeros.append((Int(i), Int(j)))
            }
        }
    }
    
    for (n, m) in zeros {
        
        for i in (0..<mLen) {
            
            matrix[n][i] = 0
        }
        
        for i in (0..<nLen) {
            
            matrix[i][m] = 0
        }
    }
}

var matrix = [
    [ 1, 4, 5, 0],
    [ 2, 5, 6, 7],
    [ 0, 1, 1, 1]
]
println(matrix)
clearRowsAndColumns(&matrix)
println(matrix)

// 1.8

extension String {
    
    func isRotatedSubstring(Of s2: String) -> Bool {
        
        return NSString(string: self + self).containsString(s2)
    }
}

println("bottle".isRotatedSubstring(Of: "lebot"))
println("waterbottle".isRotatedSubstring(Of: "erbottlewat"))