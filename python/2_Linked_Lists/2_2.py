"""
2.2
Implement an algorithm to find the kth to last element in a singly linked list.
"""
from classes import ListFactory

def last(llist, k):
    """
    Uses runner strategy to scout how are ahead the end is. When correct
    index is reached by the walker, the data of that node is returned.
    Time complexity: O(n)
    Space complexity: O(1)
    """
    assert k > 0, "k needs to be larger than 0"
    assert k <= llist.size, "k needs to be smaller than the list length"

    walker, runner = llist.head, llist.head
    walkCount, runCount = 0, 0
    while walker.nextNode != None:
        walkCount += 1
        while runner.nextNode != None:
            runCount += 1
            runner = runner.nextNode
        if walkCount == runCount - (k - 1):
            return walker.nextNode.data
        walker = walker.nextNode


if __name__ == "__main__":
    k = 1
    values = [1, 2, 3, 4, 5, 9]
    llist = ListFactory(values)
    print "Index[-{0}] of {1} is {2}".format(k, values, last(llist, k))
