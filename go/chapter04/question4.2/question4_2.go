// Author: Dinesh Appavoo (dineshappavoo) <dinesha.cit@gmail.com>

/*Algorithm IS_PATH_AVAILABLE(t1, t2):
1.Get he input nodes t1, t2
2.Create a queue q <- Empty
3.if t1.Visited==false
	q.Push(t1)
	t1.Visited=true
	if t1.Value == t2.Value return true
4.while(!q.IsEmpty())
	node=q.Poll()
	adjacents = node.Adjacents
	for n in adjacents
		if n.Visited == false
			if n.Value = t2.Value
				return true
			q.Push(n)
			n.Visited=true
5.return false
*/
package main

import (
	"fmt"
	"go/chapter04/queue"
	"go/chapter04/tree"
	"reflect"
)

func main() {

	t1 := tree.NewTree()
	pathAvailable := isPathAvailable(t1, t1)
	fmt.Println("Is Path Availabe ? ", pathAvailable)
}

func isPathAvailable(t1 *tree.Tree, t2 *tree.Tree) bool {
	if t1 == nil || t2 == nil {
		return false
	}
	q := queue.New()

	if t1.Visited == false {
		q.Push(t1)
		t1.Visited = true
		if t1.Value == t2.Value {
			return true
		}
	}
	for !q.IsEmpty() {
		node := q.Poll()

		//go reflect package used the get the array of inteface from the struct
		refValue := reflect.ValueOf(&node).Elem().FieldByName(string("Adjacents"))
		adjNodes := refValue.Interface().([]*tree.Tree)

		for _, n := range adjNodes {
			if n.Visited == false {
				if n.Value == t2.Value {
					return true
				}
				n.Visited = true
				q.Push(n)
			}
		}
	}
	return false
}
