"""
3.6

Write a program to sort a stack in ascending order (with biggest items on top).
You may use at most one additional stack to hold items, but you may not copy
any items to another data structure. The stack supports the following operations:
push, pop, peek, and isEmpty.
"""

from classes import Stack

def stack_sort(stack):
    """
    Uses a helper stack and a temporary value to insert values into a stack
    in ascending order.

    Time complexity: O(n^2)
    Space complexity: O(n)
    """
    helper = Stack()
    helper.push(stack.pop())
    while stack.size != 0:
        if stack.peek() > helper.peek():
            helper.push(stack.pop())
        else:
            value = stack.pop()
            while helper.size > 0 and value <= helper.peek():
                stack.push(helper.pop())
            helper.push(value)
    return helper


if __name__ == "__main__":
    a = Stack()
    a.push(6)
    a.push(2)
    a.push(5)
    a.push(3)
    print a
    print stack_sort(a)
