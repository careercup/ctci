// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
Algorithm KTH_FROM_LAST(list,k):
 1.Get the input linked list and k
 2.if list.Size()<k return nil
 2.for i from 1 to k 
 		Iterate the list and the get the element of k th position kElem
 3.pt=l.Front()
 4.for kElem!=nil;kElem=kElem.Next(),pt=pt.Next()
 		if kElem==nill
 			return pt
 5.return nil
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
	kFromLastElem := findKFromLast(l,3)
	fmt.Println(kFromLastElem.Value)

	kFromLastElemRec := findKFromLastRecr(l.Front(),3)
	fmt.Println(kFromLastElemRec.value)

}

//Iterative function to find the kth from last element
func findKFromLast(l *list.List, k int) *list.Element {
	size:=l.Len()
	if size<k {
	return nil
	}
	var elem *list.Element
	elem = l.Front()
	for i:=0;i<k;i++ {
		elem = elem.Next()
	}
	var first *list.Element
	for first = l.Front() ; first!=nil && elem!=nil; elem,first= elem.Next(),first.Next() {
		if elem.Next() == nil {
			return first
		}
	}
	return nil
}

//Object to store the count and the value
type WrapObj struct {
	count int
	value int
}

//recursive function to find the kth from last element
func findKFromLastRecr(l *list.Element, k int) WrapObj {
	if l.Next() == nil {
		return WrapObj{1,l.Value.(int)}
	}

	resObj := findKFromLastRecr(l.Next(),k)
	resObj = WrapObj{resObj.count+1, l.Value.(int)}
	if resObj.count == k {
		return resObj
	}
	return resObj
}
