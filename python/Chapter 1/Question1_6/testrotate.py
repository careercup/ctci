from rotateimg import *
import unittest

class TestRotate(unittest.TestCase):
    def testEmpty(self):
        '''rotate must return empty for empty matrices'''
        self.assertEqual(rotate([[]]), [[]])

    def testOneByOne(self):
        '''rotate must return the original for 1x1 matrices'''
        self.assertEqual(rotate([[1]]), [[1]])

    def testTwoByTwo(self):
        '''rotate must reverse 90 degrees 2x2 matrices'''
        orig = [ [1, 2], 
                 [3, 4] ]
        
        exp =  [ [3, 1],
                 [4, 2] ]
        expected = rotate(orig)
        self.assertEqual(expected, exp)

    def testThreeByThree(self):
        '''rotate must reverse 90 degrees 3x3 matrices'''
        orig = [ [1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9] ]
        
        exp =  [ [7, 4, 1],
                 [8, 5, 2],
                 [9, 6, 3] ]
        expected = rotate(orig)
        self.assertEqual(expected, exp)

if __name__ == '__main__':
    unittest.main()
