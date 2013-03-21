package Question3_6;

import java.util.Stack;

import CtCILibrary.AssortedMethods;

public class Question {
	static int c = 0;
	public static Stack<Integer> mergesort(Stack<Integer> inStack) {
		if (inStack.size() <= 1) {
			return inStack;
		}

		Stack<Integer> left = new Stack<Integer>();
		Stack<Integer> right = new Stack<Integer>();
		int count = 0;
		while (inStack.size() != 0) {
			count++;
			c++;
			if (count % 2 == 0) {
				left.push(inStack.pop());
			} else {
				right.push(inStack.pop());
			}
		}

		left = mergesort(left);
		right = mergesort(right);

		while (left.size() > 0 || right.size() > 0)
		{
			if (left.size() == 0)
			{
				inStack.push(right.pop());
			}
			else if (right.size() == 0)
			{
				inStack.push(left.pop());
			}
			else if (right.peek().compareTo(left.peek()) <= 0)
			{
				inStack.push(left.pop());
			}
			else
			{
				inStack.push(right.pop());
			}
		}

		Stack<Integer> reverseStack = new Stack<Integer>();
		while (inStack.size() > 0)
		{
			c++;
			reverseStack.push(inStack.pop());
		}

		return reverseStack;
	}
	
	public static Stack<Integer> sort(Stack<Integer> s) {
		Stack<Integer> r = new Stack<Integer>();
		while(!s.isEmpty()) {
			int tmp = s.pop();
			while(!r.isEmpty() && r.peek() > tmp) {
				s.push(r.pop());
			}
			r.push(tmp);
		}
		return r;
	}
		
	public static void main(String [] args) {
		for (int k = 1; k < 100; k++) {
			c = 0;
			Stack<Integer> s = new Stack<Integer>();
			for (int i = 0; i < 10 * k; i++) {
				int r = AssortedMethods.randomIntInRange(0,  1000);
				s.push(r);
			}
			s = mergesort(s);
			int last = Integer.MAX_VALUE;
			while(!s.isEmpty()) {
				int curr = s.pop();
				if (curr > last) {
					System.out.println("Error: " + last + " " + curr);
				}
				last = curr;
			}
			System.out.println(c);
		}
	}
}
