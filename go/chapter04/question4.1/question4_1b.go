// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm CHECK_HEIGHT(t):
1.get the input tree t
2.left_height = CHECK_HEIGHT(t.Left)
3.if left_height == -1   then return -1
4.right_height = CHECK_HEIGHT(t.Right) if right_height == -1  then return -1 //This -1 is bypass multiple iterations
4.height = Abs(left_height - right_height)
5.if height > 1 then return -1 else  return Max(left_height, right_height)+1

If CHECK_HEIGHT(root) gives -1 then the tree is not balanced else it is balanced
*/
package main

import (
	"fmt"
	"go/chapter04/binarytree"
	"math"
)

func main() {
	inArr := []int{4, 5, 7, 8, 9}
	t1 := binarytree.NewMinimalHeightBST(inArr, 0, len(inArr)-1)
	binarytree.InOrderTraverse(t1)

	//t1 := binarytree.New(100, 1)
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
