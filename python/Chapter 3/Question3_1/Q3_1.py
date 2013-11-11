# Fixed division

class SingleArrayStacks(object):

    def __init__(self, stacksize = 100, number = 3):
        self.stacksize = stacksize
        self.number = number
        self.array = [None] * self.stacksize * self.number
        self.pointer = [-1] * self.number

    def push(self, stacknum, value):
        if self.pointer[stacknum] + 1 >= self.stacksize:
            print "Out of space"
        else:
            self.pointer[stacknum] += 1
            self.array[self.stacktop(stacknum)] = value

    def pop(self, stacknum):
        if self.pointer[stacknum] < 0:
            return "Trying to pop an empty stack."
        else:
            data = self.array[self.stacktop(stacknum)]
            self.array[self.stacktop(stacknum)] = None
            self.pointer[stacknum] -= 1
            return data

    def peek(self, stacknum):
        if self.pointer[stacknum] < 0:
            print "Empty stack"
        else:
            return self.array[self.stacktop(stacknum)]

    def isEmpty(self, stacknum):
        return self.pointer[stacknum] == -1

    def stacktop(self, stacknum):
        return self.stacksize * stacknum + self.pointer[stacknum]



#-----------------test-----------------
if __name__ == "__main__":
    array = SingleArrayStacks()
    array.push(2, 11)
    array.push(2, 13)
    print array.pop(0)  # Trying to pop an empty stack.
    print array.peek(2) # 13
    array.push(0, 20)
    array.push(0, 30)
    print array.pop(0)  # 30
    print array.peek(0) # 20



