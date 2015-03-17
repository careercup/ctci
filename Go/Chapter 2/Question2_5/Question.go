package main
/*
 * You have two numbers represented by a linked list, where
 * each node contains a single digit. The digits are stored
 * in reverse order, such that the 1's digit is at the
 * head of the list. Write a function that adds the two numbers
 * and returns the sum as a linked list.
 *
 * EXAMPLE
 * Input: (7->1->6) + (5->9->2). That is, 617 + 295.
 * Output: 2->1->9. That is, 912.
 *
 * FOLLOW UP
 *
 * Suppose the digits are stored in forward order. Repeat the above
 * problem.
 *
 * Example
 * Input: (6->1->7) + (2->9->5). That is, 617 + 295.
 * Output: 9->1->2. That is, 912.
 */
import (
    "../list"
    "fmt"
)

// O(n) time with O(1) space by overwriting one of the original lists.
func addListsA( la, lb *list.List)  {
    if (la.Head == nil || lb.Head == nil) { return  }
    // determine if a list is longer and if so, pad that list
    if (la.Len() > lb.Len()) {
        padList(lb, la.Len() - lb.Len())
    }
    if (lb.Len() > la.Len()) {
        padList(la, lb.Len() - la.Len())
    }
    /*
        start from head of both,
        add them and watch the carry,
        propagate to next node on both,
        use the carry.
    */
    node1 := la.Front()
    node2 := lb.Front()
    carry := 0
    tail := la.Front() // to find the tail of Node1 for last carry usage
    for node2 != nil {
        val := node1.Data + node2.Data + carry
        if(val > 9) {
            carry = 1
            val = val - 10
        } else {
            carry = 0
        }
        node1.Data = val
        if (node1.Next == nil) {
            tail = node1
        }
        node1 = node1.Next
        node2 = node2.Next
    }
    // if the final digit had a carry we need to add 1 to the tail
    if (carry == 1) {
       tail.Next = new(list.Node)
       tail.Next.Data = 1
    }
}
/*
    Input: (6->1->7) + (2->9->5). That is, 617 + 295.
    Output: 9->1->2. That is, 912.
*/
// O(n) time and O(1) space
func addListsB( la, lb *list.List) {
    if (la.Head == nil || lb.Head == nil) { return  }
    reverseList(la)
    reverseList(lb)
    addListsA(la, lb)
    reverseList(la)
}

func reverseList(l *list.List) {
    if (l.Front() == nil ) {
        return
    }
    var result *list.Node = nil
    current := l.Front()
    for current != nil {
        next := current.Next // tricky: note the next node
        current.Next = result // move the node onto the result
        result = current // go to the head of resultList
        current = next // continue to the yet-to-be seen nodes
    }
    l.Head = result
}
// helper function to pad the list with a different length with zeros
func padList(l *list.List, pad int) {
    count := 0
    e := l.Front()

    // get to the tail
    for e.Next != nil {
        e = e.Next;
    }
    // add pad number of new Nodes
    for count != pad {
        e.Next = new(list.Node)
        e = e.Next
        e.Data = 0
        e.Next = nil
        count++
    }
}
// (7->1->6) => 617
func listsToIntBackward(n *list.Node) int {
    val := 0
    if (n.Next != nil) {
        val = (10 * listsToIntBackward(n.Next))
    }
    return val + n.Data
}
// (7->1->6) => 716
func listsToIntForward(n *list.Node) int {
    val := 0
    for n != nil {
        val = (val * 10) + n.Data
        n = n.Next
    }
    return val
}

func main() {
    la := list.ParseAndBuildList("7->1->6")
    lb := list.ParseAndBuildList("5->9->2")
    fmt.Printf("A list  : %v\nB list  : %v\n", la, lb)
    addListsA( la, lb )
    fmt.Printf("sum list: %v Must get: %q\n", la, "2->1->9")
    lA := list.ParseAndBuildList("6->1->7")
    lB := list.ParseAndBuildList("2->9->5")
    fmt.Printf("\nA list  : %v\nB list  : %v\n", lA, lB)
    addListsB( lA, lB )
    fmt.Printf("sum list: %v Must get: %q\n", lA, "9->1->2")
}
