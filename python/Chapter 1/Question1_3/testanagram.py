import unittest
from anagram import *

class TestAnagram(unittest.TestCase):
    def testEmpty(self):
        '''anagram must return true for empty strings'''
        self.assertTrue(anagram('', ''))

    def testSingle(self):
        '''anagram must return true for single character strings'''
        self.assertTrue(anagram('a', 'a'))

    def testDoubleEq(self):
        '''anagram must return true for double same-character strings'''
        self.assertTrue(anagram('aa', 'aa'))

    def testValid(self):
        '''anagram must return true for known anagrams'''
        words = ( ('So dark the con          of man', 'Madonna of        The Rocks'),
                  (' ba ', ' Ab   ') )
        for (x, y) in words:
            self.assertTrue(anagram(x, y))

    def testInvalid(self):
        '''anagram must return false for known non-anagrams'''
        words = ( ('hello', 'ello'),
                  (' anne ', ' annea   ') )
        for (x, y) in words:
            self.assertFalse(anagram(x, y))

if __name__ == '__main__':
    unittest.main()

