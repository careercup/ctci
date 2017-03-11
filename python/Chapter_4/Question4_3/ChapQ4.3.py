#binary tree python
class BinaryTree:
    def __init__(self, content, left = None, right = None):
        self.content = content
        self.left = left
        self.right = right

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 

#Given a sorted (increasing order) array with unique integer elements, write an
#algorithm to create a binary search tree with minimal height.


def int_array_to_binary_search_tree(intarray):
    #use the middle of the array to divide it. this ensures minimal height.
    if len(intarray) == 0:
        return None
    if len(intarray) == 1:
        return BinaryTree(intarray[0])
    cut = len(intarray) / 2
    return BinaryTree( intarray[cut], \
        int_array_to_binary_search_tree(intarray[0:cut]), 
        int_array_to_binary_search_tree(intarray[cut+1:]))

#testing

intarray1=[1,2,3,4,5,6,7,8,9,10,12,15,18,22,43,144,515]
intarray2=[1,2,3,4,5,6,7,8,9,10,12,15,18,22,43,144,515,4123]

print str(int_array_to_binary_search_tree(intarray1))

print str(int_array_to_binary_search_tree(intarray2))

#we could benefit from a better tree visualization here
