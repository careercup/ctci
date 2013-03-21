package Question3_1;

import CtCILibrary.AssortedMethods;

public class QuestionB {
	static int number_of_stacks = 3;
	static int default_size = 4;
	static int total_size = default_size * number_of_stacks;
	static StackData [] stacks = {new StackData(0, default_size), 
									 new StackData(default_size, default_size), 
									 new StackData(default_size * 2, default_size)};
	static int [] buffer = new int [total_size];

	public static void main(String [] args) throws Exception  {
		push(0, 10);
		push(1, 20);
		push(2, 30);
		
		push(1, 21);
		push(0, 11);
		push(0, 12);
		
		pop(0);
		
		push(2, 31);
		
		push(0, 13);
		push(1, 22);
		
		push(2, 31);
		push(2, 32);
		push(2, 33);
		push(2, 34);

		System.out.println("Final Stack: " + AssortedMethods.arrayToString(buffer));
		
		pop(1);
		push(2, 35);
		
		System.out.println("Final Stack: " + AssortedMethods.arrayToString(buffer));
	}
	
	public static int numberOfElements() {
		return stacks[0].size + stacks[1].size + stacks[2].size;
	}
	
	public static int nextElement(int index) {
		if (index + 1 == total_size) {
			return 0;
		} else {
			return index + 1;
		}
	}
	
	public static int previousElement(int index) {
		if (index == 0) {
			return total_size - 1;
		} else {
			return index - 1;
		}
	}
	
	public static void shift(int stackNum) {
		StackData stack = stacks[stackNum];
		if (stack.size >= stack.capacity) {
			int nextStack = (stackNum + 1) % number_of_stacks;
			shift(nextStack); // make some room
			stack.capacity++;
		}
		for (int i = (stack.start + stack.capacity - 1) % total_size; // end of array
					  stack.isWithinStack(i, total_size); 
					  i = previousElement(i)) {
			buffer[i] = buffer[previousElement(i)];
		}
		buffer[stack.start] = 0;
		stack.start = nextElement(stack.start); // move start start
		stack.pointer = nextElement(stack.pointer); // move stack pointer
		stack.capacity--; // return capacity to original
	}
	
	/* Expand stack by shifting over other stacks */
	public static void expand(int stackNum) {
		shift((stackNum + 1) % number_of_stacks);
		stacks[stackNum].capacity++;
	}

	static void push(int stackNum, int value) throws Exception {
		StackData stack = stacks[stackNum];
		/* Check that we have space */
		if (stack.size >= stack.capacity) {
			if (numberOfElements() >= total_size) { // Totally full
				throw new Exception("Out of space."); 
			} else { // just need to shift things around
				expand(stackNum);
			}
		}
		/* Find the index of the top element in the array + 1, 
		 * and increment the stack pointer */	
		stack.size++;
		stack.pointer = nextElement(stack.pointer);		
		buffer[stack.pointer] = value;	
	}

	static int pop(int stackNum) throws Exception {
		StackData stack = stacks[stackNum];		
		if (stack.size == 0) {
			throw new Exception("Trying to pop an empty stack.");
		}
		int value = buffer[stack.pointer];
		buffer[stack.pointer] = 0;
		stack.pointer = previousElement(stack.pointer);
		stack.size--;
		return value;
	}

	static int peek(int stackNum) {
		StackData stack = stacks[stackNum];			
		return buffer[stack.pointer];
	}

	static boolean isEmpty(int stackNum) {
		StackData stack = stacks[stackNum];
		return stack.size == 0;
	}
}
