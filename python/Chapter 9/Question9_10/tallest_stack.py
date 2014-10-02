#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.10. You have a stack of n boxes, with widths w_{i}, heights h_{i} and
# depths d_{i}. The boxes cannot be rotated and can only be stacked on top of
# one another if each box in the stack is strictily larger than the box above
# it in width, height, and depth. Implement a method to build the tallest stack
# possible, where the height of a stack is the sum of the heights of each box.

import collections
import functools
import unittest

def memoize(f):
    """ Minimalistic memoization decorator (*args / **kwargs)
    Based on: http://code.activestate.com/recipes/577219/ """

    cache = {}
    @functools.wraps(f)
    def memf(*args, **kwargs):
        fkwargs = frozenset(kwargs.items())
        if (args, fkwargs) not in cache:
            cache[args, fkwargs] = f(*args, **kwargs)
        return cache[args, fkwargs]
    return memf

# Use total_ordering() with a namedtuple. We need to use a mixin because
# total_ordering() only defines the rich comparison ordering methods that
# are missing from the class, but a namedtuple implements them all. See:
# https://stackoverflow.com/a/12614638/184363

@functools.total_ordering
class _Box(object):

    def __lt__(self, other):
        """ Return whether 'self' can be stacked on top of 'other'. """

        return (self.width  < other.width and
                self.height < other.height and
                self.depth  < other.depth)

_BoxTuple = collections.namedtuple('_BoxTuple', "width height depth")
class Box(_Box, _BoxTuple):
    pass

class Stack(frozenset):
    """ An immutable (and hashable) set of Boxes. """

    def stackable_on(self, bottom):
        """ Return a Stack with the Boxes that can be stacked on 'bottom'. """
        return Stack(box for box in self if box < bottom)

    def subtract(self, box):
        """ Return a new Stack with 'box' removed. """
        return Stack(b for b in self if b != box)

    @staticmethod
    def height(seq):
        """ Return the height of a valid stack of Boxes.

        The Boxes must be given in a sorted sequence, where the first element
        is the bottom of the stack and the last one its top. In other words:
        the box at index i must be strictly larger in width, height and depth
        than the box at index i + 1. AssertionError is raised otherwise.

        """

        if __debug__:
            for index in xrange(0, len(seq) - 1):
                assert seq[index] > seq[index + 1]

        return sum(box.height for box in seq)

    @memoize
    def find_tallest(self):
        """ Return a sorted list with the Boxes that build the highest Stack. """

        # In order to build the highest stack, we need to try each of the boxes
        # as a possible bottom and find the height of the tallest stack than we
        # can obtain with it. This height is equal to the height of the bottom
        # box plus the height of the highest substack -- a recursive algorithm.
        # These substacks can only be built using the boxes that are strictly
        # smaller than the bottom.

        if not self:
            return []

        # Map each box to the highest substack we can build with it as bottom
        substacks = dict()
        for box in self:
            stack_ = self.subtract(box)
            stackable = stack_.stackable_on(box)
            substacks[box] = stackable.find_tallest()

        # Find the box for which the total height (its own height plus that
        # of the tallest substack) is the highest, and use it as the bottom.
        total_height = lambda x: x[0].height + Stack.height(x[1])
        bottom, stack_ = max(substacks.iteritems(), key=total_height)
        return [bottom] + stack_


class StackTest(unittest.TestCase):

    def test_find_tallest(self):

        b1 = Box(3, 4, 1)
        b2 = Box(8, 6, 2)
        b3 = Box(7, 8, 3)
        stack1 = Stack([b1, b2, b3])
        self.assertEqual(stack1.find_tallest(), [b3, b1])


        b1 = Box(1.5, 6.1, 7.3)
        b2 = Box(4.3, 6.3, 4.9)
        b3 = Box(4.1, 6.4, 9.4)
        b4 = Box(1.3, 0.8, 1.2)
        stack2 = Stack([b1, b2, b3, b4])
        self.assertEqual(stack2.find_tallest(), [b3, b1, b4])

if __name__ == "__main__":
    unittest.main()
