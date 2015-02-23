// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm BST_MINIMAL_HEIGHT(arr, low, high): 
1.Get the input array arr
2.find the mid element using low and high . mid =(low+high)/2
3.t.Value = arr[mid]
4.t.Left=BST_MINIMAL_HEIGHT(arr, low, mid)
5.t.Right=BST_MINIMAL_HEIGHT(arr, mid+1, high)
6.return t
*/
package main

import (
	"fmt"
	"go/chapter04-treesandgraphs/binarytree"
	"go/chapter02-linkedlists/list"
)

func main() {

	inArr := []int{4, 5, 7, 8, 9}
	t1 := getMinimalBST(inArr, 0, len(inArr)-1)
	binarytree.InOrderTraverse(t1)
	fmt.Println("")
}

func getLevelbasedList(nodeList []*list.List, t *binarytree.Tree, level int) []*list.List {

}
func getMinimalBST(arr []int, low int, high int) *binarytree.Tree {
	if high < low {
		return nil
	}
	mid := (low + high) / 2
	t1 := binarytree.NewTree()
	t1.Value = arr[mid]
	t1.Left = getMinimalBST(arr, low, mid-1)
	t1.Right = getMinimalBST(arr, mid+1, high)
	return t1
}
