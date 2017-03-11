class BinaryTreeNode:

    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None
        self.parent = None

    def setLeft(self, leftvalue):
        leftnode = BinaryTreeNode(leftvalue)
        self.left = leftnode
        if leftnode != None:
            leftnode.parent = self

    def setRight(self, rightvalue):
        rightnode = BinaryTreeNode(rightvalue)
        self.right = rightnode
        if rightnode != None:
            rightnode.parent = self

#-------------A solution------------
class TreeNode:
	def __init__(self,key):
		self.key = key
		self.left = None
		self.right = None
		self.p = None

	def __str__(self):
		return str(self.key)

class BinarySearchTree:
	def __init__(self):
		self.root = None

	def addNode(self, treenode):
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
				treenode.p = buff
			else:
				buff.left = treenode
				treenode.p = buff

# Solution follows the chain in which p and q are on the same side. When p and q are no longer on the same side
# current node must be first common ancestor
def covers(root, p):
	if root == None:
		return False
	else:
		if root == p:
			return True
		else:
			return covers(root.left, p) or covers(root.right, p)

def commonAncestorHelper(root, p ,q):
	if root == None:
		return None
	elif root == p or root == q:
		return root
	else:
		is_p_on_left = covers(root.left, p)
		is_q_on_left = covers(root.left, q)
		if is_p_on_left != is_q_on_left:
			return root
		else:
			if is_p_on_left == True:
				return commonAncestorHelper(root.left, p, q)
			else:
				return commonAncestorHelper(root.right, p, q)

def commonAncestor(root, p, q):
	if (not covers(root, p)) or (not covers(root, q)):
		return None
	else:
		return commonAncestorHelper(root, p, q)
# test
bst2 = BinarySearchTree()
n1 = TreeNode(0)
n2 = TreeNode(1)
n3 = TreeNode(-1)
n4 = TreeNode(2)
n5 = TreeNode(-2)
bst2.addNode(n1)
bst2.addNode(n2)
bst2.addNode(n3)
bst2.addNode(n4)
bst2.addNode(n5)

print commonAncestor(bst2.root, n5, n4)
