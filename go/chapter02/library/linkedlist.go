package main

import (
	"fmt"
)

type node struct {
	int  data
	next *node
}

type LinkedList struct {
	header *node
	footer *node
	length int
}

func (head *LinkedList) Len()int{
	return head.length
}

func (l *LinkedList) Init() *LinkedList {

	l.header.next = &l.header
	l.length=0
	return l
}

func New() *LinkedList {
	return new(LinkedList).Init()
}

// insert inserts e after target, increments l.length, and returns e.
func (l *LinkedList) insert(e, target * node) *node{
	n:=target.next
	target.next=e
	e.next=n
	e.LinkedList=l
	l.length++
	return e
}

func (l *LinkedList) remove(e *node) *node{

	if e==nil{
		return nil
	}
	if e.next==nil{
		e=nil
		l.length--
		retuen e
	}else{
		e.data = e.next.data
		e.next = e.next.next
		l.length--
		return e
	}

}



