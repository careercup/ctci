// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm FIND_COMMON_ANCESTOR(t1, t2): [Tree has Visited pointer and Parent pointer]
1.Get t1, t2 input
2. while (t1 != nil || t2 !=nil)
		if t1.Parent != nil 
			if t1.visited == true
				return t1.Parent
			else
				t1 = t1.Parent

		if t2.Parent != nil 
			if t2.visited == true
				return t2.Parent
			else
				t2 = t2.Parent
4.return nil
*/
package main

import (
	"fmt"
	"go/chapter04/binarytree"
)

func main() {

	inArr := []int{4, 5, 7, 8, 9}
	t1 := binarytree.NewMinimalHeightBST(inArr, 0, len(inArr)-1)
	binarytree.InOrderTraverse(t1)
	ancestor := findCommonAncestor(t1, t1)
	fmt.Println("Common Ancestor : ", ancestor)
}

func findCommonAncestor(t1 *binarytree.Tree, t2 *binarytree.Tree) *binarytree.Tree {
	if t1 == nil || t2 == nil {
		return nil
	}
	for t1 != nil || t2 != nil {

		if t1.Parent != nil {
			if t1.Parent.Visited == true {
				return t1.Parent
			}
		}

		if t2.Parent != nil {
			if t2.Parent.Visited == true {
				return t2.Parent
			}
		}
		t1 = t1.Parent
		t2 = t2.Parent
	}
	return nil
}
