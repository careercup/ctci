#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# Given a boolean expression consisting of the symbols 0, 1, &, |, and ^, and
# a desired boolean result value 'result', implement a function to count the
# number of ways of parenthesizing the expression such that it evalues to
# 'result'.
#
# EXAMPLE
# Expression: 1^0|0|1
# Desired result: false (0)
# Output: 2 ways. 1^((0|0)|1) and 1^(0|(0|1))

import collections
import functools
import re
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

def get_operator_indexes(str_):
    """ Return a generator of the indexes where operators can be found.

    The returned generator yields, one by one, the indexes of 'str_' where
    there is an operator: either the character '&', '|', or '^'. For example,
    '1^0&0' yields 1 first and then 3, as '^' is the second character of the
    expression and '&' the fourth.

    """

    pattern = "&|\||\^"
    for match in re.finditer(pattern, str_):
        yield match.start()

# A two-level dictionary: map each logical operator (AND, OR, XOR) to the
# output (True or False) to a list of two-element tuples with the inputs that
# yield that result. For example, AND is only True when both inputs are True.

LOGICAL_OPS = collections.defaultdict(dict)
LOGICAL_OPS['&'][True ] = [(True, True)]
LOGICAL_OPS['&'][False] = [(False, False), (True, False), (False, True)]
LOGICAL_OPS['|'][True ] = [(True, True), (True, False), (False, True)]
LOGICAL_OPS['|'][False] = [(False, False)]
LOGICAL_OPS['^'][True ] = [(True,  False), (False, True)]
LOGICAL_OPS['^'][False] = [(True,  True), (False, False)]

@memoize
def parenthesize_count(expression, result):
    """ Return the number of ways of parenthesizing a boolean expression.

    This function counts the number of ways in which the boolean expression
    (given as a string consisting of the symbols 0, 1, &, |, and ^) can be
    parenthesized so that it evaluates to 'result' (either True or False).

    """

    # If the boolean expression has a single symbol, it will be either a one or
    # a zero. This is the base case: '1' is the only way of obtaining a True,
    # and '0' the only one of getting False. In other words: if, and only if,
    # the truth value of the symbol matches the result we are aiming for, we
    # have found a valid solution.

    if len(expression) == 1:
        value = int(expression)
        return int(bool(value) == result)

    # In order to parenthesize the boolean expression, we iterate through its
    # operators, parenthesizing what is to their left and to their right. For
    # example, '0|1&0' can be parenthesized as either '0|(1&0)' or '(0|1)&0'.
    # Now, for each of these inner expressions, the number of ways in which
    # we can obtain the desired boolean result depends on the operator: '&'
    # (AND), '|' (OR) or '^' (XOR). Therefore, we must break down each inner
    # expression, taking into account the combinations that yield the result
    # we are after. For example, if the operator is '&' and 'result' is True,
    # the only valid ways of parenthesizing the two expressions are those for
    # which they both evaluate to True.

    total = 0
    for index in get_operator_indexes(expression):
        left = expression[:index]
        operator_ = expression[index]
        right = expression[index+1:]

        for result_left, result_right in LOGICAL_OPS[operator_][result]:
            total += parenthesize_count(left,  result_left ) * \
                     parenthesize_count(right, result_right)

    return total


