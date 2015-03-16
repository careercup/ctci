package list // IMPLEMENTS A SINGLY LINKED LIST

import (
    "bytes"
    "fmt"
    "math/rand"
    "time"
)
type Node struct {
    Next *Node
    Data int
}
type List struct {
    Head *Node
    length int // O(1) access for length
}

func (n *Node) setNext(s *Node) {
    n.Next = s
}
func (n *Node) setData(v int) {
    n.Data = v
}
// PushFront inserts a new element e with value v at the front of list l
func (l *List) PushFront(v int) *Node{
    newNode := new(Node)
    newNode.Data = v
    newNode.Next = l.Head
    l.Head = newNode
    l.length++
    return newNode
}

func (l *List) String() string {
    var buffer bytes.Buffer
    for current := l.Head; current != nil; current = current.Next {
		buffer.WriteString(fmt.Sprintf("%v", current.Data))
        buffer.WriteString(" -> ")
	}
    return buffer.String()
}

func (l *List) Front() *Node {
    return l.Head
}

func (l *List) Len() int {
    return l.length
}

func (l *List) DecrementLen() {
    l.length--
}
/* Helper function to get a random integer (min, max)*/
func RandIntBetween(min int, max int) int {
    return min + rand.Intn(max-min)
}
/* Get a random linked list of N elements with data in range (min, max) */
func RandomLinkedList(N, min, max int) *List{
    rand.Seed( time.Now().UTC().UnixNano() ) // seed so that you get new LL every time
    l := new(List)
    for i := 0; i < N; i++ {
        l.PushFront(RandIntBetween(min, max))
    }
    return l
}
