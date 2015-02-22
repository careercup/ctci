// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*

*/
package main

import (
	"fmt"
	"go/chapter04-treesandgraphs/binarytree"
	"math"
)

func main() {

	t1 := binarytree.New(100, 1)
	isBalanced(t1)

	t2 := binarytree.New(100, 1)
	isBalanced(t2)
}

func checkHeight(t *binarytree.Tree) float64 {
	if t == nil {
		return 0
	}

	leftHeight := checkHeight(t.Left)
	if leftHeight == -1 {
		return -1
	}
	rightHeight := checkHeight(t.Right)
	if rightHeight == -1 {
		return -1
	}

	height := math.Abs(leftHeight - rightHeight)

	if height > 1 {
		return -1
	}
	return math.Max(leftHeight, rightHeight) + 1
}

func isBalanced(t *binarytree.Tree) {
	heightBalance := checkHeight(t)
	if heightBalance == -1 {
		fmt.Println("Tree is not balanced")
	} else {
		fmt.Println("Tree is balanced")
	}
}
