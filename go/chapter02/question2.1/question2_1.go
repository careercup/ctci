// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
Algorithm REMOVER_DUPLICATES(list): [Using temp buffer]
 1.Get the input linked list
 2.Create a map of [string]boolean
 4.For i from 1 to len(list) iterate through the nodes nd of the list
		if nd present in the map then remove current node
		else put nd to the map --> map[nd]=true
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
	sMap = make(map[int]bool)
	var next *list.Element
	for e := l.Front(); e != nil; e = next {
		next = e.Next()
		m := e.Value.(int)
		if sMap[m] == true {
			l.Remove(e)
		} else {
			sMap[m] = true
		}
	}
	return l
}
