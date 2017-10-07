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

package tree

import (
	"fmt"
)

// A Tree is a binary tree with integer values.
type Tree struct {
	Value int
	Visited bool
	Adjacents []*Tree
}


// New returns a new, empty binary tree
func NewTree() *Tree {
	return &Tree{}
}	

/*
//NOTE - Changes required
func insert(t *Tree, v int) *Tree {
	if t == nil {
		//var adjacents []Tree  // an empty list
		//return &Tree{ v, adjacents}
		return &Tree{0, nil}

	}
	if v < t.Value {
		t.Left = insert(t.Left, v)
		return t
	}
	t.Right = insert(t.Right, v)
	return t
}
*/

func main() {

fmt.Println("Test main")
}