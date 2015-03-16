package main
/*
 * Implement an algorithm to delete a node in the middle of a
 * singly linked list, given only access to that node.
 * EXAMPLE
 * Input: the node c from the linked list a->b->c->d->e
 * Result: nothing is returned, but the new linked list looks like
 * a->b->d->e
 */
import (
    "../list"
    "fmt"
)

func removeMiddle(l *list.List, elem *list.Node) {
    if(elem == nil || l.Front() == nil) {
        return
    }
    for e := l.Front(); e != nil; e = e.Next {
        if e.Next == elem {
            e.Next = e.Next.Next
            elem.Next = nil
            elem = nil
            l.DecrementLen()
            return
        }
    }
}
func main() {
    l := new(list.List)
    l.PushFront(5)
    l.PushFront(7)
 	e := l.PushFront(6)
 	l.PushFront(5)
 	l.PushFront(4)
    l.PushFront(3)
    l.PushFront(4)
    fmt.Printf("The List: %v\n", l)
    removeMiddle(l, e)
    fmt.Printf("removeMiddle(6) : %v\n", l)
}
