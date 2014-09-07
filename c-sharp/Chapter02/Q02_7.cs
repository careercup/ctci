using System;
using System.Collections.Generic;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_7 : IQuestion
    {
        class Result
        {
            public LinkedListNode Node;
            public bool result;

            public Result(LinkedListNode node, bool res)
            {
                Node = node;
                result = res;
            }
        }

        Result IsPalindromeRecurse(LinkedListNode head, int length)
        {
            if (head == null || length == 0)
            {
                return new Result(null, true);
            }
            else if (length == 1)
            {
                return new Result(head.Next, true);
            }
            else if (length == 2)
            {
                return new Result(head.Next.Next, head.Data == head.Next.Data);
            }

            var res = IsPalindromeRecurse(head.Next, length - 2);

            if (!res.result || res.Node == null)
            {
                return res; // Only "result" member is actually used in the call stack.
            }
            else
            {
                res.result = head.Data == res.Node.Data;
                res.Node = res.Node.Next;
                return res;
            }
        }

        bool IsPalindrome(LinkedListNode head)
        {
            var size = 0;
            var node = head;

            while (node != null)
            {
                size++;
                node = node.Next;
            }

            var palindrome = IsPalindromeRecurse(head, size);

            return palindrome.result;
        }

	    bool IsPalindrome2(LinkedListNode head) 
        {
		    var fast = head;
		    var slow = head;
		
		    var stack = new Stack<int>();
		
		    while (fast != null && fast.Next != null) 
            {
                stack.Push(slow.Data);
			    slow = slow.Next;
			    fast = fast.Next.Next;			
		    }
		
		    /* Has odd number of elements, so skip the middle */
		    if (fast != null) 
            { 
			    slow = slow.Next;
		    }
		
		    while (slow != null) 
            {
			    var top = stack.Pop();
                Console.WriteLine(slow.Data + " " + top);

			    if (top != slow.Data) 
                {
				    return false;
			    }
			    slow = slow.Next;
		    }
		    return true;
	    }

        public void Run()
        {
		    const int length = 10;
		    var nodes = new LinkedListNode[length];

		    for (var i = 0; i < length; i++) 
            {
			    nodes[i] = new LinkedListNode(i >= length / 2 ? length - i - 1 : i, null, null);
		    }
		
		    for (var i = 0; i < length; i++)
            {
			    if (i < length - 1) 
                {
				    nodes[i].SetNext(nodes[i + 1]);
			    }
			    if (i > 0) {
				    nodes[i].SetPrevious(nodes[i - 1]);
			    }
		    }
		    // nodes[length - 2].data = 9; // Uncomment to ruin palindrome
		
		    var head = nodes[0];
		    Console.WriteLine(head.PrintForward());
            Console.WriteLine(IsPalindrome(head));
            Console.WriteLine(IsPalindrome2(head));
        }
    }
}