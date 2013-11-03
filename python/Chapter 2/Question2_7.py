from classes.LinkedList import *

# Iterative approch
def isPalindrome_iter(linkedlist):
    if linkedlist.head == None:
        return None
    fast = linkedlist.head
    slow = linkedlist.head
    firsthalf = []
    while fast != None and fast.next != None:
        firsthalf.append(slow.value)
        slow = slow.next
        fast = fast.next.next
    if fast != None:
        slow = slow.next
    while slow != None:
        if firsthalf.pop() != slow.value:
            return False
        else:
            slow = slow.next
    return True


# Recursive approch
def isPalindrome_recu(linkedlist):
    length = lengthOfLinkedlist(linkedlist)
    current = linkedlist.head
    result = isPalindrome_recu_helper(current, length)
    return result[1]



def isPalindrome_recu_helper(current, length):
    if current == None:
        return [None, True]             
    elif length == 1:
        return [current.next, True]
    elif length == 2:
        return [current.next.next, current.value == current.next.value]
    
    # result is a python list stores two variables 
    result = isPalindrome_recu_helper(current.next, length - 2)

    if (result[0] == None) or (not result[1]):
        return result
    else:
        result[1] = current.value == result[0].value
        result[0] = result[0].next
        return result


def lengthOfLinkedlist(linkedlist):
    length = 0
    current = linkedlist.head
    while current != None:
        length += 1
        current = current.next
    return length



# -------------------test------------------
L1 = randomLinkedList(3, 3, 4)
print "L2:", L1
print "isPalindrome_iter: ", isPalindrome_iter(L1)
print "isPalindrome_recu: ", isPalindrome_recu(L1)
L2 = LinkedList()
for i in range(1,4):
    L2.addNode(i)
for i in range(3, 0, -1):
    L2.addNode(i)
print "L3:", L2
print "isPalindrome_iter: ", isPalindrome_iter(L2)
print "isPalindrome_recu: ", isPalindrome_recu(L2)