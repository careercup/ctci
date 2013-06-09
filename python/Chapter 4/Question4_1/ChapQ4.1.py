import random

#binary tree python
class BinaryTree:
    def __init__(self, content):
        self.content = content
        self.left = None
        self.right = None
        #-1 means the depth has not been calculated yet.
        self.depth = -1

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 
        
#Implement a function to check if a binary tree is balanced. For the purposes of
#this question, a balanced tree is defined to be a tree such that the heights of the
#two subtrees of any node never differ by more than one.
    
def is_balanced_binary_tree(btree):
    #compare depths of both sides
    a = depth(btree.left)    
    b = depth(btree.right)    
    return (a==b) or (a==b+1) or (a==b-1)

def depth(btree):
    if btree is None:
        return 0
    else:
        if btree.depth != -1:
            #caching depth
            #note that our cache of depth is not being updated using this
            #method, we would want to add a depth update mechanism whenever
            #a node is added/removed if we wanted to cache depth in this way.
            #if we didnt want to store this in the tree, we could cache it in a hash table (dict)
            return btree.depth
        else:
            btree.depth = 1 + max(depth(btree.left), depth(btree.right))
            return btree.depth

#Testing

#building testcase 1
bt = BinaryTree(random.randint(0, 100))
for c1 in xrange(0,19):
    bt2 = BinaryTree(random.randint(0, 100))
    bt2.left = bt
    bt=bt2

unbalanced_tree=bt

#building testcase 2
def make_random_balanced_tree(depth):
    if depth>0:
        tree = BinaryTree(random.randint(0, 100))
        tree.left=make_random_balanced_tree(depth-1)
        tree.right=make_random_balanced_tree(depth-1)
        return tree
    else:
        return None

balanced_tree = make_random_balanced_tree(5)

#building testcase 3
#using http://people.eecs.ku.edu/~miller/Courses/268/Materials/Trees/BalancedBinaryTreeHeight10.png
#as an extreme case of a balanced tree that looks unbalanced.
balanced_tree2 = BinaryTree(random.randint(0, 100))
balanced_tree2.left = BinaryTree(random.randint(0, 100))
balanced_tree2.left.right = BinaryTree(random.randint(0, 100))
balanced_tree2.right = BinaryTree(random.randint(0, 100))
balanced_tree2.right.left = BinaryTree(random.randint(0, 100))
balanced_tree2.right.right = BinaryTree(random.randint(0, 100))
balanced_tree2.right.right.right = BinaryTree(random.randint(0, 100))

#building testcase 4
unbalanced_tree2 = BinaryTree(random.randint(0, 100))
unbalanced_tree2.left = BinaryTree(random.randint(0, 100))
unbalanced_tree2.left.right = BinaryTree(random.randint(0, 100))
unbalanced_tree2.right = BinaryTree(random.randint(0, 100))
unbalanced_tree2.right.left = BinaryTree(random.randint(0, 100))
unbalanced_tree2.right.right = BinaryTree(random.randint(0, 100))
unbalanced_tree2.right.right.right = BinaryTree(random.randint(0, 100))
#this unbalances it
unbalanced_tree2.right.right.right.right = BinaryTree(random.randint(0, 100))

if not is_balanced_binary_tree(unbalanced_tree):
    print "Test 1 passed"
if is_balanced_binary_tree(balanced_tree):
    print "Test 2 passed"
if is_balanced_binary_tree(balanced_tree2):
    print "Test 3 passed"
if not is_balanced_binary_tree(unbalanced_tree2):
    print "Test 4 passed"
