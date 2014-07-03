"""
Python implementation of Stack and Queue.
"""
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


class Queue(object):
    def __init__(self):
        self.first = None
        self.last = None

    def eq(self, data):
        if not self.first:
            self.last = Node(data)
            self.first = self.last
        else:
            newNode = Node(data)
            self.last.nextNode = newNode
            self.last = newNode

    def dq(self):
        assert self.first is not None, 'Queue is empty!'
        value = self.first.data
        self.first = self.first.nextNode
        return value


