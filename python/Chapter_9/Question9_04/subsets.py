#! /usr/bin/env python
# encoding: UTF-8

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.4. Write a method to return all subsets of a set.

import unittest

def subsets(seq):
    """ Return a generator of all the subsets. """

    # The subsets of S ∪ {e} are all the subsets of S, P(S), plus P(S) again
    # but where element e has been added. For example, and assuming that the
    # scalar product notation, n * P(S), means "add n to each of the subsets
    # of P(S)":
    #
    # P({})   = {∅}
    # P({a})  = {{∅}, {a}} = P({}) + (a * P({}))
    # P({ab}) = {{∅}, {a}, {b}, {ab}} = P(a) + (b * P{a})
    #
    # This can be generalized to recursively generate all the subsets of S:
    # take a random element of the set, e, and generate P(S - e). Then, for
    # each of these subsets, we generate an additional one with e added. Do
    # this until the base case, an empty set, is reached.

    set_ = list(seq)
    if len(set_) < 1:
        yield set_
        return

    element = [set_.pop()]
    for sub in subsets(set_):
        yield sub
        yield sub + element

class SubsetTest(unittest.TestCase):

    def test_subset(self):

        def f(x):
            """ Return a sorted list with all the subsets.

            The list is sorted by the number of elements in the set and then
            lexicographically. For example: [[], [1], [2], [12]]. Python sorts
            are guaranteed to be stable, so we can build this sort in a series
            of two sorting steps.

            """

            subs = list(subsets(x))
            subs.sort()
            subs.sort(key = len)
            return subs

        self.assertEqual(f('')  , [[]])

        self.assertEqual(f('a') , [[],
                                   ['a']])

        self.assertEqual(f('ab'), [[],
                                   ['a'], ['b'],
                                   ['a', 'b']])

        self.assertEqual(f('abc'), [[],
                                    ['a'], ['b'], ['c'],
                                    ['a', 'b'], ['a', 'c'], ['b', 'c'],
                                    ['a', 'b', 'c']])

if __name__ == "__main__":
    unittest.main()
