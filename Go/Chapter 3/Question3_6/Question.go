package main
/*
Write a program to sort a stack in ascending order (with biggest items on top).
You may use at most one additional stack to hold items, but you may not copy
the elements into any other data structure (such as an array).
The stack supports the following operations: push, pop, peek, and isEmpty.
*/
import (
    "../stack"
    "fmt"
)
// recursive function to push an element onto a stack on a place where the elem
// below it is larger.
func pushDown(s *stack.Stack, data int) {
    val, err := s.Pop()
    if err == nil {
        if(data > val) {
            pushDown(s, data)
            s.Push(val)
        } else {
            s.Push(val)
            s.Push(data)
        }
    } else {
        s.Push(data)
    }
}
// O(n2)
func sortStack(s *stack.Stack) {
    /* put all elems in descending order to another stack */
    buffer := new(stack.Stack) // top contains smallest element
    for (s.Len() > 0) {
        stackVal, _ := s.Pop()
        bufferVal, err := buffer.Peek()
        if( err == nil ) {
            if( stackVal > bufferVal) {
                /* put the stackVal to the buffer to the place where
                the elem below is larger than it */
                pushDown(buffer, stackVal)
            } else {
                /* just push to the temporary stack */
                buffer.Push(stackVal)
            }
        } else {
            /* buffer was empty */
            buffer.Push(stackVal)
        }
    }
    /* shift from the temporary stack to original stack */
    for (buffer.Len() > 0) {
        val, _ := buffer.Pop()
        s.Push(val)
    }
}

func main() {
    s := stack.RandomStack(7, 1, 100)
    fmt.Printf("Original Stack: \n %v \n", s)
    sortStack(s)
    fmt.Printf("Sorted Stack: \n %v \n", s)
}
