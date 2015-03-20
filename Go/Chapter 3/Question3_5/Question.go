package main

/*
    Implement a MyQueue class which implements a queue using two stacks.
*/

import (
    "../stack"
    "errors"
    "fmt"
)
/*
    use two stacks, whatever operation you do,
    shift between stacks, so you get FIFO behaviour
*/
type MyQueue struct {
    primary *stack.Stack // holds the newest pushed
    buffer *stack.Stack // holds older pushed
}
func (q *MyQueue) EnQueue(data int) {
    /* Push all previous elems to primary and push new elem to primary */
    for ( q.buffer.Len() > 0 ) {
        val, _ := q.buffer.Pop()
        q.primary.Push(val)
    }
    q.primary.Push(data)
}
func (q *MyQueue) DeQueue() (int, error) {
    if (q.primary.Len() == 0 && q.buffer.Len() == 0) {
        return 0, errors.New("Queue is empty")
    }
    /* Push all primary elems to buffer and pop the last elem from buffer */
    for (q.primary.Len() > 0) {
        val, _ := q.primary.Pop()
        q.buffer.Push(val)
    }
    return q.buffer.Pop()
}

func (q *MyQueue) Len() int {
    return q.primary.Len() + q.buffer.Len()
}
func NewMyQueue() *MyQueue {
    return &MyQueue{new(stack.Stack), new(stack.Stack)}
}
func main() {
    q := NewMyQueue()
    for i := 0; i < 30; i++ {
        q.EnQueue(i)
    }
    for i := 0; i < 30; i++ {
        val, err := q.DeQueue()
        if(err == nil) {
            fmt.Printf(" [%v] \n", val)
        } else {
            fmt.Println(err)
        }
    }
}
