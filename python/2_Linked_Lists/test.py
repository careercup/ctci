# All imports
import unittest
from classes import ListFactory, Node, SpecialNode
removeDuplicates = __import__('2_1').removeDuplicates
removeDuplicates2 = __import__('2_1').removeDuplicates2
last = __import__('2_2').last
deleteNode = __import__('2_3').deleteNode
partition = __import__('2_4').partition
listAdder = __import__('2_5').listAdder
loopFinder = __import__('2_6').loopFinder
iter_palindrome = __import__('2_7').iter_palindrome
rec_palindrome = __import__('2_7').rec_palindrome
 

class Test(unittest.TestCase):
    def test_1(self):
        values = [1, 1, 3, 2, 5, 3]
        list1, list2 = ListFactory(values), ListFactory(values)
        removeDuplicates(list1)
        removeDuplicates2(list2)
        self.assertEquals(list1.toList(), [1, 3, 2, 5])
        self.assertEquals(list2.toList(), [1, 3, 2, 5])

    def test_2(self):
        llist = ListFactory([1, 2, 3, 4, 5, 9])
        k = 1
        self.assertEquals(last(llist, k), 9)

    def test_3(self):
        llist = ListFactory([1, 2, 3, 4, 5, 6])
        removing_node = llist.head.nextNode.data
        deleteNode(llist.head.nextNode)
        self.assertEquals(llist.toList(), [1, 3, 4, 5, 6])

    def test_4(self):
        llist = ListFactory([4, 8, 3, 2, 1, 3])
        partValue = 3 
        partitioned = partition(partValue, llist)
        self.assertEquals(partitioned.toList(), [2, 1, 4, 8, 3, 3])

    def test_5(self):
        value1, value2 = [0, 0, 3], [0, 5, 4]
        llist1, llist2 = ListFactory(value1), ListFactory(value2)
        total = listAdder(llist1, llist2)
        self.assertEquals(total.toList(), [0, 5, 7])

    def test_6(self):
        values = [0, 5, 4, 3]
        loopVals = [10, 20, 30, 40, 50]
        llist = ListFactory(values, nodeType=SpecialNode)
        looplist = ListFactory(loopVals, nodeType=SpecialNode)
        llist.tail.nextNode = looplist.head             # attach loop to [10]
        looplist.tail.nextNode = llist.tail.nextNode    # attach loop end to [10]
        self.assertEquals(loopFinder(llist), 10)

    def test_7(self):
        # Iterative
        llist =  ListFactory([1, 2, 3, 4, 5])
        pal = iter_palindrome(llist)
        self.assertEquals(pal, False)

       #Recursive
        llist =  ListFactory([1, 2, 3, 4, 5, 4, 3, 2, 1])
        pal = rec_palindrome(llist)
        self.assertEquals(pal, True)


if __name__ == "__main__":
    unittest.main()
