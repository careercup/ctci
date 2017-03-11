#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.5. Write a method to compute all permutations of a string.

import itertools
import math
import random
import string
import unittest

def permutations(str_):
    """ Return a generator of all the permutations of the string. """

    # A string such as 'a' has itself as its only permutation, while for 'ab'
    # the permutations are 'ab' and 'ba'. For 'abc', a three-character string,
    # there are six permutations: 'abc', 'acb', 'bac', 'bca', 'cab', 'cba'. Two
    # of these permutations, 'abc' and 'acb', start with 'a', and what follows
    # this first character is, respectively, 'bc' and 'cb': the two possible
    # permutations of 'cb'. This allows us to see the pattern here: for each
    # letter in the string we need to concatenate to it the sub-permutations
    # that can be generated when the letter is removed from the string.

    if len(str_) == 1:
        yield str_

    for index, letter in enumerate(str_):
        # The string without the index-th letter
        without = str_[:index] + str_[index + 1:]
        for sub_permutation in permutations(without):
            yield letter + sub_permutation

class PermutationsTest(unittest.TestCase):

    def test_permutations(self):

        for _ in xrange(50):

            size = random.randint(1, 8)
            str_ = ''.join(random.sample(string.lowercase, size))
            # itertools.permutations() returns tuples such as ('a', 'b', 'c')
            it = (''.join(s) for s in itertools.permutations(str_, len(str_)))
            expected = sorted(it)
            output = sorted(permutations(str_))

            self.assertEqual(output, expected)
            self.assertEqual(len(output), math.factorial(len(str_)))
            msg = "{0!r}: {1}! = {2} permutations"
            print msg.format(str_, len(str_), len(output))

if __name__ == "__main__":
    unittest.main()
