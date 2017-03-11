from BinaryTreeNode import *


# Mehod 1: if nodes have links to parents, Go up levels to see whether 
# a node's ancestor is another node's ancestor
def commonAncestor_1(p, q):
    if p is None:
        return None
    if cover(p, q):
        return p
    current = p
    parent = current.parent
    while parent is not None:
        if (parent is q) or (parent.left is current and cover(parent.right, q))\
           or (parent.right is current and cover(parent.left, q)):
            return parent
        current = parent
        parent = parent.parent
    return None

# check if n is a descendent of root
def cover(root, n):
    if root is None:
        return False
    if root is n:
        return True
    return cover(root.left, n) or cover(root.right, n)



# Method 2: if nodes have no links to parents.
def commonAncestor_2(root, p, q):
    result = commonAncestor2_helper(root, p, q)
    if result[1]:
        return result[0]
    return None

def commonAncestor2_helper(root, p, q):
    if root is None:
        return None, False
    if root is p and root is q:
        return root, True
    
    left = commonAncestor2_helper(root.left, p, q)
    if left[1] == True:     # Already found ancestor in the subtree
        return left
    
    right = commonAncestor2_helper(root.right, p, q)
    if right[1] == True:    # Already found ancestor in the subtree
        return right
    
    # If One of subtree return p and one of subtree return q, found common ancestor
    if left[0] != None and right[0] != None:
        return root, True
    
    # If root is p or q and one of the subtrees contain q or p, the root is common ancestor
    # If no p or q in the subtree, return root, False
    elif root is p or root is q:
        isAncestor = True if left[0] != None or right[0] != None else False
        return root, isAncestor
    
    # The rest condition:
    # 1) One of the subtree contains only p or q, another subtree is None, return p or q, False
    # 2) None of subtrees contain p or q, return None, False
    else:
        return left[0] if left[0] != None else right[0], False




# ------------------test--------------------
#             10
#            /  \
#           5    6
#          / \  / \
#         1  2  3  4
#           /
#          7

def main():
    root = BinaryTreeNode(10)
    root.setLeft(5)
    root.setRight(6)
    root.left.setLeft(1)
    root.left.setRight(2)
    root.right.setLeft(3)
    root.right.setRight(4)
    root.left.right.setLeft(7)

    # test case 1: node 7 and 6  --> Common ancestor: 10
    # test case 2: node 2 and 5 --> Common ancestor: 5
    # test case 3: node 6 and a node not in the tree  --> Common ancestor: None 
    tests = [(root.left.right.left, root.right), (root.left.right, root.left), (root.right, BinaryTreeNode(9))]
    methods = [commonAncestor_1, commonAncestor_2] 
    for test in tests:
        for method in methods:
            if method == commonAncestor_1:
                ancestor = method(test[0], test[1])
            else:
                ancestor = method(root, test[0], test[1])
            print ancestor.value if ancestor is not None else None
             

if __name__ == "__main__":
    main()



