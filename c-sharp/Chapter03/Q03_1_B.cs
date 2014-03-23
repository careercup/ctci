using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter03
{
    public class Q03_1_B : IQuestion
    {
        #region StackData

        class StackData
        {
            public int Start { get; set; }
            public int Pointer { get; set; }
            public int Size { get; set; }
            public int Capacity { get; set; }
            public StackData(int start, int capacity)
            {
                Size = 0;
                Start = start;
                Pointer = start - 1;
                Capacity = capacity;
            }

            public bool IsWithinStack(int index, int totalSize)
            {
                // Note: if stack wraps, the head (right side) wraps around to the left. 
                if (Start <= index && index < Start + Capacity)
                {
                    // non-wrapping, or "head" (right side) of wrapping case
                    return true;
                }
                else if (Start + Capacity > totalSize &&
                            index < (Start + Capacity) % totalSize)
                {
                    // tail (left side) of wrapping case
                    return true;
                }
                return false;
            }
        }

        #endregion

        const int NumberOfStacks = 3;
        const int DefaultSize = 4;
        const int TotalSize = DefaultSize*NumberOfStacks;

        readonly StackData[] _stacks = 
        {
            new StackData(0, DefaultSize), 
            new StackData(DefaultSize, DefaultSize), 
            new StackData(DefaultSize * 2, DefaultSize)
        };

        readonly int[] _buffer = new int[TotalSize];

	    int NumberOfElements() 
        {
		    return _stacks[0].Size + _stacks[1].Size + _stacks[2].Size;
	    }

        int NextElement(int index) 
        {
		    if (index + 1 == TotalSize) 
            {
			    return 0;
		    } else {
			    return index + 1;
		    }
	    }

        int PreviousElement(int index) 
        {
		    if (index == 0) {
			    return TotalSize - 1;
		    } else {
			    return index - 1;
		    }
	    }

        void Shift(int stackNum) 
        {
		    StackData stack = _stacks[stackNum];
		    if (stack.Size >= stack.Capacity) {
			    int nextStack = (stackNum + 1) % NumberOfStacks;
			    Shift(nextStack); // make some room
			    stack.Capacity++;
		    }
		    for (int i = (stack.Start + stack.Capacity - 1) % TotalSize; // end of array
					      stack.IsWithinStack(i, TotalSize);
                          i = PreviousElement(i))
            {
			    _buffer[i] = _buffer[PreviousElement(i)];
		    }
		    _buffer[stack.Start] = 0;
		    stack.Start = NextElement(stack.Start); // move start start
            stack.Pointer = NextElement(stack.Pointer); // move stack pointer
		    stack.Capacity--; // return capacity to original
	    }

        /* Expand stack by shifting over other stacks */
	    void Expand(int stackNum) 
        {
		    Shift((stackNum + 1) % NumberOfStacks);
		    _stacks[stackNum].Capacity++;
	    }

	    void Push(int stackNum, int value)
        {
		    StackData stack = _stacks[stackNum];
		    /* Check that we have space */
		    if (stack.Size >= stack.Capacity) {
			    if (NumberOfElements() >= TotalSize) { // Totally full
				    throw new Exception("Out of space."); 
			    } else { // just need to shift things around
				    Expand(stackNum);
			    }
		    }
		    /* Find the index of the top element in the array + 1, 
		     * and increment the stack pointer */	
		    stack.Size++;
            stack.Pointer = NextElement(stack.Pointer);		
		    _buffer[stack.Pointer] = value;	
	    }

        int Pop(int stackNum)
        {
		    StackData stack = _stacks[stackNum];		
		    if (stack.Size == 0) {
			    throw new Exception("Trying to pop an empty stack.");
		    }
		    int value = _buffer[stack.Pointer];
		    _buffer[stack.Pointer] = 0;
		    stack.Pointer = PreviousElement(stack.Pointer);
		    stack.Size--;
		    return value;
	    }

        int Peek(int stackNum) 
        {
		    StackData stack = _stacks[stackNum];			
		    return _buffer[stack.Pointer];
	    }

	    bool IsEmpty(int stackNum) 
        {
		    StackData stack = _stacks[stackNum];
		    return stack.Size == 0;
	    }

        public void Run()
        {
		    Push(0, 10);
		    Push(1, 20);
		    Push(2, 30);
		
		    Push(1, 21);
		    Push(0, 11);
		    Push(0, 12);
		
		    Pop(0);
		
		    Push(2, 31);
		
		    Push(0, 13);
		    Push(1, 22);
		
		    Push(2, 31);
		    Push(2, 32);
		    Push(2, 33);
		    Push(2, 34);

		    Console.WriteLine("Final Stack: " + AssortedMethods.ArrayToString(_buffer));
		
		    Pop(1);
		    Push(2, 35);

            Console.WriteLine("Final Stack: " + AssortedMethods.ArrayToString(_buffer));            
        }
    }
}
