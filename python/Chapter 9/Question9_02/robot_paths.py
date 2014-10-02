#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.2. Imagine a robot sitting on the upper left corner of an X by Y grid. The
# robot can only move in two directions: right and down. How many possible
# paths are there for the robot to go from (0, 0) to (X, Y)?
#
# FOLLOW UP
#
# Imagine certain spots are "off limits", such that the robot cannot step on
# them. Design an algorithm to find a path for the robot from the top left to
# the bottom right.

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

class Grid(object):

    def __init__(self, x, y):
        self.x = x
        self.y = y
        self.forbidden_coords = set()

    def mark_as_forbidden(self, row, column):
        """ Mark (x, y) as off-limits """
        self.forbidden_coords.add((row, column))

    def is_allowed(self, row, column):
        """ Check whether (row, column) is a valid spot.

        Return True if (row, column) is inside the bounds of the grid and has
        not been marked as off-limits via the Grid.mark_as_forbidden() method.

        """

        return (0 <= row    < self.x and
                0 <= column < self.y and
                (row, column) not in self.forbidden_coords)

    @memoize
    def find_path(self, row = 0, column = 0):
        """ Return the path from (row, column) to (x - 1, y - 1) """

        # Finding a path from (x, y) to the destination is the same as moving
        # to its two neighbors, (x - 1, y) and (x, y - 1), and finding the path
        # from there: we keep doing this until a path reaches the destination.
        # Always try the right neighbor first, then, if it does not gives us a
        # valid solution, the bottom one. If the destination cannot be reached,
        # we backtrack returning None.

        destination = (self.x - 1, self.y - 1)
        current = [(row, column)]

        if (row, column) == destination:
            return current

        neighbors = []
        neighbors.append((row, column + 1))
        neighbors.append((row + 1, column))

        for n in neighbors:
            if self.is_allowed(*n):
                path = self.find_path(*n)
                # Subpath reaches bottom right
                if path and path[-1] == destination:
                    return current + path

class GridTest(unittest.TestCase):

    def test_find_path_simple_case(self):

        # 1 1
        # 1 1

        grid = Grid(2, 2)
        path = grid.find_path()
        expected = [(0, 0), (0, 1), (1, 1)]
        self.assertEqual(path, expected)

    def test_find_path_offlimits_spots(self):

        # 1 0
        # 1 1

        grid = Grid(2, 2)
        grid.mark_as_forbidden(0,1)
        path = grid.find_path()
        expected = [(0, 0), (1, 0), (1, 1)]
        self.assertEqual(path, expected)

        # 1 0 1
        # 1 1 1
        # 1 1 1

        grid = Grid(3, 3)
        grid.mark_as_forbidden(0,1)
        path = grid.find_path()
        expected = [(0, 0), (1, 0), (1, 1), (1, 2), (2, 2)]
        self.assertEqual(path, expected)

    def test_find_path_unreachable_destination(self):

        # 1 0
        # 0 1

        grid = Grid(2, 2)
        grid.mark_as_forbidden(0,1)
        grid.mark_as_forbidden(1,0)
        path = grid.find_path()
        self.assertEqual(path, None)

    def test_find_path_dead_end(self):

        # 1 1 0 0 0
        # 0 1 1 1 0 <-- dead-end corridor
        # 0 1 0 0 0
        # 0 1 1 1 1

        grid = Grid(4, 5)
        offlimits =  [(0, 2), (0, 3), (0, 4), (1, 0), (1, 4),
                      (2, 0), (2, 2), (2, 3), (2, 4), (3, 0)]

        for coords in offlimits:
            grid.mark_as_forbidden(*coords)

        path = grid.find_path()
        expected = [(0, 0), (0, 1), (1, 1), (2, 1), (3, 1), (3, 2), (3, 3), (3, 4)]
        self.assertEqual(path, expected)

if __name__ == "__main__":
    unittest.main()
