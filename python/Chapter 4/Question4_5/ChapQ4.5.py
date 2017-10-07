#binary tree python
class BinaryTree:
    def __init__(self, content):
        self.content = content
        self.left = None
        self.right = None

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 

#implement a function if a binary tree is a binary search tree

def valid_bsearch_tree(btree, lbound = -float("inf"), rbound = float("inf")):
	if btree is None: return True
	return (lbound <= btree.content < rbound) and \
		valid_bsearch_tree(btree.left, lbound, btree.content) and \
		valid_bsearch_tree(btree.right, btree.content, rbound)

def valid_bsearch_tree2(btree):
	#in-order method
	l = in_order_search(btree)
	if sorted(l) == l:
		return True
	return False

def in_order_search(btree):
	if btree is None: return []
	return in_order_search(btree.left) + [btree.content] + in_order_search(btree.right)

from random import randrange
def make_random_btree(depth = 3):
	if depth < 0: return None
	tree = BinaryTree(randrange(10))
	tree.left = make_random_btree(depth - 1)
	tree.right = make_random_btree(depth - 1)
	return tree

def make_random_bsearch_tree(depth = 3, l = -10, r = 10):
	if depth < 0 or l == r: return None
	tree = BinaryTree(randrange(l, r))
	tree.left = make_random_bsearch_tree(depth - 1, l, tree.content)
	tree.right = make_random_bsearch_tree(depth - 1, tree.content, r)
	return tree

#test1
T_set = [make_random_btree()] * 2 + [make_random_bsearch_tree()]*2
for T in T_set:
	if valid_bsearch_tree(T) == valid_bsearch_tree2(T):
		print "pass"
	else:
		print "wrong"




#-------------Another Solution-----------------

class TreeNode:
	def __init__(self,key):
		self.key = key
		self.left = None
		self.right = None

class BinarySearchTree:
	def __init__(self):
		self.root = None

	def addUsingKey(self, key):
		treenode = TreeNode(key)
		if self.root == None:
			self.root = treenode
		else:
			buff = self.root
			current =self.root
			while current != None:
				if current.key < treenode.key:
					buff = current
					current = current.right
				else:
					buff = current
					current = current.left
			if buff.key < treenode.key:
				buff.right = treenode
			else:
				buff.left = treenode
# min/max solution
def checkBST(root,mini,maxi):
	if root == None:
		return True
	elif (mini != None and root.key <= mini) or (maxi != None and root.key > maxi):
		return False
	elif checkBST(root.left, mini, root.key) == False or checkBST(root.right, root.key, maxi) == False:
		return False
	return True

def checkBSTApp(tree):
	return checkBST(tree.root, None, None)

# copying bst to array, chacking if the arr is sorted is easy
arr = []
def copyBST(root,arr):
	if root == None:
		1
	else:
		copyBST(root.left,arr)
		arr.append(root.key)
		copyBST(root.right,arr)
# test
bst = BinarySearchTree()
for i in range(5):
	bst.addUsingKey(i)
for i in range(5):
	bst.addUsingKey(-i)

copyBST(bst.root,arr)
print arr
print checkBSTApp(bst)
