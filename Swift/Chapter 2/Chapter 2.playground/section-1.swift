// Cracking the coding interview
// Chapter 2 

import Foundation

// MARK: Simple Linked list implementation
class Node {
    var data: Int
    var next: Node?
    
    init(data:Int) {
        self.data = data
    }
    
    func addToTailWithData(data:Int) {
        var next = Node(data: data)
        var node = self
        while (node.next != nil) {
            node = node.next!
        }
        node.next = next
    }
    
    func deleteNode() ->  Node? {
        var node: Node? = self
        if let next = self.next {
            node!.data = next.data
            node!.next = next.next
        } else {
            node = nil
        }
        return node
    }
    
    func toString() -> String {
       
        var string = ""
        var node = self
        while (node.next != nil) {
            string += "\(node.data)->"
            node = node.next!
        }
        string += "\(node.data)->"
        string += "nil"
        return string
    }
}



// MARK: Question 2.1
extension Node {
    
    /// Remove duplicates nodes using a buffer
    func removeDuplicates() {
        var buffer = [Int:Bool]()
        var node = self
        buffer[node.data] = true
        while (node.next != nil) {
            if buffer[node.next!.data] == true {
                node.next = node.next!.deleteNode()
            } else {
                buffer[node.next!.data] = true
                node = node.next!
            }
        }
    }
    
    /// Remove duplicates nodes without buffer
    func removeDuplicatesWithoutBuffer() {
        var node = self
        while (node.next != nil) {
            
            var runner: Node? = node.next
            var previous = node
            while (runner != nil) {
                if node.data == runner?.data {
                    runner = runner?.deleteNode()
                }
                runner = runner?.next
            }
            node = node.next!
        }
    }
}


// MARK: Question 2.2
extension Node {
    
    func kthToLast(kth:Int) -> Node? {
        var k: Node? = head
        var end: Node? = head
        var count = 0
        while (count < kth-1 && end?.next != nil) {
            end = end?.next!
            count++
        }
        while (end?.next != nil) {
            k = k?.next
            end = end?.next
        }
        return k
    }
    
}

// MARK: Test Questions
var head = Node(data: 10)
head.addToTailWithData(11)
head.addToTailWithData(12)
head.addToTailWithData(13)
head.addToTailWithData(11)
head.addToTailWithData(10)
head.addToTailWithData(14)
println(head.toString())

head.removeDuplicates()
println(head.toString())

head = head.kthToLast(5)!
println(head.toString())







