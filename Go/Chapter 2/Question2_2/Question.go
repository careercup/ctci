/*
 * Implement an algorithm to find the kth to last element
 * of a singly linked list.
 */
package main

import (
    "../list" //  this implements a singly linked list
    "fmt"
)
 /*
    The algorithm is for single linked lists and can be used for
    doubly linkedlist too
 */

/* Recursive helper function for the algorithm */
func nthToLastHelper(headElem *list.Node, n int, count *int) *list.Node{
    if (headElem == nil) {
        return nil
    }
    nd := nthToLastHelper(headElem.Next, n, count);
	(*count) = (*count) + 1
	if ((*count) == n) {
		return headElem;
	}
	return nd;
}
// if n = 2, find the 2nd element from the last node
func nthToLast(head *list.List, n int) *list.Node {
    if (head.Front() == nil || n > head.Len()) {
        return nil
    }
    counter := 0
    return ( nthToLastHelper(head.Front(), n, &counter) )
}

func main() {
    l := list.RandomLinkedList(10, 1, 15)
    fmt.Printf("The List: %v\n", l)
    where := list.RandIntBetween(1,10)
    elem := nthToLast(l, where)
    if(elem != nil) {
        fmt.Printf("nthToLast(%v) : %v", where, elem.Data)
    } else {
        fmt.Printf("Out of bounds!!!")
    }
}
