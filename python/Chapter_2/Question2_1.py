from classes.LinkedList import *


# use a hash table, O(n)
def deleteDups(linkedlist):
    if (linkedlist.head != None):
        currNode = linkedlist.head
        dic =  {currNode.value: True}
        while currNode.next != None:
            if currNode.next.value in dic:
                currNode.next = currNode.next.next
            else:
                dic[currNode.next.value] = True
                currNode = currNode.next


# use no data structure, O(n2)
def deleteDups2(linkedlist):
    currNode = linkedlist.head
    while currNode != None:
        runner = currNode
        while runner.next != None:
            if runner.next.value == currNode.value:
                runner.next = runner.next.next
            else:
                runner = runner.next
        currNode = currNode.next




#---------------- test --------------------
L1 = randomLinkedList(9, 3, 7)
print L1
deleteDups(L1)
print L1
print
L2 = randomLinkedList(9, 3, 7)
print L2
deleteDups2(L2)
print L2
