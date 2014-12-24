#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.7. Implement the "paint fill" function that one might see on many image
# editing programs. That is, given a screen (represented by a two-dimensional
# array of colors), a point, and a new color, fill in the surrounding area
# until the color changes from the original color.

import unittest

class Screen(object):

    def __init__(self, nrows, ncolumns):
        """ Instantiate a Screen, filled with zeros. """

        self.pixels = [[0] * ncolumns for _ in xrange(nrows)]
        self.xsize = nrows
        self.ysize = ncolumns

    @classmethod
    def make(cls, pixels):
        """ Return a new Screen object, initialized with 'pixels'. """

        xsize = len(pixels)
        ysize = len(pixels[0])
        s = cls(xsize, ysize)
        s.pixels = pixels
        return s

    def __getitem__(self, x):
        """ Return the x-th row. """
        return self.pixels[x]

    def __str__(self):
        """ The string representation, one row per line. """
        return '\n'.join(str(row) for row in self.pixels)

    def is_inside(self, x, y):
        """ Check whether the pixel (x, y) falls within the Screen. """
        return (0 <= x < self.xsize) and (0 <= y < self.ysize)

    def fill(self, x, y, new_color):
        """ Set (x, y) and fill the surrounding area until the color changes. """

        # This algorithm does exactly what we would do if we were painting the
        # area by hand. First, we set the new value of the initial pixel, and
        # then move to the neighbors (left, right, top and bottom) that have
        # the same color. This process is repeated until there are no neighbors
        # left that need to be modified, either because they have a different
        # color or because they fall outside of the screen boundaries.

        if not self.is_inside(x, y):
            return

        # Set new color, remember the old one
        old_color, self[x][y] = self[x][y], new_color

        neighbors = [(x + 1, y), # right
                     (x - 1, y), # left
                     (x, y + 1), # bottom
                     (x, y - 1)] # top

        for nx, ny in neighbors:
            if self.is_inside(nx, ny) and self[nx][ny] == old_color:
                self.fill(nx, ny, new_color)


class ScreenTest(unittest.TestCase):

    def test_fill(self):

        s1 = Screen.make([[0, 0],
                          [0, 2]])
        s1.fill(0, 0, 3)
        self.assertEqual(s1.pixels, [[3, 3],
                                     [3, 2]])

        s2 = Screen.make([[0, 0, 0, 1],
                          [0, 1, 0, 2],
                          [0, 1, 1, 2]])
        s2.fill(1, 2, 4)
        self.assertEqual(s2.pixels, [[4, 4, 4, 1],
                                     [4, 1, 4, 2],
                                     [4, 1, 1, 2]])

        # Unconnected area at top right corner
        s3 = Screen.make([[2, 1, 1, 2, 2],
                          [2, 1, 1, 0, 0],
                          [2, 1, 2, 1, 2],
                          [2, 2, 2, 2, 2]])

        s3.fill(2, 2, 0)
        self.assertEqual(s3.pixels, [[0, 1, 1, 2, 2],
                                     [0, 1, 1, 0, 0],
                                     [0, 1, 0, 1, 0],
                                     [0, 0, 0, 0, 0]])

if __name__ == "__main__":
    unittest.main()
