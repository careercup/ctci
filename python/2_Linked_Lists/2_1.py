"""
2.1
Write the code to remove duplicates from a linked list.
How would you solve the problem without a temporary buffer?
"""
from classes import ListFactory

def removeDuplicates(llist):
    """
    Removes duplicates using a hashtable as a buffer
    Time complexity: O(n)
    Space complexity: O(n)
    """
    index = llist.head
    tempBuff = {index.data: True}
    while index != None:
        if index.nextNode.data in tempBuff:
            index.nextNode = index.nextNode.nextNode
        else:
            tempBuff[index.data] = True
        index = index.nextNode
    return llist

def removeDuplicates2(llist):
    """
    Removes duplicates using a runner.
    Time complexity: O(n2)
    Space complexity: O(1)
    """
    walker = llist.head
    while walker != None:
        runner = walker
        while runner.nextNode != None: 
            if runner.nextNode.data == walker.data:
                runner.nextNode = runner.nextNode.nextNode
            else:
                runner = runner.nextNode
        walker = walker.nextNode
    return llist


if __name__ == "__main__":
    values = [1, 1, 3, 2, 5, 3]
    list1, list2 = ListFactory(values), ListFactory(values)
    removeDuplicates(list1)
    removeDuplicates2(list2)
    print "Values: {0}".format(values)
    print "Method one: {0}".format(list1)
    print "Method two: {0}".format(list2)

