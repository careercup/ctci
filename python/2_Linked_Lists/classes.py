"""
Python Implementation of a Linked List

Two different implementations of 'Node':

1) The preferred implementation checks equality by recursively checking 
    if self.data is equal to other.data until both of them reach 'None'.
2) The second implementation is for the specific case of a linked list
    with an infinite loop. The recursive equality check in the first 
    implementation results in a stack overflow -- thus this 'SpecialNode'
    inherits the default __eq__ and __ne__ methods to execute properly.

Although the implementations could be combined, linked lists with infinite 
loops seldom occur in real life. I felt that I would have been adding 
unecessary complexity for an extreme edge case.
"""

class NodeBase(object):
    """ 
    Basic node implementation. 
    """
    def __init__(self, data):
        self.data = data
        self.nextNode = None

    def __str__(self):
        return str(self.data)


class Node(NodeBase):
    """ 
    Special equality implementation to check if self.data matches other.data. 
    """
    def __eq__(self, other, counter=0):
        if not self and not other:
            return True
        elif bool(self) != bool(other):
            return False
        else:
            if self.data == other.data:
                return self.nextNode == other.nextNode
            return False

    def __ne__(self, other):
        return not self.__eq__(other)


class SpecialNode(NodeBase):
    """ 
    Uses default equality implementation to prevent infinite recursive loops.
    in linked lists with a loop.
    """
    pass


class LinkedList(object):
    """
    Linked list implementation with size value attached.
    """
    def __init__(self):
        self.head = None
        self.tail = None
        self.size = 0

    def addNode(self, data, nodeType=Node):
        new_node = nodeType(data)
        if self.head == None:
            self.head = new_node
        else:
            self.tail.nextNode = new_node
        self.tail = new_node
        self.size += 1

    def __str__(self):
        if self.head != None:
            index = self.head
            nodestore = [index.data]
            while index.nextNode != None:
                index = index.nextNode
                nodestore.append(index.data)
            return "LinkedList {0}".format(nodestore)
        return "LinkedList []"

    def toList(self):
        array = []
        node = self.head
        while node is not None:
            array.append(node.data)
            node = node.nextNode
        return array


def ListFactory(values=[], nodeType=Node):
    """
    Builds linked list and iterates through data to append each value.

    'SpecialNode' nodeType exists to handle linked lists with loops to prevent 
    from recursive stack overflow.
    """
    newList = LinkedList()
    for value in values:
        newList.addNode(value, nodeType)
    return newList

if __name__ == "__main__":
    a = ListFactory([1, 2])
    print "Initializing LinkedList, adding Node(1) and Node(2)"
    print "List = {0}".format(a)


