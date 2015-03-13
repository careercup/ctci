// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 Algorithm DELETE_NODE(node):
 1.Get the pointer to the node
 2.if node==nil || node.next == nil then return 
 3.node.Value = node.next.Value
 4.node.next = node.next.next
*/

package main

import (
	"fmt"
	"go/chapter02/list"
)

func main() {
	m := list.New()
	m.PushFront(4)
	m.PushFront(5)
	e4 := m.PushFront(7)
	m.PushFront(6)
	m.PushBack(9)

	//removeInPlace function is the tweak in the original list. newly appened function in the list package "go/chapter02-linkedlists/list"

	m.RemoveInPlace(e4)
	fmt.Println("In Place ")
	for f := m.Front(); f != nil; f = f.Next() {
		fmt.Println(f.Value.(int))
	}
}
