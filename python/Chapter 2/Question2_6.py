from classes.LinkedList import *


def findBeginning(linkedlist):
    slow = linkedlist.head
    fast = linkedlist.head

    # Find meetng point
    while (fast != None) and (fast.next != None):
        slow = slow.next
        fast = fast.next.next
        if fast == slow:
            break
    
    # Check whether it is a circular linked list
    if fast == None or fast.next == None:
        return None

    # Move one runner to head. Making them move at same pace, they will meet at the beginning of the loop
    fast = linkedlist.head
    while fast != slow:
        slow = slow.next
        fast = fast.next

    return fast



# -----------------test------------------
nodes_number = 100
nodes_in_loop = 20
L = LinkedList()
current = L.head
store = []                  # store nodes to help creating loop

# Create a linked list
for i in range(nodes_number):
    L.addNode(i)
    current = L.head if i==0 else current.next
    store.append(current)

# Creat loop
current.next = None if nodes_in_loop <= 0 else store[nodes_number - nodes_in_loop]

beginning = findBeginning(L)
print beginning              # 80
