"""
2.3
Implement an algorithm to delete a node in the middle of singly linked list,
given only access to that node.
"""

from classes import ListFactory

def deleteNode(node):
    """
    Given a node, removes it from the linked list.
    """
    assert node.nextNode != None, "Node must not be last node"
    node.data = node.nextNode.data
    node.nextNode = node.nextNode.nextNode

if __name__ == "__main__":
    values = [1, 2, 3, 4, 5, 6]
    llist = ListFactory(values)
    removing_node = llist.head.nextNode.data
    print "{0} => Remove {1}".format(llist, removing_node)
    deleteNode(llist.head.nextNode)
    print llist
