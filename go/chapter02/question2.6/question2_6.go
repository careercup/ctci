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
	l.PushBack(0)
	l.PushBack(1)
	l.PushBack(2)
	l.PushBack(3)
	l.PushBack(4)
	l.PushBack(5)

	e6 := l.PushBack(6)
	l.PushBack(7)
	e8 :=l.PushBack(8)
	e9 := l.InsertAfter(9,e8)
	l.InsertBefore(e9, e6)

	for e:=l.Front() ; e !=nil ; e=e.Next() {
		fmt.Println(e.Value)
	}
	/*
	for i := 1 ;i < 100 ; i++ {
		l.PushBack(i)
	}*/
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
