package stack

import (
	"fmt"
)

type Stack struct {
	top  *Node
	size int
}

type Node struct {
	value interface{}
	next  *Node
}

// New returns an initialized list.
func New() *Stack { return new(Stack).Init() }

// Init initializes or clears list l.
func (s *Stack) Init() *Stack {
	//s.top.next = &s.top
	s.size = 0
	return s
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

func main() {
	stack := New()

	stack.Push("1")
	stack.Push("2")
	stack.Push("3")
	stack.Push("4")
	stack.Push("5")
	stack.Push("6")

	for stack.Length() > 0 {
		fmt.Printf("%s ", stack.Pop().(string))
	}
	fmt.Println()
}
