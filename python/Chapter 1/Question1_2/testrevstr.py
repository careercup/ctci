import unittest
from revstr import *

class TestReversal(unittest.TestCase):
    def testEmpty(self):
        '''revStr must return the same string for empty strings'''        
        self.assertEqual('', revStr(''))

    def testSingle(self):
        '''revStr must return the same string for single character strings'''
        self.assertEqual('a', revStr('a'))

    def testDoubleEq(self):
        '''revStr must return the same string for double same-character strings'''
        self.assertEqual('aa', revStr('aa'))

    def testDoubleDiff(self):
        '''revStr must return the reversed for double character strings'''
        self.assertEqual('ba', revStr('ab'))

    def testValid(self):
        '''revStr must return the reversed of known strings'''
        words = ( ('mary', 'yram'),
                  ('peter', 'retep'),
                  ('anna', 'anna') )
        for (orig, exp) in words:
            expected = revStr(orig)
            self.assertEqual(expected, exp)

    def testInvalid(self):
        '''revStr must not match the non-reversed of known strings'''
        words = ( ('hello', 'olle'),
                  ('henry', 'yrnhe') )
        for (orig, nonexp) in words:
            expected = revStr(orig)
            self.assertNotEqual(expected, nonexp)

if __name__ == '__main__':
    unittest.main()

