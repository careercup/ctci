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
	"container/list"
	"fmt"
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
	//stackImplementation()
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

//Stack implementation
type Stack struct {
	top  *Node
	size int
}

type Node struct {
	value interface{}
	next  *Node
}

func (s *Stack) Length() int {
	return s.size
}

func (s *Stack) IsEmpty() bool {
	return s.size == 0
}

func (s *Stack) Push(val interface{}) {
	s.top = &Node{val, s.top}
	s.size++
}

func (s *Stack) Peek() interface{} {
	return s.top.value
}

func (s *Stack) Pop() (val interface{}) {
	if s.size > 0 {
		val, s.top = s.top.value, s.top.next
		s.size--
		return
	}
	return ""
}

//Test Stack operations
func stackImplementation() {
	st := new(Stack)

	st.Push("1")
	st.Push("2")
	st.Push("3")
	st.Push("4")
	st.Push("5")
	st.Push("6")

	for st.Length() > 0 {
		fmt.Printf("%s ", st.Pop().(string))
	}
	fmt.Println()
}

func isPalindromeUsingStack(l *list.List) bool {

	if l == nil {
		return false
	}
	st := new(Stack)
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

	for ;slow != nil; {
		m := st.Pop().(int)
		n := slow.Value.(int)
		if m != n {
			return false
		}
		slow = slow.Next()
	}
	return true
}
