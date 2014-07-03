"""
3.4
Towers of Hanoi Problem

You have 3 towers and N disks of different sizes which can slide onto any tower.
The puzzle starts with disks sorted in ascending order of size from top to bot.

1) Only one disk can be moved at a time
2) A disk is slid off the top of one tower onto the next tower
3) A disk can only be placed on top of a larger disk

# of steps for solution = 2^n - 1
"""

from classes import Stack

def hanoi(tower_size):
    """
    Time complexity O(2^n)
    Space complexity O(n)
    """
    start, middle, end = generate_towers(tower_size)
    tower_printer(start, middle, end) # PRINT!
    move_disks(tower_size, start, middle, end)
    tower_printer(start, middle, end) # PRINT!
    return end

def generate_towers(n):
    """
    Instantiate three stacks. The first stack has n values.
    """
    start, middle, end = Stack(), Stack(), Stack()
    for val in range(1, n + 1):
        start.push(val)
    return start, middle, end

def move_disks(tower_size, start, middle, end):
    """
    Recursively move disks to the final stack.
    """
    if tower_size == 1:
        disk = start.pop()
        end.push(disk)
        print "Stack({0}) --[{1}]--> Stack([{2}])".format(start, disk, end)
        return
    else:
        move_disks(tower_size - 1, start, end, middle)
        move_disks(1, start, middle, end)
        move_disks(tower_size - 1, middle, start, end)

def tower_printer(start, middle, end):
    print """
    Tower 1: {0}
    Tower 2: {1}
    Tower 3: {2}
    """.format(start, middle, end)


if __name__ == "__main__":
    hanoi(3)
