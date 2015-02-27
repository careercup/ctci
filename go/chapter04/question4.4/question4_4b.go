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
	"go/chapter02/list"
	"go/chapter04/binarytree"
)
func main() {

	inArr := []int{4, 5, 7, 8, 9}
	t1 := binarytree.NewMinimalHeightBST(inArr, 0, len(inArr)-1)
	binarytree.InOrderTraverse(t1)
	var nodeList []*list.List

	nodeList = getLevelbasedList(t1, 0)

	fmt.Println()
	for _, value := range nodeList {
		fmt.Print("[ ")
		for x := value.Front(); x != nil; x = x.Next() {
			treeNode := x.Value.(*binarytree.Tree)
			fmt.Print(treeNode, " ")
		}
		fmt.Println("]")
	}
}

func getLevelbasedList(root *binarytree.Tree, level int) []*list.List {
	if root == nil {
		return nil
	}
	var nodeList []*list.List
	parents := list.New()
	current := list.New()

	current.PushFront(root)

	for current.Len() > 0 {
		nodeList = append(nodeList, current)
		parents = current
		current = list.New()

		for x := parents.Front(); x != nil; x = x.Next() {
			node := x.Value.(*binarytree.Tree)
			if node.Left != nil {
				 current.PushFront(node.Left)
			}
			if node.Right != nil {
				 current.PushFront(node.Right)
			}
		}
	}
	return nodeList

}
