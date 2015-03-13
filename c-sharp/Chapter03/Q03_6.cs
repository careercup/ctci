
using ctci.Contracts;
using ctci.Library;
using System;
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

            var left = new Stack<int>();
            var right = new Stack<int>();
            var count = 0;

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

            var reverseStack = new Stack<int>();

            while (inStack.Count > 0)
            {
                _c++;
                reverseStack.Push(inStack.Pop());
            }

            return reverseStack;
        }

        // TODO: Fix this method. It is currently unused and appears not to function properly.
        Stack<int> Sort(Stack<int> stack)
        {
            var sortedStack = new Stack<int>();

            while (stack.Count != 0)
            {
                var tmp = stack.Pop();

                while (sortedStack.Count != 0 && sortedStack.Peek() > tmp)
                {
                    stack.Push(sortedStack.Pop());
                }
                sortedStack.Push(tmp);
            }

            return sortedStack;
        }

        public void Run()
        {
		    for (var k = 1; k < 10; k++)
            {
			    _c = 0;
			    var stack = new Stack<int>();

			    for (var i = 0; i < 10 * k; i++) 
                {
				    var randomNum = AssortedMethods.RandomIntInRange(0,  1000);
				    stack.Push(randomNum);
			    }

                stack = Mergesort(stack);
                var last = int.MaxValue;

                while (stack.Count != 0)
                {
                    var curr = stack.Pop();

                    if (curr > last)
                    {
                        Console.WriteLine("Error: " + last + " " + curr);
                    }
                    last = curr;
                }

			    Console.WriteLine(_c);
		    }            
        }
    }
}