//	Thanks to  Hicham Bouabdallah
//
//
//  queue.go
//
//  Created by Hicham Bouabdallah
//  Copyright (c) 2012 SimpleRocket LLC
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

package queue

import (
	"fmt"
	"sync"
)

type queuenode struct {
	data interface{}
	next *queuenode
}

//	A go-routine safe FIFO (first in first out) data stucture.
type Queue struct {
	head  *queuenode
	tail  *queuenode
	count int
	lock  *sync.Mutex
}

//	Creates a new pointer to a new queue.
func New() *Queue {
	q := &Queue{}
	q.lock = &sync.Mutex{}
	return q
}

//	Returns the number of elements in the queue (i.e. size/length)
//	go-routine safe.
func (q *Queue) Len() int {
	q.lock.Lock()
	defer q.lock.Unlock()
	return q.count
}

//	Pushes/inserts a value at the end/tail of the queue.
//	Note: this function does mutate the queue.
//	go-routine safe.
func (q *Queue) Push(item interface{}) {
	q.lock.Lock()
	defer q.lock.Unlock()

	n := &queuenode{data: item}

	if q.tail == nil {
		q.tail = n
		q.head = n
	} else {
		q.tail.next = n
		q.tail = n
	}
	q.count++
}

//	Returns the value at the front of the queue.
//	i.e. the oldest value in the queue.
//	Note: this function does mutate the queue.
//	go-routine safe.
func (q *Queue) Poll() interface{} {
	q.lock.Lock()
	defer q.lock.Unlock()

	if q.head == nil {
		return nil
	}

	n := q.head
	q.head = n.next

	if q.head == nil {
		q.tail = nil
	}
	q.count--

	return n.data
}

//	Returns a read value at the front of the queue.
//	i.e. the oldest value in the queue.
//	Note: this function does NOT mutate the queue.
//	go-routine safe.
func (q *Queue) Peek() interface{} {
	q.lock.Lock()
	defer q.lock.Unlock()

	n := q.head
	if n == nil || n.data == nil {
		return nil
	}

	return n.data
}

//Returns false if the queue is empty
//i. e function used to identify whether the queue is empty
func (q *Queue) IsEmpty() bool {
	q.lock.Lock()
	defer q.lock.Unlock()

	if q == nil {
		return false
	}
	if q.count == 0 {
		return true
	}
	return false
}

func main() {

	q := New()
	q.Push(4)
	q.Push(5)
	q.Push(6)
	fmt.Println(q.IsEmpty())
	fmt.Println(q.Poll(), q.Poll(), q.Poll())
	fmt.Println(q.IsEmpty())
}
