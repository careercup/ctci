"""
3.2
How would you design a stack which, in addition to push and pop,
also has a function min which returns the minimum element?

Push pop and min should operate in O(1) time.
"""

from classes import Stack, Node

class StackMin(Stack):
    def __init__(self):
        self.stack = Node()
        self._min = None

    def push(self, data):
        self.stack = Node(data, self.stack)
        if not self._min:
            self._min = Stack()
            self._min.push(data)
        elif self._min.peek() >= data:
            self._min.push(data)

    def pop(self):
        assert self.stack.data is not None, 'Stack is empty'
        value = self.stack.data
        self.stack.data = self.stack.nextNode.data
        self.stack.nextNode = self.stack.nextNode.nextNode
        if value == self._min.peek():
            self._min.pop()
        return value

    @property
    def min(self):
        return self._min.peek()


