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

#O(n^2) naive algorithm
def is_balanced_binary_tree(btree):
    #compare depths of both sides
    if btree is None: return True
    return (abs(depth(btree.left) - depth(btree.right)) <= 1) and \
        is_balanced_binary_tree(btree.left) and is_balanced_binary_tree(btree.right)

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

#effcient algorithm, get heights of subtrees and check subtrees if balanced at the same time
def is_balanced_binary_tree2(btree):
    return check_balanced(btree)[0]
    
def check_balanced(btree):
    if btree is None: return True, 0
    left_balanced, left_depth = check_balanced(btree.left)
    right_balanced, right_depth = check_balanced(btree.right)
    btree.depth = 1 + max(left_depth, right_depth)
    return left_balanced and right_balanced and \
        (abs(depth(btree.left) - depth(btree.right)) <= 1), btree.depth

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

#building testcase 5
unbalanced_tree3 = BinaryTree(random.randint(0, 100))
unbalanced_tree3.left = BinaryTree(random.randint(0, 100))
unbalanced_tree3.left.right = BinaryTree(random.randint(0, 100))
unbalanced_tree3.right = BinaryTree(random.randint(0, 100))
unbalanced_tree3.right.right = BinaryTree(random.randint(0, 100))
unbalanced_tree3.right.right.right = BinaryTree(random.randint(0, 100))

test_func = [is_balanced_binary_tree, is_balanced_binary_tree2]
for func in test_func:
    if not func(unbalanced_tree):
        print "Test 1 passed"
    else:
        print "Test 1 not passed"
    if func(balanced_tree):
        print "Test 2 passed"
    else:
        print "Test 2 not passed"
    if func(balanced_tree2):
        print "Test 3 passed"
    else:
        print "Test 3 not passed"
    if not func(unbalanced_tree2):
        print "Test 4 passed"
    else:
        print "Test 4 not passed"
    if not func(unbalanced_tree3):
        print "Test 5 passed"
    else:
        print "Test 5 not passed"