// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
Algorithm REMOVER_DUPLICATES(list): [Without using temp buffer]
 1.Get the input linked list
 2.Create a map of [string]boolean
 4.For e from first to last node iterate through the nodes m of the list
 		for f from e to last node iterate through the nodes n of the list
			if m==n then remove f 
 5.return list
*/
package main

import (
	"container/list"
	"fmt"
)

var sMap map[int]bool

func main() {
	l := list.New()
	l.PushFront(4)
	l.PushFront(5)
	l.PushFront(7)
	l.PushFront(6)
	l.PushFront(5)
	l.PushFront(4)
	l.PushFront(5)
	l.PushFront(7)
	l.PushBack(9)
	l = removeDuplicate(l)
	for e := l.Front(); e != nil; e = e.Next() {
		fmt.Println(e.Value)
	}
}
func removeDuplicate(l *list.List) *list.List {
	var next *list.Element
	var inNext *list.Element
	for e := l.Front(); e != nil; e = next {
		m := e.Value.(int)
		next = e.Next()
		for f := e; f != nil; f = inNext {
			n := f.Value.(int)
			inNext = f.Next()
			if e != f {
				if m == n {
					l.Remove(f)

				}
			}
		}
	}
	return l
}
