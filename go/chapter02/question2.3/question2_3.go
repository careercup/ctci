// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 Algorithm DELETE_NODE(node):
 1.Get the pointer to the node
 2.if node==nil || node.next == nil then return false
 3.l.remove(node)
 4.return true
*/

package main

import (
	"container/list"
	"fmt"
)

func main() {

	l := list.New()
	l.PushFront(4)
	l.PushFront(5)
	e4 := l.PushFront(7)
	l.PushFront(6)
	l.PushBack(9)
	res := deleteNode(l, e4)
	fmt.Println(res)

	for e:=l.Front(); e!=nil;e=e.Next() {
		fmt.Println(e.Value)
	}

}
func deleteNode(l *list.List, node *list.Element) bool {

	if node == nil || node.Next() == nil {
		return false
	}
	l.Remove(node)
	return true
}
