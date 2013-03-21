package Question3_1;

public class Question {
	static int stackSize = 10;
	static int [] buffer = new int [stackSize * 3];
	
	// 3 stack pointers to keep track of the index of the top element
	static int [] stackPointer = {-1, -1, -1};
	public static void main(String [] args) throws Exception  {
		push(2, 4);
		System.out.println("Peek 2: " + peek(2));
		push(0, 3);
		push(0, 7);
		push(0, 5);
		System.out.println("Peek 0: " + peek(0));
		pop(0);
		System.out.println("Peek 0: " + peek(0));
		pop(0);
		System.out.println("Peek 0: " + peek(0));
	}

	static void push(int stackNum, int value) throws Exception {
		/* Check that we have space for the next element */
		if (stackPointer[stackNum] + 1 >= stackSize) { 
			throw new Exception("Out of space.");
		}
		/* Increment stack pointer and then update top value*/		
		stackPointer[stackNum]++;
		buffer[absTopOfStack(stackNum)] = value;	
	}

	static int pop(int stackNum) throws Exception {
		if (stackPointer[stackNum] == -1) {
			throw new Exception("Trying to pop an empty stack.");
		}
		int value = buffer[absTopOfStack(stackNum)]; // Get top
		buffer[absTopOfStack(stackNum)] = 0; // Clear index
		stackPointer[stackNum]--; // Decrement pointer
		return value;
	}

	static int peek(int stackNum) {
		return buffer[absTopOfStack(stackNum)];
	}

	static boolean isEmpty(int stackNum) {
		return stackPointer[stackNum] == -1;
	}
	
	/* returns index of the top of the stack "stackNum", in absolute terms */
	static int absTopOfStack(int stackNum) {
		return stackNum * stackSize + stackPointer[stackNum];
	}	
}
