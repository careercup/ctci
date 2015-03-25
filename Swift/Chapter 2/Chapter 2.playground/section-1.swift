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

var head2_1 = Node(data: 10)
head2_1.addToTailWithData(11)
head2_1.addToTailWithData(10)
head2_1.addToTailWithData(12)
println(head2_1.toString())
head2_1.removeDuplicates()
println(head2_1.toString())




// MARK: Question 2.2
extension Node {
    
    func kthToLast(kth:Int) -> Node? {
        var k: Node? = self
        var end: Node? = self
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

var head2_2 = Node(data: 10)
head2_2.addToTailWithData(11)
head2_2.addToTailWithData(12)
head2_2.addToTailWithData(13)
println(head2_2.toString())
head2_2 = head2_2.kthToLast(2)!
println(head2_2.toString())



// MARK: Question 2.3
extension Node {
    
    func deleteCurrentNode() -> Bool {
        if let next = self.next {
            self.data = next.data
            if next.next != nil {
                self.next = next.next
            }else{
                self.next = nil
            }
            return true
        }else{
            return false
        }
    }
}


var head2_3 = Node(data: 10)
head2_3.addToTailWithData(11)
head2_3.addToTailWithData(12)
head2_3.addToTailWithData(13)
var nodeToDelete = head2_3.next?.next
nodeToDelete?.deleteCurrentNode()
print(head2_3.toString())




// MARK: Question 2.4
extension Node {
    
    func partitionByData(data:Int) -> Node {
        var firstPartition: Node?
        var secondPartition: Node?
        
        var node = self
        while (node.next != nil){
            if(node.data < data){
                if (firstPartition == nil ) {
                    firstPartition = Node(data: node.data)
                }else{
                    firstPartition!.addToTailWithData(node.data)
                }
            }else{
                if (secondPartition == nil) {
                    secondPartition = Node(data: node.data)
                }else{
                    secondPartition!.addToTailWithData(node.data)
                }
            }
            
            node = node.next!
        }
        
        if(node.data < data){
            if (firstPartition == nil ) {
                firstPartition = Node(data: data)
            }else{
                firstPartition!.addToTailWithData(node.data)
            }
        }else{
            if (secondPartition == nil) {
                secondPartition = Node(data: data)
            }else{
                secondPartition!.addToTailWithData(node.data)
            }
        }
        
        if firstPartition == nil {
            return secondPartition!
        }
        if secondPartition == nil {
            return firstPartition!
        }
        
        
        var endNode = firstPartition!
        while (endNode.next != nil){
            endNode = endNode.next!
        }
        
        endNode.next = secondPartition
        
        
        return firstPartition!
    }
    
}

var head2_4 = Node(data: 10)
head2_4.addToTailWithData(14)
head2_4.addToTailWithData(12)
head2_4.addToTailWithData(15)
head2_4.addToTailWithData(6)
head2_4.addToTailWithData(18)
head2_4.partitionByData(13)
print(head2_4.partitionByData(13).toString())


