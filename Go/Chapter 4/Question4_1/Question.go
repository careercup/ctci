package main
/*
Implement a function to check if a tree is balanced. For the purposes of this question,
a balanced tree is defined to be a tree such that no two leaf nodes differ in distance
from the root by more than one
*/
import (
    "../bintrees/bst"
	"fmt"
)

type myInt int
func (a myInt) Less( b bst.Interface ) bool { return a < b.(myInt) }

func getHeight(root *bst.Node) int {
	if (root == nil) {
		return 0
	}
	leftHeight := getHeight(root.Left())
	rightHeight := getHeight(root.Right());
	// return max(leftHeight, rightHeight) + 1
	if leftHeight > rightHeight {
		return leftHeight + 1
	}
	return rightHeight + 1
}

func isBalanced(root *bst.Node) bool {
	if (root == nil) {
		return true
	}
	heightDiff := getHeight(root.Left()) - getHeight(root.Right());
	// get absolute height diff
	if heightDiff < 0 {
		heightDiff = -heightDiff
	}
	if (heightDiff > 1) {
		return false
	} else {
		return isBalanced(root.Left()) && isBalanced(root.Right())
	}
}
func printInorder(node *bst.Node) {
	if (node == nil) {
		return
	}
	printInorder(node.Left())
	fmt.Print(node.Key().(myInt))
	fmt.Print(",")
	printInorder(node.Right())
}

func main() {
	items := []myInt{15, 5, 16, 3, 12, 20}
	tree := bst.New()
	for _, value := range items {
        tree.Insert(value)
    }
	printInorder(tree.Root())
	/*
	    15
	   /  \
	  5    16
	 /\     \
	3  12    20
	*/
	fmt.Println("\nIs balanced? ", isBalanced(tree.Root()))
	tree.Insert(myInt(23)) // Add 23 to make it unbalanced
	/*
	    15
	   /  \
	  5    16
	 /\     \
	3  12    20
	          \
			  23
	*/
	printInorder(tree.Root())
	fmt.Println("\nIs balanced? ", isBalanced(tree.Root()))
}