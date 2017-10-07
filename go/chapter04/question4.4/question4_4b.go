// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm GET_LEVEL_BASED_BST(root, level): 
1.Get the input tree roor, level
2.crete new array of list nodeList
3.create two list parents and current
4.current.add(root)
5.while(len(current)>0)
	add current to nodeList, assign current to parent and reinitialize current
	for node in parents
		current.add(node.Left) && current.add(node.Right) 
6.return nodeList
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
			fmt.Print(treeNode.Value, " ")
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
