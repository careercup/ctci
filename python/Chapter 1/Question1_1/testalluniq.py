import unittest
from alluniq import *

class ExpectedResult(unittest.TestCase):
    def testEmptyStr(self):
        '''allunique must return True with empty strings'''
        result = allunique('')
        self.assertTrue(result)

    def testSingleCharStr(self):
        '''allunique must return True with single character strings'''
        result = allunique('a')
        self.assertTrue(result)

    def testDoubleCharStr(self):
        '''allunique must return True with double character strings that don't have the same characters'''
        result = allunique('ab')
        self.assertTrue(result)

    def testStrWithTwoConsChar(self):
        '''allunique must return False with strings that have two same consecutive characters'''
        result = allunique('aab')
        self.assertFalse(result)

    def testStrWithTwoNonConsChar(self):
        '''allunique must return False with strings that have two same non consecutive characters'''
        result = allunique('aba')
        self.assertFalse(result)

    def testStrWithNoConsChar(self):
        '''allunique must return True with strings that have all unique characters'''
        result = allunique('promise')
        self.assertTrue(result)


if __name__ == '__main__':
    unittest.main()

