import unittest
from compress import *

class TestCompress(unittest.TestCase):
    def testEmpty(self):
        '''compress must return empty for empty strings'''
        self.assertEqual('', compress(''))

    def testSingle(self):
        '''compress must return the original string for single character strings'''
        self.assertEqual('a', compress('a'))

    def testCompress(self):
        '''compress must return the expected output for known strings'''
        words = ( ('aaaabbbccd', 'a4b3c2d1'),
                  ('aaabbbbccd', 'a3b4c2d1'),
                  ('abccccdddeeeee', 'a1b1c4d3e5') )
        for (orig, expected) in words:
            e = compress(orig)
            self.assertEqual(expected, e)

    def testNoCompress(self):
        '''compress must not compress strings that turn out to have length >= than the original'''
        words = ( ('aabc', 'aabc'),
                  ('abbbc', 'abbbc'),
                  ('abccdee', 'abccdee') )
        for (orig, expected) in words:
            e = compress(orig)
            self.assertEqual(expected, e)

if __name__ == '__main__':
    unittest.main()
        
