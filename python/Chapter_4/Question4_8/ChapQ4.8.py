import random
import time

#binary tree python
class BinaryTree:
    def __init__(self, content):
        self.content = content
        self.left = None
        self.right = None
        self.hash = None
        self.children = -1

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 

#You have two very large binary trees: Tl, with millions of nodes, and T2, with
#hundreds of nodes. Create an algorithm to decide if T2 is a subtree of Tl.

def count_children(tree1):
    left=0
    if tree1.left != None:
        left = count_children(tree1.left)
    right=0
    if tree1.right != None:
        right = count_children(tree1.right)
    tree1.children=1+right+left
    return 1+right+left
            

def is_subtree_of(t1,t2):    
    if t1==None and t2==None:
        return True
    elif t1==None or t2==None:        
        return False
    if t2.content==t1.content:
        if (is_subtree_of(t1.left,t2.left) and is_subtree_of(t1.right,t2.right)) or is_subtree_of(t1.left,t2) or is_subtree_of(t1.right,t2):       
            return True
    else:
        return is_subtree_of(t1.left,t2) or is_subtree_of(t1.right,t2)

#building testcases
def make_random_balanced_tree(depth):
    if depth>0:
        tree = BinaryTree(random.randint(0, 100))
        tree.left=make_random_balanced_tree(depth-1)
        tree.right=make_random_balanced_tree(depth-1)
        return tree
    else:
        return None

balanced_tree = make_random_balanced_tree(19)
sub_balanced_tree = balanced_tree.right.right.right


#testing

count_children(balanced_tree)
count_children(sub_balanced_tree)

print "t1 children: " + str(balanced_tree.children)
print "t2 children: " + str(sub_balanced_tree.children)

start=time.time()
if is_subtree_of(balanced_tree,sub_balanced_tree):
    print "Test case 1 passed"
timer=time.time()-start
print "Test case 1 time: " + str(timer)
start=time.time()
if not is_subtree_of(sub_balanced_tree,balanced_tree):
    print "Test case 2 passed"
timer2=time.time()-start
print "Test case 2 time: " + str(timer2)


balanced_tree = make_random_balanced_tree(20)
sub_balanced_tree = balanced_tree.right.right.right
count_children(balanced_tree)
count_children(sub_balanced_tree)
print "t1 children: " + str(balanced_tree.children)
print "t2 children: " + str(sub_balanced_tree.children)

start=time.time()
if is_subtree_of(balanced_tree,sub_balanced_tree):
    print "Test case 3 passed"
timer3=time.time()-start
print "Test case 3 time: " + str(timer3)
start=time.time()
if not is_subtree_of(sub_balanced_tree,balanced_tree):
    print "Test case 4 passed"
timer4=time.time()-start
print "Test case 4 time: " + str(timer4)

print "Doubling size of input changed run time by a factor of " + str(timer3/timer) 

#sample output
##t1 children: 524287
##t2 children: 65535
##Test case 1 passed
##Test case 1 time: 8.59500002861
##Test case 2 passed
##Test case 2 time: 1.12700009346
##t1 children: 1048575
##t2 children: 131071
##Test case 3 passed
##Test case 3 time: 17.9500000477
##Test case 4 passed
##Test case 4 time: 2.22199988365
##Doubling size of input changed run time by a factor of 2.08842350063


# ------------------Same solution but different notation--------------
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
				treenode.p = buff
			else:
				buff.left = treenode
				treenode.p = buff

def isInc(r1, r2):
	if r2 == None:
		return True
	elif r1 == None:
		return False
	elif r1.key == r2.key:
		if matchTree(r1,r2):
			return True
	return isInc(r1.left, r2) or isInc(r1.right, r2)

def matchTree(r1,r2):
	if r1 == None and r2 == None:
		return True
	elif r1 == None or r2 == None:
		return False
	elif r1.key != r2.key:
		return False
	else:
		return matchTree(r1.left, r2.left) and matchTree(r1.right, r2.right)

bst1 = BinarySearchTree()
for i in range(2):
	bst1.addUsingKey(i+2)

bst2 = BinarySearchTree()
for i in range(3):
    bst2.addUsingKey(i)
    bst2.addUsingKey(-i)

print isInc(bst1.root, bst2.root)
