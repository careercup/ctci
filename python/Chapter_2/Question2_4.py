from classes.LinkedList import *

def partition(linkedlist, x):
    if linkedlist.head != None:
        p1 = linkedlist.head
        p2 = linkedlist.head.next
        while p2 != None:
            if p2.value < x:
                p1.next = p2.next
                p2.next = linkedlist.head
                linkedlist.head = p2
                p2 = p1.next
            else:
                p1 = p1.next
                p2 = p1.next



#----------------test-----------------
L = randomLinkedList(10, 0, 50)
x = 25

print L, " , x=25"   
partition(L, x)
print L 
