"""
3.1

Describe how you could use a single array to implement three stacks.

1) Build a hashtable for each stack.
2) Iterate through the array, pushing values to three stacks in order.

[1, 2, 3, 4, 5, 6, 7]
stack0 = 1, 4, 7
stack1 = 2, 5
stack2 = 3, 6
"""
from classes import Stack

def three_stacks(array):
    """
    Implement three stacks using a single array.
    """
    stackTable = {0: Stack(), 1: Stack(), 2: Stack()}
    map(lambda(i, value): stackTable[i % 3].push(value), enumerate(array))
    return stackTable

def three_stacks_simple(array):
    """
    Implement three stacks using a single array, iteratively.
    """
    stack0, stack1, stack2 = Stack(), Stack(), Stack()
    for i, val in enumerate(array):
        stack = i % 3
        if stack == 0: stack0.push(value)
        elif stack == 1: stack1.push(value)
        else: stack2.push(value)
    return stack0, stack1, stack2

