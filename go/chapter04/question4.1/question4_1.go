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
	height := getHeight(t1)
	fmt.Println(height)

	fmt.Println("Tree Balanced is ", isBalanced(t1))
}

func getHeight(t *binarytree.Tree) float64 {
	if t == nil {
		return 0
	}
	return math.Max(getHeight(t.Left), getHeight(t.Right)) + 1
}

func isBalanced(t *binarytree.Tree) bool {
	if t.Left == nil && t.Right == nil {
		return true
	}
	heightDiff := math.Abs(getHeight(t.Left) - getHeight(t.Right))
	if heightDiff > 1 {
		return false
	}
	return isBalanced(t.Left) && isBalanced(t.Right)
}
