from classes import Stack, Queue
import unittest
three_stacks = __import__('3_1').three_stacks
StackMin = __import__('3_2').StackMin
SetofStacks = __import__('3_3').SetofStacks
hanoi = __import__('3_4').hanoi
MyQueue = __import__('3_5').MyQueue
stack_sort = __import__('3_6').stack_sort
AnimalQueue = __import__('3_7').AnimalQueue
Cat = __import__('3_7').Cat
Dog = __import__('3_7').Dog


class Test(unittest.TestCase):
    def test_1(self):
        stacktable = three_stacks([1, 2, 3, 4, 5, 6, 7])
        self.assertEquals(stacktable[0].peek(), 7)

    def test_2(self):
        a = StackMin()
        a.push(3)
        a.push(2)
        a.push(2)
        self.assertEquals(a.min, 2)
        a.pop()
        self.assertEquals(a.min, 2)

    def test_3(self):
        a = SetofStacks(2)
        a.push(1)
        a.push(2)
        a.push(3)
        a.push(4)
        self.assertEquals(1, a.popAtIndex(0))

    def test_4(self):
        """
        This test will also print out the hanoi solution steps.
        """
        n = 4
        last_stack = hanoi(n)
        value = last_stack.pop()
        self.assertEquals(value, n)
                 
    def test_5(self):
        a = MyQueue()
        a.eq(1)
        a.eq(2)
        self.assertEquals(a.dq(), 1)
        self.assertEquals(a.peek_front(), 2)

    def test_6(self):
        a = Stack()
        a.push(6)
        a.push(2)
        a.push(5)
        a.push(3)
        b = stack_sort(a)
        self.assertEquals(b.pop(), 6)

    def test_7(self):
        shelter = AnimalQueue()
        b, c, d, e = Dog('Spot'), Cat('Red'), Dog('Otis'), Cat('Grey')
        shelter.eq(b)
        shelter.eq(c)
        shelter.eq(d)
        shelter.eq(e)
        self.assertEquals(shelter.dq_cat().name, 'Red')



if __name__ == "__main__":
    unittest.main()
