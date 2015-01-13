// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>


/*
 Algorithm FIND_LOOP_STARTING_POINT(list):
 1.Get the input list
 2.if list==nil return nil
 3.Make pointers head, fast and slow
 4.move slow pointer once while fast pointer moves twice on every iteration
 5.if slow == fast then break
 6.if fast == nil || fast.next == nil then return nil
 7.slow = head
 8.Now move slow pointer once while fast pointer moves once on every iteration until slow == fast
 9.return fast  
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
	l.PushFront(7)
	l.PushFront(9)

	res := findLoopsInList(l)
	fmt.Println(res.Value.(int))
	fmt.Println(" ")

}

func findLoopsInList(l *list.List) *list.Element {

	if l == nil {
		return nil
	}

	var head *list.Element
	var slow *list.Element
	var fast *list.Element

	head = l.Front()
	for slow, fast = l.Front(), l.Front(); slow != nil && fast != nil; slow, fast = slow.Next(), fast.Next().Next() {
		if slow == fast {
			break
		}
	}

	if fast == nil || fast.Next() == nil {
		return nil
	}
	slow = head
	for ;slow != fast; {
		slow = slow.Next()
		fast = fast.Next()
	}
	return fast
}
