class SetOfStacks:
    
    def __init__(self,capacity):
        self.capacity = capacity
        self.stacks = []

    def push(self, value):
        if (len(self.stacks) == 0) or (len(self.stacks[-1]) == self.capacity):
            self.stacks.append([])
        self.stacks[-1].append(value)

    def pop(self):
        if len(self.stacks) == 0:
            return None
        data = self.stacks[-1].pop()
        if len(self.stacks[-1]) == 0:
            self.stacks.pop()
        return data
    
    # Pop operation on a specifit sub-stack. (Index begins with 1)
    # Not "rolling over" version. OK with some stacks not at full capacity
    def popAt(self, index):
        if index < 1 or index > len(self.stacks) or len(self.stacks[index-1]) == 0:
            return None
        else:
            return self.stacks[index-1].pop() 



#-----------------test-------------------
def test():
    setofstacks = SetOfStacks(8)
    for i in range(24):
        setofstacks.push(i)
        print i,
    print ""

    for i in range(5):
        print "Popped", setofstacks.pop()

    print "Test for popAt"
    for i in range(5):
        for i in range(3):
            print "Popped", setofstacks.popAt(i+1)


if __name__ == "__main__":
    test()
