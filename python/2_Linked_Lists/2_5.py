"""
2.5
You have two numbers represented by a linked list where each node contains
a single digit. Digits are stored in reverse order, 1's digit is at the head.
Write a function that adds the two numbers and returns the sum as linked list.
"""
from classes import ListFactory

# SOLUTION 1
def listAdder(llist1, llist2):
    """
    Add the values of two reversed linked lists.
    Time complexity: O(n)
    Space complexity: O(n)
    """
    total = list2Num(llist1) + list2Num(llist2)
    return num2List(total)

def list2Num(llist):
    """
    Return value of a number stored in a linked list, reversed.
    LinkedList 1->2->3 returns the value 321.
    """
    value, multiplier = 0, 1
    node = llist.head
    while node != None:
        value = value + (node.data * multiplier)
        node = node.nextNode
        multiplier = multiplier* 10
    return value

def num2List(number):
    """
    Translate number into a reversed linked list.
    321 returns Linked List 1->2->3
    """
    numbers = list(str(number)[::-1])
    return ListFactory(map(lambda x: int(x), numbers))

# SOLUTION #2
def recursiveAdder(llist1, llist2):
    """
    Add the values of two reverse linked lists recursively
    """
    #To implement later

if __name__ == "__main__":
    value1, value2 = [0, 0, 3], [0, 5, 4]
    llist1, llist2 = ListFactory(value1), ListFactory(value2)
    total = listAdder(llist1, llist2)
    print "{0} + {1}".format(llist1, llist2)
    print "= {0}".format(total)

