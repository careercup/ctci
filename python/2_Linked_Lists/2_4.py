"""
2.4
Write code to partition a linked list around a value x, such that all
nodes less than x come before all nodes greater than or equal to x.
"""
from classes import ListFactory

def partition(value, llist):
    """
    Parition a linked list around a value by creating two sublists and then
    combining them.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    node = llist.head
    smallerList, biggerList = ListFactory(), ListFactory()
    while node != None:
        if node.data < value:
            smallerList.addNode(node.data)
        else:
            biggerList.addNode(node.data)
        node = node.nextNode
    smallerList.tail.nextNode = biggerList.head
    return smallerList

if __name__ == "__main__":
    values = [4, 8, 3, 2, 1, 3]
    llist = ListFactory(values)
    partValue = 3 
    partitioned = partition(partValue, llist)
    print "{0} => Partitioned around {1}".format(llist, partValue)
    print partitioned

