// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
Algorithm KTH_FROM_LAST(list,k):
 1.Get the input linked list and k
 2.if Len(list) < k then return nil
 3.for i from 1 to k 
 		Iterate the list and the get the element of k th position kElem
 4.pt=l.Front()
 5.for kElem!=nil;kElem=kElem.Next(),pt=pt.Next()
 		if kElem==nil
 			return pt
 6.return nil
*/
package main

import (
	"fmt"
	"go/chapter02/list"
)

func main() {
	l := list.New()
	for i := 1; i < 100; i++ {
		l.PushBack(i)
	}
	kFromLastElem := findKFromLast(l, 3)
	fmt.Println("Iterative Method : ", kFromLastElem.Value)
	kFromLastElemRec := findKFromLastRecr(l.Front(), 3, &WrapObj{0})
	fmt.Println("Recursive Method : ", kFromLastElemRec.Value.(int))
}

//Iterative function to find the kth from last element
func findKFromLast(l *list.List, k int) *list.Element {
	size := l.Len()
	//Base condition. If the size of the list is less than k then kth element cannot be found
	if size < k {
		return nil
	}
	var elem *list.Element
	elem = l.Front()
	for i := 1; i < k; i++ {
		elem = elem.Next()
	}
	var first *list.Element
	for first = l.Front(); first != nil && elem != nil; elem, first = elem.Next(), first.Next() {
		//return the current node when current+k position is nil
		if elem.Next() == nil {
			return first
		}
	}
	return nil
}

//Object to store the count 
type WrapObj struct {
	count int
}

//recursive function to find the kth from last element
func findKFromLastRecr(head *list.Element, k int, wrapper *WrapObj) *list.Element {
	if head == nil {
		return nil
	}
	resNode := findKFromLastRecr(head.Next(), k, wrapper)
	//Increment the count on every return call
	wrapper.count = (wrapper.count) + 1
	if wrapper.count == k {
		return head
	}
	return resNode
}
