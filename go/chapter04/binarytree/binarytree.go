// Go's concurrency primitives make it easy to
// express concurrent concepts, such as
// this binary tree comparison.
//
// Trees may be of different shapes,
// but have the same contents. For example:
//
//        4               6
//      2   6          4     7
//     1 3 5 7       2   5
//                  1 3
//
// This program compares a pair of trees by
// walking each in its own goroutine,
// sending their contents through a channel
// to a third goroutine that compares them.

package binarytree

import (
	"fmt"
	"math/rand"
	"math"
)

// A Tree is a binary tree with integer values.
type Tree struct {
	Left  *Tree
	Value int
	Right *Tree
}

// Walk traverses a tree depth-first,
// sending each Value on a channel.
func Walk(t *Tree, ch chan int) {
	if t == nil {
		return
	}
	Walk(t.Left, ch)
	ch <- t.Value
	Walk(t.Right, ch)
}

// Walker launches Walk in a new goroutine,
// and returns a read-only channel of values.
func Walker(t *Tree) <-chan int {
	ch := make(chan int)
	go func() {
		Walk(t, ch)
		close(ch)
	}()
	return ch
}

// Compare reads values from two Walkers
// that run simultaneously, and returns true
// if t1 and t2 have the same contents.
func Compare(t1, t2 *Tree) bool {
	c1, c2 := Walker(t1), Walker(t2)
	for {
		v1, ok1 := <-c1
		v2, ok2 := <-c2
		if !ok1 || !ok2 {
			return ok1 == ok2
		}
		if v1 != v2 {
			break
		}
	}
	return false
}

// New returns a new, random binary tree
// holding the values 1k, 2k, ..., nk.
func New(n, k int) *Tree {
	var t *Tree
	for _, v := range rand.Perm(n) {
		t = insert(t, (1+v)*k)
	}
	return t
}

// New returns a new, empty binary tree
func NewTree() *Tree {
	return &Tree{nil, 0, nil}
}	

//NewMinimalHeightBST gives the minimal height tree from the given sorted array
func NewMinimalHeightBST(arr []int, low int, high int) *Tree {
	if high < low {
		return nil
	}
	mid := (low + high) / 2
	t1 := NewTree()
	t1.Value = arr[mid]
	t1.Left = NewMinimalHeightBST(arr, low, mid-1)
	t1.Right = NewMinimalHeightBST(arr, mid+1, high)
	return t1
}

//Traverse prints the tree
func InOrderTraverse(t *Tree) {
	if t==nil {
		return
	}
	InOrderTraverse(t.Left)
	fmt.Print(t.Value, " ")
	InOrderTraverse(t.Right)
}

//Height gives the height of the BST
func Height(t *Tree) float64 {
	if t==nil {
		return 0
	}
	return math.Max(Height(t.Left), Height(t.Right))+1
}


func insert(t *Tree, v int) *Tree {
	if t == nil {
		return &Tree{nil, v, nil}
	}
	if v < t.Value {
		t.Left = insert(t.Left, v)
		return t
	}
	t.Right = insert(t.Right, v)
	return t
}

func main() {
	t1 := New(100, 1)
	fmt.Println(Compare(t1, New(100, 1)), "Same Contents")
	fmt.Println(Compare(t1, New(99, 1)), "Differing Sizes")
	fmt.Println(Compare(t1, New(100, 2)), "Differing Values")
	fmt.Println(Compare(t1, New(101, 2)), "Dissimilar")
}