// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm IS_BALANCED(t):
1.Get the input tree
2.if t == nil then return true
3.left_height = GET_HEIGHT(l), right_height = GET_HEIGHT(r)
4.heightDiff = Abs(left_height) - right_height)
5.if heightDiff > 1 then return false
6.return IS_BALANCED(t.Left) && IS_BALANCED(t.Right)

Algorithm GET_HEIGHT(t):
1.if t==nil return 0
2.return MAX(GET_HEIGHT(t.Left), GET_HEIGHT(t.Right))+1
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
	if t == nil {
		return true
	}
	heightDiff := math.Abs(getHeight(t.Left) - getHeight(t.Right))
	if heightDiff > 1 {
		return false
	}
	return isBalanced(t.Left) && isBalanced(t.Right)
}
