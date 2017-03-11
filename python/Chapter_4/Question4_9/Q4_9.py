from BinaryTreeNode import *


def findSum(node, givenSum, path=None, depth=0):
    if node is None:
        return
    if path is None:
        path = []
    if len(path) > depth:
        path[depth] = node.value
    else:
        path.append(node.value)
    
    # Look up to see if there are paths end up with this node and sum to the given value
    temp = 0
    for i in range(depth, -1, -1):
        temp += path[i]
        if temp == givenSum:
            printPath(path, i, depth)
    
    findSum(node.left, givenSum, path, depth+1)
    findSum(node.right, givenSum, path, depth+1)


def printPath(path, start, end):
    for i in range(start, end + 1):
        print path[i],
    print ""




# --------------test----------------
#               1
#              / \
#             2   3
#            / \ / \
#           4  5 3  4 
#             /
#            7
# Sum = 7
# Path:
# 1 2 4
# 2 5
# 7
# 1 3 3
# 3 4

def main():
    givenSum = 7
    root = BinaryTreeNode(1)
    root.setLeft(2)
    root.setRight(3)
    root.left.setLeft(4)
    root.left.setRight(5)
    root.right.setLeft(3)
    root.right.setRight(4)
    root.left.right.setLeft(7)

    findSum(root, givenSum)


if __name__ == "__main__":
    main()
    