"""
3.3

Stack of plates topples when it gets too high. We want to start a new stack
when the previous stack exceeds some threshhold.

Implement a SetofStacks that mimics this behavior. .pop() and .push() should
emulate a similar behavior.

How would you pop at a specific index?
"""
from classes import Stack, Node
from copy import deepcopy

class SetofStacks(object):
    def __init__(self, threshhold):
        self.stacks = [Stack()]
        self.threshhold = threshhold

    def push(self, data):
        if self.stacks[-1].size >= self.threshhold:
            self.stacks.append(Stack())
        self.stacks[-1].push(data)

    def pop(self):
        assert self.stacks is not [], 'Out of stacks!'
        if self.stacks[-1].size == 0:
            self.stacks.pop()
        return self.stacks[-1].pop()

    def peek(self):
        return self.stacks[-1].peek()

    def popAtIndex(self, index):
        """
        Pop set of stacks at specific index.
        Time complexity: O(n)
        Space complexity: O(n)
        """
        stack = index / self.threshhold
        depth = (index - 1) % self.threshhold
        tempStack= []
        while self.stacks[stack + 1].size > 0:
            tempStack.append(self.pop())
        for x in range(depth):
            tempStack.append(self.pop())
        value = self.pop()                # Got the value!
        for x in range(len(tempStack)):   # Rebuild the stacks!
            self.push(tempStack.pop())
        return value

    def __str__(self):
        copy = deepcopy(self)
        holder = []
        while True:
            try:
                holder.append(copy.pop())
            except:
                return ''.join(map(str, holder[::-1]))
                

        
if __name__ == "__main__":
    a = SetofStacks(2)
    a.push(1)
    a.push(2)
    a.push(3)
    a.push(4)
    a.push(5)
    a.push(6)
    a.push(7)
    a.push(8)
    a.popAtIndex(0)


