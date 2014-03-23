using System;
using ctci.Contracts;

namespace Chapter03
{
    public class Q03_1_A : IQuestion
    {
        const int StackSize = 10;
        readonly int[] _buffer = new int[StackSize * 3];

        // 3 stack pointers to keep track of the index of the top element
        readonly int[] _stackPointer = { -1, -1, -1 };

	    void Push(int stackNum, int value) 
        {
		    /* Check that we have space for the next element */
		    if (_stackPointer[stackNum] + 1 >= StackSize) { 
			    throw new Exception("Out of space.");
		    }
		    /* Increment stack pointer and then update top value*/		
		    _stackPointer[stackNum]++;
		    _buffer[AbsTopOfStack(stackNum)] = value;	
	    }

	    int Pop(int stackNum)
        {
		    if (_stackPointer[stackNum] == -1) {
			    throw new Exception("Trying to pop an empty stack.");
		    }
		    int value = _buffer[AbsTopOfStack(stackNum)]; // Get top
		    _buffer[AbsTopOfStack(stackNum)] = 0; // Clear index
		    _stackPointer[stackNum]--; // Decrement pointer
		    return value;
	    }

	    int Peek(int stackNum)
        {
		    return _buffer[AbsTopOfStack(stackNum)];
	    }

	    bool IsEmpty(int stackNum)
        {
		    return _stackPointer[stackNum] == -1;
	    }
	
	    /* returns index of the top of the stack "stackNum", in absolute terms */
	    int AbsTopOfStack(int stackNum)
        {
		    return stackNum * StackSize + _stackPointer[stackNum];
	    }	

        public void Run()
        {
		    Push(2, 4);
		    Console.WriteLine("Peek 2: " + Peek(2));
		    Push(0, 3);
		    Push(0, 7);
		    Push(0, 5);
		    Console.WriteLine("Peek 0: " + Peek(0));
		    Pop(0);
		    Console.WriteLine("Peek 0: " + Peek(0));
		    Pop(0);
		    Console.WriteLine("Peek 0: " + Peek(0));
        }
    }
}
