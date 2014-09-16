#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.3. A magic index in an array A[0...n-1] is defined to be an index such that
# A[i] = i. Given a sorted array of distinct integers, write a method to find a
# magic index, if one exists, in array A.
#
# FOLLOW UP
#
# What if the values are not distinct?

import unittest

def magic_index(seq, start = None, end = None):
    """ Return the magic index, or -1 if it does not exist. """

    if start is None:
        start = 0

    if end is None:
        end = len(seq) - 1

    if start > end:
        return -1

    # This is very similar to the binary search problem: we check whether the
    # middle index is a magic one, and if it is not we repeat the same action
    # on the sub-array to its left or to its right. Which side? It depends on
    # the value on the index and its corresponding element:
    #
    # The fact that the elements of the sequence are distinct integers allows
    # us to draw a conclusion if index > seq[index]: the magic index, in case
    # it exists, cannot be on the left side. The index decreases one by one and
    # the (unique) elements by at least one, so (index - n) is guaranteed to be
    # larger than seq[index - n]. In other words: if we reach a point where the
    # index is larger than the corresponding element, we can only hope that the
    # element eventually catches up, since the index increases one by one while
    # the elements can make larger leaps, so to speak.

    index = (start + end) // 2
    if index == seq[index]:
        return index

    if index > seq[index]:
        return magic_index(seq, start=index+1, end=end)
    else:
        return magic_index(seq, start=start, end=index-1)

class MagicIndexTest(unittest.TestCase):

    def test_magic_index(self):

        f = magic_index
        self.assertEqual( 1, f([0, 1, 2]))
        self.assertEqual( 1, f([-2, 1, 3]))
        self.assertEqual(-1, f([-2, 0, 1]))
        self.assertEqual(-1, f([-2, -1, 1]))
        self.assertEqual(-1, f([-3, -1, 1]))
        self.assertEqual(-1, f([-3, -2, -1]))
        self.assertEqual( 3, f([-4, 0, 1, 3]))
        self.assertEqual( 1, f([-1, 1, 2, 4]))
        self.assertEqual(-1, f([-1, 0, 1, 4]))
        self.assertEqual(-1, f([-2, -1, 0, 4]))
        self.assertEqual(-1, f([-3, -1, 0, 2]))
        self.assertEqual(-1, f([1, 2, 3, 5, 6]))
        self.assertEqual( 2, f([-5, 1, 2, 3, 5]))
        self.assertEqual( 3, f([-4, -3, 0, 3, 5]))
        self.assertEqual(-1, f([-5, -4, -1, 1, 2]))
        self.assertEqual( 4, f([-3, 0, 1, 2, 4, 6]))
        self.assertEqual(-1, f([-3, -2, -1, 0, 1, 4]))
        self.assertEqual(-1, f([-4, -3, -2, 2, 3, 4]))
        self.assertEqual(-1, f([-3, -2, 1, 4, 5, 6, 7]))
        self.assertEqual(-1, f([-7, -2, 3, 5, 6, 7, 8]))
        self.assertEqual(-1, f([-6, -5, -1, 2, 3, 4, 5]))
        self.assertEqual(-1, f([-5, -3, -1, 1, 6, 7, 8]))
        self.assertEqual(-1, f([-3, -2, -1, 1, 3, 4, 5]))
        self.assertEqual(-1, f([-5, -4, -3, 4, 5, 7, 8, 9]))
        self.assertEqual(-1, f([-7, -3, -2, -1, 1, 6, 7, 8]))
        self.assertEqual(-1, f([-7, -6, 0, 1, 3, 4, 5, 6, 7]))
        self.assertEqual( 5, f([-5, -4, -3, -2, 2, 5, 7, 8, 9]))
        self.assertEqual(-1, f([-7, -6, -5, -4, 2, 3, 4, 5, 6]))
        self.assertEqual( 5, f([-7, -6, -4, -1, 1, 5, 7, 8, 9, 10]))
        self.assertEqual(10, f([-9, -7, -4, 0, 1, 2, 3, 6, 7, 8, 10]))
        self.assertEqual( 8, f([-10, -9, -8, -7, -6, -5, 1, 2, 8, 10]))
        self.assertEqual(-1, f([-10, -9, -8, -7, -5, -1, 0, 1, 5, 6, 9]))
        self.assertEqual(-1, f([-11, -10, -9, -8, -7, -5, -1, 0, 1, 2, 8]))
        self.assertEqual(-1, f([-11, -7, -6, -5, -2, -1, 8, 9, 10, 11, 12]))
        self.assertEqual(-1, f([-12, -9, -4, -3, -2, 1, 2, 3, 4, 7, 8, 12]))
        self.assertEqual( 8, f([-8, -7, -5, -4, -3, -1, 0, 7, 8, 9, 10, 11]))
        self.assertEqual(11, f([-8, -7, -2, -1, 2, 3, 5, 6, 7, 8, 9, 11, 12]))
        self.assertEqual(10, f([-11, -7, -6, -4, 0, 1, 2, 6, 7, 8, 10, 12, 13]))
        self.assertEqual(12, f([-12, -11, -10, -9, -8, -7, 1, 2, 3, 4, 7, 9, 12]))
        self.assertEqual( 6, f([-8, -7, -3, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]))
        self.assertEqual( 9, f([-10, -6, -4, -3, -2, -1, 2, 4, 8, 9, 10, 11, 12]))
        self.assertEqual(11, f([-12, -11, -6, -5, -4, -3, -2, 0, 1, 3, 5, 11, 12]))
        self.assertEqual(11, f([-12, -11, -10, -9, -8, -7, -1, 0, 4, 5, 10, 11, 13]))
        self.assertEqual(12, f([-13, -12, -8, -6, -5, -4, 2, 3, 4, 6, 7, 8, 12, 14]))
        self.assertEqual(-1, f([-10, -8, -7, -4, -3, -1, 0, 1, 2, 3, 4, 5, 6, 9, 12]))
        self.assertEqual(-1, f([-8, -7, -6, -4, -3, 0, 2, 3, 4, 6, 7, 12, 13, 14, 15]))
        self.assertEqual(12, f([-12, -11, -10, -9, -8, -7, -6, -5, -4, 3, 8, 9, 12, 13]))
        self.assertEqual(14, f([-15, -11, -7, -5, -3, 0, 1, 4, 5, 8, 9, 10, 11, 12, 14]))
        self.assertEqual(14, f([-12, -10, -9, -8, -7, -1, 0, 4, 5, 6, 7, 8, 10, 11, 14]))
        self.assertEqual(13, f([-14, -13, -10, -9, -8, -4, -2, -1, 0, 1, 2, 5, 12, 13, 15]))

if __name__ == "__main__":
    unittest.main()
