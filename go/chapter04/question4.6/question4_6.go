// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm IN_ORDER_SUCCESSOR(node):
1.GEt the input node
2.if node == nil return nil
3.if node.right == nil
	if node.Parent != nil
		if node.Parent.Left == node
			return node.Parent
		else
			while(node.Parent!= nil && node.Parent.Left != node)
				node = node.Parent
			return node.Parent
	else
		return node.Parent
 else if(node.Right!=null)//Take the left most element
	return GET_LEFT_MOST(node.Right)
 else
 	return nil

GET_LEFT_MOST(node.Right):
 	while(node != nil)
 		node = node.Left
 	retutrn node

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
	binarytree.InOrderTraverse(t1)
	fmt.Println("Left", t1.Left.Value)
	//Parent is not set in the tree construction for testing
	//in_order_successor := getInOrderSuccessor(t1.Left)
	//fmt.Println("In Order succesor? ", in_order_successor.Value)
}

func getInOrderSuccessor(root *binarytree.Tree) *binarytree.Tree {
	if root == nil {
		return nil
	}
	if root.Right == nil {
		if root.Parent != nil {
			if root.Parent.Left == root {
				return root.Parent
			} else {
				for root.Parent != nil && root.Parent.Left != root {
					root = root.Parent
				}
				return root.Parent
			}
		}
	} else if root.Right != nil {
		return getleftMostChild(root.Right)
	}
	return nil
}

func getleftMostChild(node *binarytree.Tree) *binarytree.Tree {
	for node != nil {
		node = node.Left
	}
	return node
}
