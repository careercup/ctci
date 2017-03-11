from classes.LinkedList import *


#The digits are stored in reverse order
def addLists_rev(L1, L2):
    p1 = L1.head
    p2 = L2.head
    carry = 0
    linkedlist_sum = LinkedList()
    while (p1 != None) or (p2 != None) or (carry != 0):
        dig_sum = carry
        if p1 != None:
            dig_sum += p1.value
            p1 = p1.next
        if p2 != None:
            dig_sum += p2.value
            p2 = p2.next
        linkedlist_sum.addNode(dig_sum%10)
        carry = dig_sum/10
    return linkedlist_sum


# The digits are stored in forward order

# Iterative implementation
def addLists_fwd(L1, L2):
    # Create two new linkedlists which are reversed version of L1 and L2
    # Use addLists_rev method, then reverse the sum list
    L1_rev = reverseLinkedlist(L1)
    L2_rev = reverseLinkedlist(L2)
    return reverseLinkedlist(addLists_rev(L1_rev, L2_rev))


# Recursive implementation of addLists_fwd
def addLists_fwd_2(L1, L2):
    # compare length of linked lists and pad the shorter one with 0
    l1_len = lengthOfLinkedlist(L1)
    l2_len = lengthOfLinkedlist(L2)
    if l1_len < l2_len:
        L1 = padInFront(L1, l2_len - l1_len)
    else:
        L2 = padInFront(L2, l1_len - l2_len)   
    # Add lists
    sumandcarry = addListsFwd2Helper(L1.head, L2.head)
    result = LinkedList()
    result.head = sumandcarry[0]   
    # If the carry is not 0, insert this at the front of the linked list 
    if sumandcarry[1] != 0:
        addNodeInFront(result, sumandcarry[1])
    return result


# Helper function for recursive adding lists
def addListsFwd2Helper(p1, p2):
    if (p1 == None) and (p2 == None):
        sumandcarry = [None,0]       # a python list stores sum node and carry
        return sumandcarry
    sumandcarry = addListsFwd2Helper(p1.next, p2.next)
    val = p1.value + p2.value + sumandcarry[1]
    dig_node = insertBefore(sumandcarry[0], val%10) 
    carry = val/10
    return [dig_node, carry]


# Helper function to insert node in the front of a linked list
def addNodeInFront(linkedlist, value):
    node = Node(value)
    node.next = linkedlist.head
    linkedlist.head = node


# Helper function to insert node before a node
def insertBefore(node, value):
    new_node = Node(value)
    new_node.next = node
    return new_node


# Helper function to create a reversed linedlist
def reverseLinkedlist(linkedlist):
    current = linkedlist.head
    newlinkedlist = LinkedList()
    while current != None:
        addNodeInFront(newlinkedlist, current.value)
        current = current.next
    return newlinkedlist


# Helper function to caculate length of a linked list
def lengthOfLinkedlist(linkedlist):
    length = 0
    current = linkedlist.head
    while current != None:
        length += 1
        current = current.next
    return length


# Helper funtion to pad the list with zeros in front
def padInFront(linkedlist, number):
    padlist = LinkedList()
    padlist.head = linkedlist.head
    for i in range(number):
        addNodeInFront(padlist, 0)
    return padlist




#----------------test--------------
L1 = randomLinkedList(3,0,9)
L2 = randomLinkedList(5,0,9)
print L1
print L2
print "In reverse order, the sum is: "
print addLists_rev(L1, L2)
print "In forward order with iterative implementation, the sum is: "
print addLists_fwd(L1, L2)
print 'In forward order with recursive implementation, the sum is: '
print addLists_fwd_2(L1, L2)

