// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm GET_LEVEL_BASED_LIST(list, t, level): 
1.Get the array of list, node t, level
2.create a linkelist l
3.if len(list) == level  //To identify whether a list is available for the level
	l = list.New()
	l.add(t.Value)
 else
 	l = list[level]
 	l.add(t.Value)
 GET_LEVEL_BASED_LIST(list, t.Left, level+1)
 GET_LEVEL_BASED_LIST(list, t.Right, level+1)
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
	getLevelbasedList(&nodeList, t1, 0)
	fmt.Println()
	for _, value := range nodeList {
		fmt.Print("[ ")
		for x := value.Front(); x != nil; x = x.Next() {
			fmt.Print(x.Value.(int), " ")
		}
		fmt.Println("]")
	}
}

//Here *[]*list.List used in the function argument to input pass by referrence slice
func getLevelbasedList(nodeList *[]*list.List, t *binarytree.Tree, level int) {
	if t == nil {
		return
	}
	l := list.New()
	if len(*nodeList) == level {
		l = list.New()
		l.PushFront(t.Value)
		*nodeList = append(*nodeList, l)

	} else {
		l = (*nodeList)[level] //index operator doesn't automatically dereference pointers. we need to use parentheses to specify what is dereferenced.
		l.PushFront(t.Value)
	}
	getLevelbasedList(nodeList, t.Left, level+1)
	getLevelbasedList(nodeList, t.Right, level+1)
}
