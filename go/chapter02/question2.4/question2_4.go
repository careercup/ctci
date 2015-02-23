// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 Algorithm SPLIT_ELEMENTS_AROUND_X(list,x):
 1.Get the input list and x
 2.if list==nil  then return nil
 3.create two lists for less than x and greater than x ltx and gtx
 4.for e=first;e!=nil;e=e.next
 		if e.Value<x the ltx.add(e.Value) else gtx.add(e.Value)
 5.merge ltx,x,gtx as res
 6.return res
*/

package main

import (
	"fmt"
	"go/chapter02-linkedlists/list"
)

func main() {
	l := list.New()
	l.PushFront(4)
	l.PushFront(5)
	l.PushFront(7)
	l.PushFront(6)
	l.PushBack(9)
	res := splitAroundX(l, 6)
	for e := res.Front(); e != nil; e = e.Next() {
		fmt.Println(e.Value)
	}
}

//Function to split the list around the value x
func splitAroundX(l *list.List, x int) *list.List {
	if l == nil {
		return nil
	}
	//Two lists for less than x and greater than X
	lThanX := list.New()
	gThanX := list.New()

	for e := l.Front(); e != nil; e = e.Next() {
		m := e.Value.(int)
		//Compare the value of x with the current node value and append to the respective list
		if m < x {
			lThanX.PushBack(m)
		} else {
			gThanX.PushBack(m)
		}
	}
	lThanX.PushBackList(gThanX)
	return lThanX
}
