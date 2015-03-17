package main
/*
 * Write code to partition a linked list around a value x,
 * such that all nodes less than x come before all nodes
 * greater than or equal to x.
 */

import (
    "../list" //  this implements a doubly linked list
    "fmt"
)

func splitX(l *list.List, x int) {
    beforeX := new(list.List)
    afterX := new(list.List)
    /* partition list */
    for e := l.Front(); e != nil; {
        next := e.Next
        if (e.Data < x) {
            /* Insert to before List */
            e.Next = beforeX.Head
            beforeX.Head = e
        } else {
            /* Insert to after List */
            e.Next = afterX.Head
            afterX.Head = e
        }
        e = next
    }
    /* merge beforeX and afterX */
    if (beforeX == nil) {
        l.Head = afterX.Head
        return
    }
    l.Head = beforeX.Head
    /* get the tail of beforeX */
    e := beforeX.Front()
    for e.Next != nil { e = e.Next }
    /* set the next of tail */
    e.Next = afterX.Head
}

func buildList() *list.List {
    l := new(list.List)
	l.PushFront(7)
	l.PushFront(5)
	l.PushFront(3)
	l.PushFront(4)
	l.PushFront(5)
    l.PushFront(1)
    l.PushFront(2)
    return l
}

func main() {
    l := buildList()
    fmt.Printf("The list: %v\n", l)
    splitX(l, 4)
    fmt.Printf("After   : %v\n", l)
}
