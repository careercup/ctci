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
    
    func deleteNode(d:Int) {
        var head = self
        if self.data == d {
            if let next = head.next {
                head.data = next.data
                head.next = next.next
            }
            return
        }
        var node = head
        while (node.next != nil) {
            if node.next!.data == d {
                node.next = node.next!.next
                return
            }
            node = node.next!
        }
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
    func removeDuplicates() {
        var set = [Int:Bool]()
        var node = self
        while (node.next != nil) {
            if set[node.next!.data] == true {
                node.deleteNode(node.next!.data)
            } else {
                set[node.next!.data] = true
                node = node.next!
            }
        }
    }
}


var head = Node(data: 10)
head.addToTailWithData(11)
head.addToTailWithData(12)
head.addToTailWithData(13)
head.addToTailWithData(11)
head.addToTailWithData(14)
println(head.toString())

head.removeDuplicates()
println(head.toString())
