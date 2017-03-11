#! /usr/bin/env python

# Author: Victor Terron (c) 2014
# Email: `echo vt2rron1iaa32s | tr 132 @.e`
# License: GNU GPLv3

# 9.9. Write an algorithm to print all ways of arranging eight queens on an 8x8
# chess board so that none of them share the same row, column or diagonal. In
# this case, "diagonal" means all diagonals, not just the two that bisect the
# board.

import copy
import unittest

class ChessBoard(object):

    def __init__(self, n):
        """ Instantiate a n x n chessboard. """

        # Map each row to the column where a queen is placed
        self.queens = dict()
        self.size = n

    def __str__(self):
        """ The string representation of the ChessBoard.

        Example output:

        | | | | | | | |Q|
        | |Q| | | | | | |
        | | | | |Q| | | |
        | | |Q| | | | | |
        |Q| | | | | | | |
        | | | | | | |Q| |
        | | | |Q| | | | |
        | | | | | |Q| | |

        """

        squares = [[' '] * self.size for _ in xrange(self.size)]
        for x, y in self.queens.iteritems():
            squares[x][y] = 'Q'
        rows = ('|'.join(r) for r in squares)
        return '\n'.join('|{0}|'.format(r) for r in rows)

    def place(self, row, column):
        """ Place a queen on square (row, column). """
        self.queens[row] = column

    def is_free(self, row, column):
        """ Check whether (row, column) is a valid square for a new queen.

        Returns False in case there already is a queen placed on the same row,
        column or diagonal; True otherwise. In other words: this method tells
        us if a new queen can be placed on the board without being threatened
        by one of the existing queens.

        """

        # Rows and columns of already-placed queens
        for x, y in self.queens.items():

            if x == row:
                return False

            if y == column:
                return False

            # Two queens are in the same diagonal if the distance between
            # the rows is the same as the distance between the columns.
            if abs(row - x) == abs(column - y):
                return False

        return True

    @classmethod
    def queens_nways(cls, n, board=None, row=0, remaining=None):
        """ Return the number of solutions to the n-queens problem. """

        # Each row and column will be used only once, as otherwise two queens
        # would threaten each other. Therefore, for each row there are only n
        # possibilities, one for each of the n columns where a queen could be
        # placed. This approach allows us to tackle this problem recursively:
        # once a queen has been placed in a valid (non-threatened square) row,
        # we move to the next one and solve the problem of placing n-1 queens
        # on the same board, until each row contains a queen (i.e., until all
        # the queens have been placed).

        if not board:
            board = cls(n)

        if remaining is None:
            remaining = board.size

        # All queens placed
        if not remaining:
            return 1

        total = 0
        for column in xrange(board.size):
            if board.is_free(row, column):
                board_copy = copy.deepcopy(board)
                board_copy.place(row, column)
                total += cls.queens_nways(n, board_copy, row + 1, remaining - 1)
        return total


class ChessBoardTest(unittest.TestCase):

    def test_queens_nways(self):

        f = ChessBoard.queens_nways
        # https://oeis.org/A000170
        self.assertEqual(f(1), 1)
        self.assertEqual(f(2), 0)
        self.assertEqual(f(3), 0)
        self.assertEqual(f(4), 2)
        self.assertEqual(f(5), 10)
        self.assertEqual(f(6), 4)
        self.assertEqual(f(7), 40)
        self.assertEqual(f(8), 92)
        self.assertEqual(f(9), 352)
        self.assertEqual(f(10), 724)

if __name__ == "__main__":
    unittest.main()
