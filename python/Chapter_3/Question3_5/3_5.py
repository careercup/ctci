"""
3.5

Implement a MyQueue class which implements a queue using two stacks.
"""

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



### NODE AND STACK IMPLEMENTATION  ###
from copy import deepcopy
class Node(object):
    def __init__(self, data=None, nextNode=None):
        self.data = data
        self.nextNode = nextNode

    def __str__(self):
        return str(self.data)
        

class Stack(object):
    def __init__(self):
        self.stack = Node()
        self.size = 0

    def push(self, data):
        self.stack = Node(data, self.stack)
        self.size += 1

    def pop(self):
        assert self.stack.data is not None, 'Stack is empty'
        value = self.stack.data
        self.stack.data = self.stack.nextNode.data
        self.stack.nextNode = self.stack.nextNode.nextNode
        self.size -= 1
        return value
    
    def peek(self):
        assert self.size > 0, 'Stack is empty'
        return self.stack.data

    def __str__(self):
        stack_copy = deepcopy(self)
        tempHolder = []
        while stack_copy.size > 0:
            tempHolder.append(stack_copy.pop())
        return ', '.join(map(str, tempHolder[::-1]))


if __name__ == "__main__":
    a = MyQueue()
    a.eq(1)
    a.eq(2)
    print a.dq()
    print a.peek_front()

