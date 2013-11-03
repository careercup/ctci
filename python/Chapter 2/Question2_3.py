from classes.LinkedList import *

def deleteNode(linkedlist, node):
    if node.next != None:
        node.value = node.next.value
        node.next = node.next.next  
    
    # if the given node is the last one, no way to delete it.
    # Here we set the last one's value to None
    else:
        node.value = None         



#-----------test--------------
L = randomLinkedList(5, 0, 100)
node = L.head.next.next         # Given access to the 3rd node
print L
print "After deleting the node"
deleteNode(L, node)
print L