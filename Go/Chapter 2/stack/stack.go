package stack // simple LIFO stack

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
func (s *Stack) Pop() (value int) {
	if s.size > 0 {
		value, s.top = s.top.value, s.top.next
		s.size--
		return value
	}
	return -1
}
