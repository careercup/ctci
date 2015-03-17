package main
/*
    Given a circular linked list, implement an algorithm which returns node at the beginning of the loop.

    DEFINITION
    Circular linked list: A (corrupt) linked list in which a node’s next pointer points to an earlier node, so as to make a loop in the linked list.

    EXAMPLE
    input: A -> B -> C -> D -> E -> C [the same C as earlier]
    output: C
*/
import (
    "../list"
    "fmt"
)

func getLoopBegin(l *list.List) *list.Node{
    pslow := l.Front()
    pfast := l.Front()
    for (pfast != nil && pfast.Next != nil) {
        pslow = pslow.Next
        pfast = pfast.Next.Next
        if (pslow == pfast) {
            /* both pointers have met so there is a loop */
            break
        }
    }
    /* if there was no loop */
    if pfast == nil || pfast.Next == nil {
		return nil
	}
    /* Now, pslow and pfast point to the meeting node */
    pslow = l.Front() // reset pslow to head
    /* Now both pointers are k steps away from the beginning of the loop */
    for (pslow != pfast) { // advance both pointers till they meet
        pslow = pslow.Next
        pfast = pfast.Next
    }
    return pfast
    /*
       Note: why are they both exactly k steps away?
       ---------------------------------------------

       let k be the num of steps from head to loopBeginNode
       let s be the num of steps from loopBeginNode to Meeting node
       pslow has previously travelled k + s nodes

       pfast been circulating the n circles in the ring (1 <= n).
       let r be the loop length
       then pfast has travelled s + nr to meet the pslow.
       Hence meeting point = (s + nr) = x { due to the loop }
       The total movement of pfast from head is k + s + nr.
       so from meeting node pfast needs to move k times to reach loopBeginNode.
       from head, k steps is needed to reach the loopBeginNode.
    */
}

func main() {
    l := new(list.List)
    l.PushFront(7)
    l.PushFront(3)
    nodeBreak := l.PushFront(2)
    l.PushFront(6)
    l.PushFront(5)
    nodeLoop := l.PushFront(4)
    l.PushFront(11)
    l.PushFront(8)
    // set cycle
    nodeBreak.Next = nodeLoop
    /*
        Now,
        8->11->4->5->6->2->3->7  || pslow & pfast meet @ 6i
               ^________|
    */
    fmt.Printf("The loop begins at: %v\n", getLoopBegin(l).Data )
    fmt.Printf("Answer must be    : %v\n", nodeLoop.Data)

}
