"""
3.5

Implement a MyQueue class which implements a queue using two stacks.
"""

from classes import Stack

class MyQueue(object):
    """
    Implements a queue using two stacks.
    Lazily reverses items from the back_stack to the front_stack when needed.
    """
    def __init__(self):
        self.front_stack = Stack()
        self.back_stack = Stack()

    def eq(self, data):
        self.back_stack.push(data)

    def dq(self):
        if self.front_stack.size == 0:
            self.rebuild()
        return self.front_stack.pop()

    def peek_front(self):
        if self.front_stack.size == 0:
            self.rebuild()
        return self.front_stack.peek()
    
    def rebuild(self):
        """
        Lazily rebuilds the front stack when a value is needed by pop/peek.
        When the front_stack empties, rebuild it by reversing the values in
        the back_stack.
        """
        while self.back_stack.size > 0:
            self.front_stack.push(self.back_stack.pop())

if __name__ == "__main__":
    a = MyQueue()
    a.eq(1)
    a.eq(2)
    print a.dq()
    print a.peek_front()

