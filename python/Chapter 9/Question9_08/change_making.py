#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.8. Given an infinite number of quarters (25 cents), dimes (10 cents),
# nickels (5 cents) and pennies (1 cent), write code to calculate the
# number of ways of representing n cents.

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

@memoize
def make_change(n, coin=None):
    """ Return the number of ways of representing n cents. """

    # For any given quantity, say n, we can make change using any number of
    # quarters, starting from zero and up to a number whose total does not
    # exceed n (e.g., for 73 cents we could use zero, one or two quarters, but
    # not three). Then, for each of these possibilities, we can use any number
    # of dimes to make change for the remaining quantity, and then nickels. Do
    # this recursively until all there is left are pennies (the base case):
    # when this happens, they are the only way in which we can make change.

    if not n:
        return 1

    coins = (1, 5, 10, 25)

    if not coin:
        # Highest coin we can use for this amount
        coin  = max(c for c in coins if c <= n)

    # There is just one way to make change with pennies
    if coin == 1:
        return 1

    # Next denomination coin (e.g., dime to nickel)
    next_ = coins[coins.index(coin) - 1]

    total = 0
    max_coins = n // coin
    for ncoins in xrange(max_coins + 1):
        remaining = n - (ncoins * coin)
        total += make_change(remaining, coin=next_)
    return total

class MakeChangeTest(unittest.TestCase):

    def test_make_change(self):

        f = make_change
        self.assertEqual(f(0), 1)
        self.assertEqual(f(1), 1)
        self.assertEqual(f(2), 1)
        self.assertEqual(f(3), 1)
        self.assertEqual(f(4), 1)
        self.assertEqual(f(5), 2)
        self.assertEqual(f(6), 2)
        self.assertEqual(f(7), 2)
        self.assertEqual(f(8), 2)
        self.assertEqual(f(9), 2)
        self.assertEqual(f(10), 4)
        self.assertEqual(f(11), 4)
        self.assertEqual(f(12), 4)
        self.assertEqual(f(13), 4)
        self.assertEqual(f(14), 4)
        self.assertEqual(f(15), 6)
        self.assertEqual(f(16), 6)
        self.assertEqual(f(17), 6)
        self.assertEqual(f(18), 6)
        self.assertEqual(f(19), 6)
        self.assertEqual(f(20), 9)
        self.assertEqual(f(21), 9)
        self.assertEqual(f(22), 9)
        self.assertEqual(f(23), 9)
        self.assertEqual(f(24), 9)
        self.assertEqual(f(25), 13)
        self.assertEqual(f(26), 13)
        self.assertEqual(f(27), 13)
        self.assertEqual(f(28), 13)
        self.assertEqual(f(29), 13)
        self.assertEqual(f(30), 18)
        self.assertEqual(f(31), 18)
        self.assertEqual(f(32), 18)
        self.assertEqual(f(33), 18)
        self.assertEqual(f(34), 18)
        self.assertEqual(f(35), 24)
        self.assertEqual(f(36), 24)
        self.assertEqual(f(37), 24)
        self.assertEqual(f(38), 24)
        self.assertEqual(f(39), 24)
        self.assertEqual(f(40), 31)
        self.assertEqual(f(41), 31)
        self.assertEqual(f(42), 31)
        self.assertEqual(f(43), 31)
        self.assertEqual(f(44), 31)
        self.assertEqual(f(45), 39)
        self.assertEqual(f(46), 39)
        self.assertEqual(f(47), 39)
        self.assertEqual(f(48), 39)
        self.assertEqual(f(49), 39)
        self.assertEqual(f(50), 49)
        self.assertEqual(f(51), 49)
        self.assertEqual(f(52), 49)
        self.assertEqual(f(53), 49)
        self.assertEqual(f(54), 49)
        self.assertEqual(f(55), 60)
        self.assertEqual(f(56), 60)
        self.assertEqual(f(57), 60)
        self.assertEqual(f(58), 60)
        self.assertEqual(f(59), 60)
        self.assertEqual(f(60), 73)
        self.assertEqual(f(61), 73)
        self.assertEqual(f(62), 73)
        self.assertEqual(f(63), 73)
        self.assertEqual(f(64), 73)
        self.assertEqual(f(65), 87)
        self.assertEqual(f(66), 87)
        self.assertEqual(f(67), 87)
        self.assertEqual(f(68), 87)
        self.assertEqual(f(69), 87)
        self.assertEqual(f(70), 103)
        self.assertEqual(f(71), 103)
        self.assertEqual(f(72), 103)
        self.assertEqual(f(73), 103)
        self.assertEqual(f(74), 103)
        self.assertEqual(f(75), 121)
        self.assertEqual(f(76), 121)
        self.assertEqual(f(77), 121)
        self.assertEqual(f(78), 121)
        self.assertEqual(f(79), 121)
        self.assertEqual(f(80), 141)
        self.assertEqual(f(81), 141)
        self.assertEqual(f(82), 141)
        self.assertEqual(f(83), 141)
        self.assertEqual(f(84), 141)
        self.assertEqual(f(85), 163)
        self.assertEqual(f(86), 163)
        self.assertEqual(f(87), 163)
        self.assertEqual(f(88), 163)
        self.assertEqual(f(89), 163)
        self.assertEqual(f(90), 187)
        self.assertEqual(f(91), 187)
        self.assertEqual(f(92), 187)
        self.assertEqual(f(93), 187)
        self.assertEqual(f(94), 187)
        self.assertEqual(f(95), 213)
        self.assertEqual(f(96), 213)
        self.assertEqual(f(97), 213)
        self.assertEqual(f(98), 213)
        self.assertEqual(f(99), 213)
        self.assertEqual(f(100), 242)

if __name__ == "__main__":
    unittest.main()
