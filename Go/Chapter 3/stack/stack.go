package stack // simple LIFO stack

import (
	"errors"
	"math/rand"
	"bytes"
	"fmt"
	"time"
)

var errorEmptyStack = errors.New("error: stack is empty")

type Stack struct {
	top *Element
	size int
}

type Element struct {
	value int // All types satisfy the empty interface, so we can store anything here.
	next *Element
}

// Return the stack's length
func (s *Stack) Len() int {
	return s.size
}

// Push a new element onto the stack
func (s *Stack) Push(value int) {
	s.top = &Element{value, s.top}
	s.size++
}

// Remove the top element from the stack and return it's value
// If the stack is empty, return nil
func (s *Stack) Pop() (int, error) {
	if s.size > 0 {
		val := s.top.value
		s.top = s.top.next
		s.size--
		return val, nil
	}
	return 0, errorEmptyStack
}

func (s *Stack) Peek() (int, error) {
	if s.size > 0 {
		return s.top.value, nil
	}
	return 0, errorEmptyStack
}
/* Helper function to get a random integer (min, max)*/
func RandIntBetween(min int, max int) int {
    return min + rand.Intn(max-min)
}
/* Get a random stack of N elements with data in range (min, max) */
func RandomStack(N, min, max int) *Stack {
    rand.Seed( time.Now().UTC().UnixNano() ) // seed so that you get new stack every time
    s := new(Stack)
    for i := 0; i < N; i++ {
        s.Push(RandIntBetween(min, max))
    }
    return s
}

func (s *Stack) String() string {
	temporaryStack := new(Stack)
	var buffer bytes.Buffer
	for (s.size > 0) {
		data, _ := s.Pop()
		temporaryStack.Push(data)
		buffer.WriteString(fmt.Sprintf("[%v]", data))
        buffer.WriteString(" -> ")
	}
	buffer.WriteString(" BOTTOM ")
	/* push elements back to the stack*/
	for (temporaryStack.size > 0) {
		data, _ := temporaryStack.Pop()
		s.Push(data)
	}
	return buffer.String()
}
