package main
/* How would you design a stack which, in addition to push and pop, also has a
 function min which returns the minimum element? Push, pop and min should
all operate in O(1) time.*/

import (
	"errors"
	"fmt"
	"math"
	"math/rand"
)
var errorEmptyStack = errors.New("error: stack is empty")
type Stack struct {
	top  *Element
	size uint64
	min  []int64 // a slice to keep track of all mins encountered
}
type Element struct {
	value int64 // All types satisfy the empty interface, so we can store anything here.
	next  *Element
}

func (s *Stack) Len() uint64 {
	return s.size
}

func (s *Stack) Push(value int64) {
	s.top = &Element{value, s.top}
	s.size++
	if len(s.min) == 0 {
		s.min = append(s.min, value)
	} else if s.min[len(s.min)-1] > value { // if last elem in slice is greater
		s.min = append(s.min, value) // add the value to the end of the slice
	}
}

// Remove the top element from the stack and return it's value
// If the stack is empty, return maxInt, error
func (s *Stack) Pop() (int64, error) {
	if s.size == 0 {
		return math.MaxInt64, errorEmptyStack
	}
	value := s.top.value
	s.top = s.top.next
	s.size--
	if s.min[len(s.min)-1] == value {
		s.min = s.min[:(len(s.min) - 1)] // delete the last element in min slice
	}
	return value, nil
}

func (s *Stack) Peek() (int64, error) {
	if s.size == 0 {
		return math.MaxInt64, errorEmptyStack
	}
	return s.top.value, nil
}

func (s *Stack) Min() (int64, error) {
	if s.size == 0 {
		return math.MaxInt64, errorEmptyStack
	}
	return s.min[len(s.min)-1], nil // return the last elem in min slice
}

func random64(min, max int64) int64 {
	return min + rand.Int63n(max-min)
}

func main() {
	s := new(Stack)
	fmt.Println("The stack is:")
	for i := 0; i < 30; i++ { // construct a stack of size 30
		val := random64(-300, 300)
		s.Push(val)
		fmt.Printf(" [%v] \n", val)
	}
	mini, err := s.Min()
	if err == nil {
		fmt.Printf("The min is: %v", mini)
	} else {
		fmt.Println(err)
	}
}
