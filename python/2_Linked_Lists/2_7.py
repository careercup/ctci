"""
2.7
Implement a function to check if a linked list is a palindrome.
"""
from classes import ListFactory
from copy import deepcopy

# Solution 1
def iter_palindrome(llist):
    """
    Reverse a linked list iteratively with a stack.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    stack = []
    node = llist.head
    while node != None:
        stack.append(node.data)
        node = node.nextNode
    return True if stack == stack[::-1] else False

# Solution 2 (INCOMPLETE!)
def rec_palindrome(llist):
    """
    Determine if a linked list is a palindrome in place using recursion.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    node1, node2 = llist.head, deepcopy(llist.head)
    return node1 == recursiveReverse(node2)
    
def recursiveReverse(node, last=None):
    """
    Reverse a linked list in place recursively.
    """
    if node is None:
        return last
    nextNode = node.nextNode
    node.nextNode = last
    return recursiveReverse(nextNode, node)

if __name__ == "__main__":
    # Iterative
    values1, values2 = [0, 5, 4, 3, 4, 5, 0], [1, 2, 3, 4, 5]
    llist1, llist2 = ListFactory(values1), ListFactory(values2)
    pal1, pal2 = iter_palindrome(llist1), iter_palindrome(llist2)
    print "Iterative: {0} palindrome? {1}".format(values1, pal1)
    print "Iterative: {0} palindrome? {1}".format(values2, pal2)

   #Recursive
    values3, values4 = [3, 5, 6, 9, 0], [1, 2, 3, 4, 5, 4, 3, 2, 1]
    llist3, llist4 = ListFactory(values3), ListFactory(values4)
    pal3, pal4 = rec_palindrome(llist3), rec_palindrome(llist4)
    print "Recursive: {0} palindrome? {1}".format(values3, pal3)
    print "Recursive: {0} palindrome? {1}".format(values4, pal4)

