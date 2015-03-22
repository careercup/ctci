package bst

import (
    "fmt"
    // "bytes"
    // "strings"
)
func max(a, b int) int {
   if a < b {
      return b
   }
   return a
}
type Interface interface {
    // returns if this data is less than the data given
	Less(c Interface) bool
}

type Node struct {
    // A node in the vanilla BST tree.
    key Interface
    parent *Node
    left *Node
    right *Node
    height int // length of the longest path from the node to the leaf
}

func newNode(key Interface, parent *Node) *Node {
    // height is 0 for node with no children => leaf
    return &Node{key, parent, nil, nil, 0}
}
func (n *Node) Left() *Node {
    return n.left
}
func (n *Node) Right() *Node {
    return n.right
}

func Height(n *Node) int {
    if n == nil {
        return -1
    } else {
        return n.height
    }
}

func (n *Node) update_height() {
    current := n
    for current != nil {
        current.height = max(Height(current.left), Height(current.right)) + 1
        current = current.parent
    }
}

// Finds and returns the node with key k from the subtree rooted at this node.
func (n *Node) find(k Interface) *Node {
    if k == n.key {
        return n
    } else if (k.Less(n.key)) {
        if n.left == nil { // element not found
            return nil
        } else {
            return n.left.find(k)
        }
    } else {
        if n.right == nil { // element not found
            return nil
        } else {
            return n.right.find(k)
        }
    }
}
// Finds the node with the minimum key in the subtree rooted at this node.
func (n *Node) find_min() *Node {
    current := n
    for current.left != nil {
        current = current.left
    }
    return current
}
// Returns the node with the next larger key (the successor) in the BST.
func (n *Node) next_larger() *Node {
    if n.right != nil {
        return n.right.find_min()
    }
    current := n
    /* if the node is the parent left child, then parent is the next larger
       else, move to the nodes above until u meet a node that was a left child of its parent
    */
    for (current.parent != nil && current.parent.right == current) {
        current = current.parent
    }
    return current.parent
}
// Inserts a node into the subtree rooted at this node
func (n *Node) insert(node *Node) {
    if n == nil {
        return
    }
    if (node.key.Less(n.key)) {
        if (n.left == nil) {
            node.parent = n
            n.left = node
            node.update_height()
        } else {
            n.left.insert(node)
        }
    } else {
        if (n.right == nil) {
            node.parent = n
            n.right = node
            node.update_height()
        } else {
            n.right.insert(node)
        }
    }

}
// Deletes and returns this node from the BST.
func (n *Node) delete() *Node {
    /* the node has atmost 1 child */
    if (n.left == nil || n.right == nil) {
        if (n.parent.left == n) {
            if (n.left != nil) {
                n.parent.left = n.left
            } else if (n.right != nil) {
                n.parent.left = n.right
            } else {
                n.parent.left = nil
            }
        } else {
            if (n.left != nil) {
                n.parent.right = n.left
            } else if (n.right != nil) {
                n.parent.right = n.right
            } else {
                n.parent.right = nil
            }
        }
        n.parent.update_height()
        return n
    } else {
        /* the node has 2 children */
        s := n.next_larger()
        n.key, s.key = s.key, n.key
        // TODO: how to update height now? s.delete takes care of it already, I think SO?
        return s.delete()
    }
}
// Checks the BST representation invariant around this node.
// Raises a runtime error if the RI is violated.
func (n *Node) check_ri() {
    if n.left != nil {
        if (! n.left.key.Less(n.key)) {
            fmt.Errorf("BST RI violated by a left node key")
        }
        if (n.left.parent != n) {
            fmt.Errorf("BST RI violated by a left node parent pointer")
            n.left.check_ri()
        }
    }
    if (n.right != nil) {
        if (n.right.key.Less(n.key)) {
            fmt.Errorf("BST RI violated by a right node key")
        }
        if n.right.parent != n {
            fmt.Errorf("BST RI violated by a right node parent pointer")
            n.right.check_ri()
        }
    }
}
func (n *Node) Height() int {
    return n.height
}
// func (n *Node) strInorder() string {
//     buffer Bytes.Buffer
// }
// Internal method for ASCII art.
// func (n *Node) str() {
//     label := fmt.Sprintf(n.key)
//     if n.left == nil {
//         left_lines, left_pos, left_width := []string{}, 0, 0
//     } else {
//         left_lines, left_pos, left_width = n.left.str()
//     }
//     if n.right == nil {
//         right_lines, right_pos, right_width := []string{}, 0, 0
//     } else {
//         right_lines, right_pos, right_width := n.right.str()
//     }
//     middle = max(right_pos + left_width - left_pos + 1, len(label), 2)
//     pos := left_pos + middle // 2
//     width := left_pos + middle + right_width - right_pos
//     for len(left_lines) < len(right_lines) {
//         append(left_lines, ' ' * left_width)
//     }
//     for len(right_lines) < len(left_lines) {
//         append(right_lines, ' ' * right_width)
//     }
//     if (middle - len(label)) % 2 == 1 && n.parent != nil && n == n.parent.left && len(label) < middle {
//         label = fmt.Sprintf("%v.", label)
//     }
// }

type BST struct {
    // The vanilla BST tree.
    root *Node
}

func New() *BST {
    return &BST{nil}
}
func (t *BST) Root() *Node {
    return t.root
}
// Finds and returns the node with key k from the BST.
func (t *BST) Find(key Interface) *Node {
    if(t.root != nil) {
        return t.root.find(key)
    }
    return nil
}
// Returns the minimum node of this BST.
func (t *BST) Find_min() *Node {
    if(t.root != nil) {
        return t.root.find_min()
    }
    return nil
}
// Inserts a node with key k into the BST.
func (t *BST) Insert(key Interface) *Node {
    newNode := newNode(key, nil)
    if (t.root == nil) {
        t.root = newNode
    } else {
        t.root.insert(newNode)
    }
    return newNode
}
// Deletes and returns a node with key k if it exists from the BST.
func (t *BST) Delete(key Interface) *Node {
    node := t.Find(key)
    if node == nil {
        return nil
    } else if ( node == t.root ) {
        /* make the root a child of a temporary node */
        pseudoroot := newNode(nil, nil)
        pseudoroot.left = t.root
        t.root.parent = pseudoroot
        // delete the root
        deleted := t.root.delete()
        t.root = pseudoroot.left // make the present child of the temp node as root
        if t.root != nil {
            t.root.parent = nil
        }
        return deleted
    } else {
        return node.delete()
    }
}
// Checks the BST representation invariant.
// raises a runtime error if RI is violated
func (t *BST) check_ri() {
    if t.root != nil {
        if t.root.parent != nil {
            fmt.Errorf("BST RI violated by the root node's parent pointer.")
        }
        t.root.check_ri()
    }
}