class ParenthesizeTest(unittest.TestCase):

    def test_parenthesize(self):

        f = parenthesize_count
        self.assertEqual(0,     f("0", True))
        self.assertEqual(1,     f("0", False))
        self.assertEqual(1,     f("1", True))
        self.assertEqual(0,     f("1", False))
        self.assertEqual(1,     f("0^1", True))
        self.assertEqual(0,     f("0^1", False))
        self.assertEqual(1,     f("1&1", True))
        self.assertEqual(0,     f("1&1", False))
        self.assertEqual(0,     f("1&0", True))
        self.assertEqual(1,     f("1&0", False))
        self.assertEqual(0,     f("1^1", True))
        self.assertEqual(1,     f("1^1", False))
        self.assertEqual(2,     f("1|1^0", True))
        self.assertEqual(0,     f("1|1^0", False))
        self.assertEqual(0,     f("0^0^0", True))
        self.assertEqual(2,     f("0^0^0", False))
        self.assertEqual(0,     f("1&1&0", True))
        self.assertEqual(2,     f("1&1&0", False))
        self.assertEqual(0,     f("0|0&1", True))
        self.assertEqual(2,     f("0|0&1", False))
        self.assertEqual(0,     f("1&0&0", True))
        self.assertEqual(2,     f("1&0&0", False))
        self.assertEqual(0,     f("0^1&0", True))
        self.assertEqual(2,     f("0^1&0", False))
        self.assertEqual(2,     f("1|1|0", True))
        self.assertEqual(0,     f("1|1|0", False))
        self.assertEqual(0,     f("0|1^1", True))
        self.assertEqual(2,     f("0|1^1", False))
        self.assertEqual(3,     f("1^0|0|1", True))
        self.assertEqual(2,     f("1^0|0|1", False))
        self.assertEqual(0,     f("1&1&0^0", True))
        self.assertEqual(5,     f("1&1&0^0", False))
        self.assertEqual(3,     f("1^0^0&0", True))
        self.assertEqual(2,     f("1^0^0&0", False))
        self.assertEqual(7,     f("1^1^1^0|1", True))
        self.assertEqual(7,     f("1^1^1^0|1", False))
        self.assertEqual(9,     f("0|1&0&1^1", True))
        self.assertEqual(5,     f("0|1&0&1^1", False))
        self.assertEqual(14,    f("0|0|1^0^0", True))
        self.assertEqual(0,     f("0|0|1^0^0", False))
        self.assertEqual(28,    f("1^0&0&1&1^0", True))
        self.assertEqual(14,    f("1^0&0&1&1^0", False))
        self.assertEqual(104,   f("0^0|1&1^1|0|1", True))
        self.assertEqual(28,    f("0^0|1&1^1|0|1", False))
        self.assertEqual(132,   f("0^0|1&1&0|1|1", True))
        self.assertEqual(0,     f("0^0|1&1&0|1|1", False))
        self.assertEqual(43,    f("0&1&0|0|1|0&1", True))
        self.assertEqual(89,    f("0&1&0|0|1|0&1", False))
        self.assertEqual(249,   f("1&1|1^1|1^1^0^0", True))
        self.assertEqual(180,   f("1&1|1^1|1^1^0^0", False))
        self.assertEqual(84,    f("0&1^1|1^1^1&0|0", True))
        self.assertEqual(345,   f("0&1^1|1^1^1&0|0", False))
        self.assertEqual(174,   f("1|1&1&1&1^1^0&0", True))
        self.assertEqual(255,   f("1|1&1&1&1^1^0&0", False))
        self.assertEqual(0,     f("0|0&1|0&0&1|0^0", True))
        self.assertEqual(429,   f("0|0&1|0&0&1|0^0", False))
        self.assertEqual(276,   f("0|0&1|1^0|0&0|1", True))
        self.assertEqual(153,   f("0|0&1|1^0|0&0|1", False))
        self.assertEqual(203,   f("1^0^1&1^0^1^1&0", True))
        self.assertEqual(226,   f("1^0^1&1^0^1^1&0", False))
        self.assertEqual(1140,  f("1|0^1&1|1^1^1&1|1", True))
        self.assertEqual(290,   f("1|0^1&1|1^1^1&1|1", False))
        self.assertEqual(182,   f("1&0&1^1&1^1|0|0^0", True))
        self.assertEqual(1248,  f("1&0&1^1&1^1|0|0^0", False))
        self.assertEqual(202,   f("1&0|0&1^1^1&1^0&1", True))
        self.assertEqual(1228,  f("1&0|0&1^1^1&1^0&1", False))
        self.assertEqual(2739,  f("0^0|1^1&0&1^0|0|0&1", True))
        self.assertEqual(2123,  f("0^0|1^1&0&1^0|0|0&1", False))
        self.assertEqual(4236,  f("1|0|0&1^1|1|1^0&1&1", True))
        self.assertEqual(626,   f("1|0|0&1^1|1|1^0&1&1", False))
        self.assertEqual(4482,  f("1&1^1^0^1&0|1&1|0|0", True))
        self.assertEqual(380,   f("1&1^1^0^1&0|1&1|0|0", False))
        self.assertEqual(648,   f("0^0&0&1^0&0|0^1^0&0", True))
        self.assertEqual(4214,  f("0^0&0&1^0&0|0^1^0&0", False))
        self.assertEqual(13055, f("1|1|1^1^1|1&1^1&0&1&1", True))
        self.assertEqual(3741,  f("1|1|1^1^1|1&1^1&0&1&1", False))
        self.assertEqual(1849,  f("0&0&1^1|1^0&0^1|0&0&0", True))
        self.assertEqual(14947, f("0&0&1^1|1^0&0^1|0&0&0", False))
        self.assertEqual(1968,  f("0&0^0|1^1|1&0^1^1^1&0", True))
        self.assertEqual(14828, f("0&0^0|1^1|1&0^1^1^1&0", False))
        self.assertEqual(11863, f("1|0&1&1|0|0|0^0|1^1^1", True))
        self.assertEqual(4933,  f("1|0&1&1|0|0|0^0|1^1^1", False))
        self.assertEqual(9805,  f("1^0|1|1^1^1|0|0^1^0&1", True))
        self.assertEqual(6991,  f("1^0|1|1^1^1|0|0^1^0&1", False))
        self.assertEqual(0,     f("0^0|0^0&1&1|0^0&1&0&0", True))
        self.assertEqual(16796, f("0^0|0^0&1&1|0^0&1&0&0", False))
        self.assertEqual(2582,  f("0&1&1|1&1|0^0^1|1&0&1", True))
        self.assertEqual(14214, f("0&1&1|1&1|0^0^1|1&0&1", False))
        self.assertEqual(11540, f("1|0^1&0|1^1^0^0&0^0&1", True))
        self.assertEqual(5256,  f("1|0^1&0|1^1^0^0&0^0&1", False))
        self.assertEqual(16796, f("1&1&0|1|1|1|1|1|0&0|1", True))
        self.assertEqual(0,     f("1&1&0|1|1|1|1|1|0&0|1", False))
        self.assertEqual(7083,  f("0^1|0&1^0^1&1|0|1&0&1", True))
        self.assertEqual(9713,  f("0^1|0&1^0^1&1|0|1&0&1", False))
        self.assertEqual(19782, f("1^1|1^0&0|1|0&1^1&0&1^0", True))
        self.assertEqual(39004, f("1^1|1^0&0|1|0&1^1&0&1^0", False))
        self.assertEqual(20917, f("0^0^1^1^1&0&0|1^1&1|1^1", True))
        self.assertEqual(37869, f("0^0^1^1^1&0&0|1^1&1|1^1", False))
        self.assertEqual(10396, f("0|1&1&1^1&1^1|1&0^0&0&0", True))
        self.assertEqual(48390, f("0|1&1&1^1&1^1|1&0^0&0&0", False))
        self.assertEqual(34209, f("1^1&0|1^0^1&0|1^0&0&1|1", True))
        self.assertEqual(24577, f("1^1&0|1^0^1&0|1^0&0&1|1", False))

if __name__ == "__main__":
    unittest.main()
