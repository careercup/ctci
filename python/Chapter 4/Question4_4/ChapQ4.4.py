import random
#binary tree python
class BinaryTree:
    def __init__(self, content):
        self.content = content
        self.left = None
        self.right = None

    def __str__(self):
        return "( " + str(self.content) + " ( " + str(self.left) + " | " + str(self.right) + "))" 

class LinkedList:
    def __init__(self,content):
        self.content = content
        self.next = None

    def __str__(self):
        return "( " + str(self.content) + str(self.next) + " )"
    
#Given a binary tree, design an algorithm which creates a linked list of all the
#nodes at each depth (e.g. if you have a tree with depth D , you'll have D linked
#lists).

def binary_tree_to_list_of_linked_lists(btree,depth=1,returnlist=[]):
    if len(returnlist)>=depth:
        ll=LinkedList(btree.content)
        ll.next=returnlist[depth-1]
        returnlist[depth-1]=ll
    else:
        returnlist.append(LinkedList(btree.content))
    if not btree.left is None:
        returnlist=binary_tree_to_list_of_linked_lists(btree.left,depth+1,returnlist)
    if not btree.right is None:
        returnlist=binary_tree_to_list_of_linked_lists(btree.right,depth+1,returnlist)
    return returnlist

def binary_tree_to_list(btree):
    if btree is None:
        return []
    ret = [[btree.content]]
    queue = [btree]
    while len(queue) > 0:
        new_queue = []
        for node in queue:
            if node.left is not None:
                new_queue.append(node.left)
            if node.right is not None:
                new_queue.append(node.right)
        queue = new_queue
        if len(queue) == 0:
            break
        ret.append([x.content for x in queue])
    return ret

#building testcase 1
def make_random_balanced_tree(depth):
    if depth>0:
        tree = BinaryTree(random.randint(0, 100))
        tree.left=make_random_balanced_tree(depth-1)
        tree.right=make_random_balanced_tree(depth-1)
        return tree
    else:
        return None

balanced_tree = make_random_balanced_tree(5)


#testing

print balanced_tree

print "\nIs changed to:\n"

count=0
for ll in binary_tree_to_list_of_linked_lists(balanced_tree):
    count += 1
    print str(count) + ": " + str(ll)

print "\nlist version", binary_tree_to_list(balanced_tree)
    
#sample output of binary_tree_to_list_of_linked_lists
##( 60 ( ( 59 ( ( 32 ( ( 95 ( ( 42 ( None | None)) | ( 11 ( None | None)))) | ( 1 ( ( 56 ( None | None)) | ( 11 ( None | None)))))) | ( 26 ( ( 25 ( ( 68 ( None | None)) | ( 56 ( None | None)))) | ( 29 ( ( 41 ( None | None)) | ( 21 ( None | None)))))))) | ( 88 ( ( 63 ( ( 58 ( ( 4 ( None | None)) | ( 70 ( None | None)))) | ( 30 ( ( 53 ( None | None)) | ( 38 ( None | None)))))) | ( 4 ( ( 93 ( ( 91 ( None | None)) | ( 21 ( None | None)))) | ( 55 ( ( 62 ( None | None)) | ( 25 ( None | None))))))))))
##
##Is changed to:
##
##1: ( 60None )
##2: ( 88( 59None ) )
##3: ( 4( 63( 26( 32None ) ) ) )
##4: ( 55( 93( 30( 58( 29( 25( 1( 95None ) ) ) ) ) ) ) )
##5: ( 25( 62( 21( 91( 38( 53( 70( 4( 21( 41( 56( 68( 11( 56( 11( 42None ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )

#sample output of binary_tree_to_list_of_linked_lists
#list version [[18], [48, 46], [12, 80, 100, 45], [23, 9, 85, 73, 52, 40, 65, 30], [43, 94, 53, 94, 96, 35, 30, 37, 28, 9, 95, 84, 74, 49, 45, 24]]
