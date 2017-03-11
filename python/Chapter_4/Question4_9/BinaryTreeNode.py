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
