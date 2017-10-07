package list // IMPLEMENTS A SINGLY LINKED LIST

import (
    "bytes"
    "fmt"
    "math/rand"
    "time"
)
type Node struct {
    Next *Node
    Data interface{}
}
type List struct {
    Head *Node
    Tail *Node
    length int // O(1) access for length
}

func (n *Node) setNext(s *Node) {
    n.Next = s
}
func (n *Node) setData(v interface{}) {
    n.Data = v
}
// PushFront inserts a new Node with value v at the front of list l
func (l *List) PushFront(v interface{}) *Node{
    newNode := new(Node)
    newNode.Data = v
    newNode.Next = l.Head
    l.Head = newNode
    l.length++
    if(l.Head.Next == nil) {
        l.Tail = l.Head
    }
    return newNode
}
func (l *List) PushBack(v interface{}) *Node{
    if(l.Head == nil) {
        return l.PushFront(v)
    }
    newNode := new(Node)
    newNode.Data = v
    newNode.Next = nil
    l.Tail.Next = newNode
    l.Tail = newNode
    l.length++
    return newNode
}
func (l *List) String() string {
    var buffer bytes.Buffer
    for current := l.Head; current != nil; current = current.Next {
		buffer.WriteString(fmt.Sprintf("%v", current.Data))
        buffer.WriteString(" -> ")
	}
    buffer.WriteString("nil")
    return buffer.String()
}

func (l *List) Front() *Node {
    return l.Head
}
// removes the head and returns its value
func (l *List) Poll() interface{} {
    data := l.Head.Data
    l.Head = l.Head.Next
    l.length--
    return data
}
func (l *List) Len() int {
    return l.length
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
