# All imports
import unittest
unique = __import__('1_1').unique
unique2 = __import__('1_1').unique2
reverse_C = __import__('1_2').reverse_C
perm = __import__('1_3').perm
stringfiller = __import__('1_4').stringfiller
stringfiller2 = __import__('1_4').stringfiller2
compressor = __import__('1_5').compressor
rotator = __import__('1_6').rotator
zero_out = __import__('1_7').zero_out
is_rotation = __import__('1_8').is_rotation

class Test(unittest.TestCase):
    def test_1(self):
        self.assertEquals(unique('Chris'), True)
        self.assertEquals(unique('test'), False)
        self.assertEquals(unique2('Chris'), True)
        self.assertEquals(unique2('test'), False)

    def test_2(self):
        s1 = ['s', 't', 'r', None]
        self.assertEquals(reverse_C(s1), ['r', 't', 's', None])

    def test_3(self):
        self.assertEquals(perm('hi', 'ih'), True)
        self.assertEquals(perm('hi', 'hello'), False)

    def test_4(self):
        filled = stringfiller('hello chris')
        self.assertEquals('hello%20chris', ''.join(filled))
        filled = stringfiller2('hello chris')
        self.assertEquals('hello%20chris', ''.join(filled))

    def test_5(self):
        chars1 = 'aaaabbbcccdddddaaa'
        chars2 = 'chris'
        self.assertEquals(compressor(chars1), 'a4b3c3d5a3')
        self.assertEquals(compressor(chars2), 'chris')

    def test_6(self):
        row1 = (1, 2, 3)
        row2 = (4, 5, 6)
        row3 = (7, 8, 9)
        matrix = [row1, row2, row3]
        rotated = rotator(matrix)
        manualRotated = [(7, 4, 1), (8, 5, 2), (9, 6, 3)]
        self.assertEquals(rotated, manualRotated)

    def test_7(self):
        row1 = [1, 4, 0]
        row2 = [4, 5, 6]
        row3 = [0, 8, 9]
        matrix = [row1, row2, row3]
        zeroed = zero_out(matrix)
        manualZeroed = [[0, 0, 0], [0, 5, 0], [0, 0 ,0]]
        self.assertEquals(zeroed, manualZeroed)

    def test_8(self):
        s1, s2 = 'waterbottle', 'terbottlewa'
        self.assertEquals(is_rotation(s1, s2), True)
        

if __name__ == "__main__":
    unittest.main()
