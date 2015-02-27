// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm IS_BT_A_BST(t, min, max): 
1.Initialize global min and max values of integers
2.Get the input tree t
3.if t==nil return true
4.if t.Value> max  || t.Value<min return false
5.call sub routines for left and right
		IS_BT_A_BST(t, min, t.Value)
		IS_BT_A_BST(t, t.Value, max) and return && boolean returns from the sub routines
*/
package main

import (
	"fmt"
	"go/chapter04/binarytree"
)

const MaxInt = int(^uint(0) >> 1)
const MinInt = -MaxInt - 1

func main() {

	inArr := []int{4, 5, 7, 8, 9}
	t1 := binarytree.NewMinimalHeightBST(inArr, 0, len(inArr)-1)
	isBST := isBTaBST(t1, MinInt, MaxInt)
	fmt.Println("Is BST? ", isBST)
}
func isBTaBST(t *binarytree.Tree, min int, max int) bool {
	if t == nil {
		return true
	}
	if t.Value > max || t.Value < min {
		return false
	}
	return isBTaBST(t.Left, min, t.Value) && isBTaBST(t.Right, t.Value, max)
}
