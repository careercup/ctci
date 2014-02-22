import unittest
from replace import *

class TestReplace(unittest.TestCase):
    def testEmpty(self):
        '''replaceSpaces must return empty for empty strings'''
        s = replaceSpaces('')
        self.assertEqual('', s)

    def testSingle(self):
        '''replaceSpaces must return the original string for single character strings'''
        s = replaceSpaces('a')
        self.assertEqual('a', s)

    def testWordNoSpace(self):
        '''replaceSpaces must return the original string for strings without spaces'''
        s = replaceSpaces('hello')
        self.assertEqual('hello', s)

    def testWordHeadTrailSpace(self):
        '''replaceSpaces must remove heading and trailing spaces'''
        words = ( ('hello ', 'hello'),
                  (' hello', 'hello'),
                  (' hello ', 'hello') )
        for orig, expected in words:
            e = replaceSpaces(orig)
            self.assertEqual(e, expected)

    def testWordSpace(self):
        '''replaceSpaces must replace all non heading/trailing spaces with %20'''
        words = ( ('hello world', 'hello%20world'),
                  (' hello    python   ', 'hello%20python'),
                  (' hello my  friend', 'hello%20my%20friend') )
        for orig, expected in words:
            e = replaceSpaces(orig)
            self.assertEqual(e, expected)

if __name__ == '__main__':
    unittest.main()
