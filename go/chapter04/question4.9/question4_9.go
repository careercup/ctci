// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm FIND_PATH_EQUALS_SUM(t, path, sum, level): 
1.Get the input tree t, path array/hashmap datastructure, sum , level
2.if t==nil then return 
3.path[level]=t.Value
4.for i from level to 0 
	val+=path[i]
	if val == sum then print the path
5. Call left and right sub tree
	 FIND_PATH_EQUALS_SUM(t.Left, path, sum, level) 
	 FIND_PATH_EQUALS_SUM(t.Right, path, sum, level):
*/
package main

import (
	"fmt"
	"go/chapter04/binarytree"
)

func main() {

	inArr := []int{4, 5, 7, 8, 9, 10, 12, 14, 15, 17, 19, 20}
	t1 := binarytree.NewMinimalHeightBST(inArr, 0, len(inArr)-1)

	findAndPrintPath(t1)
}

func findAndPrintPath(t *binarytree.Tree) {
	height := binarytree.Height(t)
	var path = make([]int, int(height))
	findPathEqualsSum(t, path, 15, 0)
}

func findPathEqualsSum(t *binarytree.Tree, path []int, sum int, level int) {
	if t == nil {
		return
	}
	path[level] = t.Value
	val := 0
	for i := level; i >= 0; i-- {
		val += path[i]
		if val == sum {
			printPath(path, i, level)
		}
	}
	findPathEqualsSum(t.Left, path, sum, level+1)
	findPathEqualsSum(t.Right, path, sum, level+1)
}

func printPath(path []int, start int, end int) {
	fmt.Print("[ ")
	for i := start; i <= end; i++ {
		fmt.Print(path[i], " ")
	}
	fmt.Print("]\n")
}
