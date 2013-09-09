#binary tree python
class BinaryTree:
    def __init__(self, content):
        self.content = content
        self.left = None
        self.right = None
        self.parent = None

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 

#write an algorithm to fint the  'next' node (i.e., in-order successor) of a given node in a binary search btre.
#You may assume that each node has a link to its parent.

def find_next_btree(btree):
	if btree is None: return None
	if btree.right is None:
		ret = btree.parent
		while ret is not None and ret.content <= btree.content:
			ret = ret.parent
		return ret
	else:
		#find left most in right sub-tree
		ret = btree.right
		while ret.left is not None:
			ret = ret.left
		return ret

#test
from random import randrange
def make_random_bsearch_tree(depth = 2, l = -10, r = 10, parent = None):
	if depth < 0 or l == r: return None
	tree = BinaryTree(randrange(l, r))
	tree.parent = parent
	tree.left = make_random_bsearch_tree(depth - 1, l, tree.content, tree)
	tree.right = make_random_bsearch_tree(depth - 1, tree.content, r, tree)
	return tree

def in_order_check(btree):
	if btree is None: return
	in_order_check(btree.left)
	print "current node", btree.content
	next_node = find_next_btree(btree)
	if next_node is None:
		print "next node None"
	else:
		print "next node", next_node.content
	in_order_check(btree.right)

tree = make_random_bsearch_tree()
print tree
in_order_check(tree)
