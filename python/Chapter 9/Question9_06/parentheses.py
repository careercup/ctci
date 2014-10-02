#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.6. Implement an algorithm to print all valid (e.g., properly opened and
# closed) combinations of n-pairs of parentheses.
#
# EXAMPLE
# Input: 3
# Output: ((())), (()()), (())(), ()(()), ()()()

import unittest

def parentheses(n):
    """ Return a generator of all the combinations of n-pairs of parentheses. """

    # For a single pair of parentheses there is only one possible combination,
    # P(1) = "()", while P(2) = "(())" and "()()". For three pairs there are
    # five different answers: "((()))", "(()())", "(())()", "()(())", "()()()".
    # As the combinations of parentheses must be valid, there are only three
    # ways in which we can generate P(n) from P(n-1): the additional pair of
    # parentheses can be (a) used to surround P(n-1), (b) prepended to P(n-1)
    # or (c) appended to P(n-1).

    if n == 1:
        yield "()"
        return

    for p in parentheses(n - 1):
        p1 = "({0})".format(p)
        p2 = "(){0}".format(p)
        p3 = "{0}()".format(p)

        # If p is a sequence of open-closed parentheses, such as '()()', p2 and
        # p3 are the same string, as we prepend and append an additional '()'
        # to it, respectively. Yield only one of them to avoid duplicates.

        yield p1
        yield p2
        if p3 != p2:
            yield p3

class ParenthesesTest(unittest.TestCase):

    def test_parentheses(self):

        def f(n):
            """ Return a sorted list with the combinations of parentheses. """
            return sorted(parentheses(n))

        self.assertEqual(f(1), ['()'])
        self.assertEqual(f(2), ['(())', '()()'])
        self.assertEqual(f(3), ['((()))', '(()())', '(())()', '()(())', '()()()'])

if __name__ == "__main__":
    unittest.main()
