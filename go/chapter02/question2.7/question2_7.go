// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*
 Algorithm IS_PALINDROME_USING_REVERSE(list):
 1.Get the input list
 2.if list==nil return false
 3.reverse the list revList
 4.Iterate through the original and reversed list and compare the values.
 5.If the value does not match then return false else return true

 Algorithm IS_PALINDROME_USING_STACK(list):
 1.Get the input list
 2.if list==nil return false
 3.Declare a stack s
 4.Maintain two pointer slow and fast. Fast moves twice while slow reaches one node.
 5.Add the elements to the stack till the mid of the list using fast runner technique
 6.Move the slow pointer once if the list is of odd length
 7.compare the slow pointer value and the poped the value from stack
 8.if the value doesn't match then return false else return true
*/

package main

import (
	"fmt"
	"go/chapter02/list"
	"go/chapter02/stack"
)

var head *list.Element

func main() {

	l := list.New()
	l.PushFront(4)
	l.PushFront(5)
	l.PushFront(4)
	l.PushFront(5)
	l.PushFront(4)

	m := list.New()
	m.PushFront(3)
	m.PushFront(2)
	m.PushFront(8)
	m.PushFront(6)
	res := isPalindrome(l)
	fmt.Println(res)
	res = isPalindromeUsingStack(l)
	fmt.Println(res)
}

//Reverse list function
func reverseList(l *list.List) *list.List {
	m := list.New()

	for e := l.Front(); e != nil; e = e.Next() {
		m.PushFront(e.Value.(int))
	}
	return m
}

/*
func reverseList1(current *list.Element) {
	if (current == nil) {
		return
	}

	if (current.Next()==nil) {
		head = current
		return
	}
	reverseList1(current.Next())
	current.Next().Next() = current
	current.Next() = nil
}*/

//Palinfrome function using reverse list approach - Iterative
func isPalindrome(l *list.List) bool {

	rev := reverseList(l)
	for e, f := l.Front(), rev.Front(); e != nil && f != nil; e, f = e.Next(), f.Next() {
		if e.Value.(int) != f.Value.(int) {
			return false
		}
	}
	return true
}

//APPROACH - II
func isPalindromeUsingStack(l *list.List) bool {

	if l == nil {
		return false
	}
	st := stack.New()
	slow := l.Front()
	fast := l.Front()

	for fast != nil && fast.Next() != nil {
		st.Push(slow.Value.(int))
		slow = slow.Next()
		fast = fast.Next().Next()
	}

	//To ignore the middle element in case of odd length list
	if fast.Next() == nil {
		slow = slow.Next()
	}

	for slow != nil {
		m := st.Pop().(int)
		n := slow.Value.(int)
		if m != n {
			return false
		}
		slow = slow.Next()
	}
	return true
}
