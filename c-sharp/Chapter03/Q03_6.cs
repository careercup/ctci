using System;
using ctci.Contracts;
using ctci.Library;
using System.Collections.Generic;

namespace Chapter03
{
    public class Q03_6 : IQuestion
    {
        int _c;

        Stack<int> Mergesort(Stack<int> inStack)
        {
            if (inStack.Count <= 1)
            {
                return inStack;
            }

            Stack<int> left = new Stack<int>();
            Stack<int> right = new Stack<int>();
            int count = 0;
            while (inStack.Count != 0)
            {
                count++;
                _c++;
                if (count % 2 == 0)
                {
                    left.Push(inStack.Pop());
                }
                else
                {
                    right.Push(inStack.Pop());
                }
            }

            left = Mergesort(left);
            right = Mergesort(right);

            while (left.Count > 0 || right.Count > 0)
            {
                if (left.Count == 0)
                {
                    inStack.Push(right.Pop());
                }
                else if (right.Count == 0)
                {
                    inStack.Push(left.Pop());
                }
                else if (right.Peek() < left.Peek())
                {
                    inStack.Push(left.Pop());
                }
                else
                {
                    inStack.Push(right.Pop());
                }
            }

            Stack<int> reverseStack = new Stack<int>();
            while (inStack.Count > 0)
            {
                _c++;
                reverseStack.Push(inStack.Pop());
            }

            return reverseStack;
        }

        Stack<int> Sort(Stack<int> s)
        {
            Stack<int> r = new Stack<int>();
            while (s.Count != 0)
            {
                int tmp = s.Pop();
                while (r.Count != 0 && r.Peek() > tmp)
                {
                    s.Push(r.Pop());
                }
                r.Push(tmp);
            }
            return r;
        }

        public void Run()
        {
		    for (int k = 1; k < 10; k++) {
			    _c = 0;
			    Stack<int> s = new Stack<int>();
			    for (int i = 0; i < 10 * k; i++) {
				    int r = AssortedMethods.RandomIntInRange(0,  1000);
				    s.Push(r);
			    }
			    s = Mergesort(s);
			    int last = int.MaxValue;
			    while(s.Count != 0) {
				    int curr = s.Pop();
				    if (curr > last) {
                        Console.WriteLine("Error: " + last + " " + curr);
				    }
				    last = curr;
			    }
			    Console.WriteLine(_c);
		    }            
        }
    }
}
