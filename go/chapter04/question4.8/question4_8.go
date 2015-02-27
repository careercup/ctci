// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm IS_T2_PRESENT_IN_T1(t1, t2): 
1.Get the input tree t1 and t2
2.if t1==nil && t2 == nil then return false
3.if t1 == nil || t2 == nil  then return false
4.if t1.Value == t2.Value the return IS_ALL_NODES_AVAILABLE_IN-T1(t1, t2)
5.return  IS_T2_PRESENT_IN_T1(t1.Left, t2.Left) ||IS_T2_PRESENT_IN_T1(t1.Right, t2.Right)

Algorithm IS_ALL_NODES_AVAILABLE_IN-T1(t1, t2):
1.1.Get the input tree t1 and t2
2.if t1==nil && t2 == nil then return true
3.if t1 != nil || t2 == nil  then return true
4.if t1.Value != t2.Value then return false
5.return IS_ALL_NODES_AVAILABLE_IN-T1(t1.Left, t2.Left) && IS_ALL_NODES_AVAILABLE_IN-T1(t1.Right, t2.Right)

*/
package main

import (
	"fmt"
	"go/chapter04/binarytree"
)

func main() {

	inArr1 := []int{4, 5, 7, 8, 9, 10, 12, 14, 15, 17, 19, 20}
	t1 := binarytree.NewMinimalHeightBST(inArr1, 0, len(inArr1)-1)

	inArr2 := []int{9, 10, 12, 14, 15, 17}
	t2 := binarytree.NewMinimalHeightBST(inArr2, 0, len(inArr2)-1)

	isAvail := isT2PresentInT1(t1, t2)

	fmt.Println("Is T2 Available in T1? ", isAvail)
}

func isT2PresentInT1(t1, t2 *binarytree.Tree) bool {

	//If large tree is empty then false
	if t1 == nil && t2 == nil {
		return false
	}
	if t1 == nil || t2 == nil {
		return false
	}
	if t1.Value == t2.Value {
		return isAllNodeAvailableInT1(t1, t2)
	}
	return isT2PresentInT1(t1.Left, t2.Left) || isT2PresentInT1(t1.Right, t2.Right)
}

func isAllNodeAvailableInT1(t1, t2 *binarytree.Tree) bool {

	if t1 == nil && t2 == nil {
		return true
	}
	if t1 != nil || t2 == nil {
		return true
	}
	if t1.Value != t2.Value {
		return false
	}
	return isAllNodeAvailableInT1(t1.Left, t2.Left) && isAllNodeAvailableInT1(t1.Right, t2.Right)

}
