"""
2.6
Given a circular linked list, implement an algorithm which returns the
node at the beginning of the loop.
"""
from classes import ListFactory, SpecialNode

def loopFinder(llist):
    """
    Find the start point of a loop within a linked list.
    Implements walker/runner.
    Time complexity = O(n)
    Space complexity = O(1)
    """
    # find the collision point
    walker, runner = llist.head, llist.head
    while walker is not None:
        walker = walker.nextNode
        runner = runner.nextNode.nextNode
        if walker == runner:
            assert walker.nextNode is not None, \
                "Linked list does not have a loop"
            break

    # move from head to collision point
    walker = llist.head
    while walker != runner:
        walker = walker.nextNode
        runner = runner.nextNode
    return walker.data
    

if __name__ == "__main__":
    values = [0, 5, 4, 3]
    loopVals = [10, 20, 30, 40, 50]
    llist = ListFactory(values, nodeType=SpecialNode)
    looplist = ListFactory(loopVals, nodeType=SpecialNode)
    print "{0} with loop {1} attached at {2}".format(llist, looplist, looplist.head)
    llist.tail.nextNode = looplist.head             # attach loop start to tail of llist
    looplist.tail.nextNode = llist.tail.nextNode    # attach loop end to tail of llist
    print "Loop starts at {0}".format(loopFinder(llist))

