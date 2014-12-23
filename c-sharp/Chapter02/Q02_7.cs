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
            public LinkedListNode node;
            public bool result;
            public Result(LinkedListNode n, bool res)
            {
                node = n;
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
            Result res = IsPalindromeRecurse(head.Next, length - 2);
            if (!res.result || res.node == null)
            {
                return res; // Only "result" member is actually used in the call stack.
            }
            else
            {
                res.result = head.Data == res.node.Data;
                res.node = res.node.Next;
                return res;
            }
        }

        bool IsPalindrome(LinkedListNode head)
        {
            int size = 0;
            LinkedListNode n = head;
            while (n != null)
            {
                size++;
                n = n.Next;
            }
            Result p = IsPalindromeRecurse(head, size);
            return p.result;
        }

	    bool IsPalindrome2(LinkedListNode head) {
		    LinkedListNode fast = head;
		    LinkedListNode slow = head;
		
		    Stack<int> stack = new Stack<int>();
		
		    while (fast != null && fast.Next != null) {
                stack.Push(slow.Data);
			    slow = slow.Next;
			    fast = fast.Next.Next;			
		    }
		
		    /* Has odd number of elements, so skip the middle */
		    if (fast != null) { 
			    slow = slow.Next;
		    }
		
		    while (slow != null) {
			    int top = stack.Pop();
                Console.WriteLine(slow.Data + " " + top);
			    if (top != slow.Data) {
				    return false;
			    }
			    slow = slow.Next;
		    }
		    return true;
	    }

        public void Run()
        {
		    int length = 10;
		    LinkedListNode[] nodes = new LinkedListNode[length];
		    for (int i = 0; i < length; i++) {
			    nodes[i] = new LinkedListNode(i >= length / 2 ? length - i - 1 : i, null, null);
		    }
		
		    for (int i = 0; i < length; i++) {
			    if (i < length - 1) {
				    nodes[i].SetNext(nodes[i + 1]);
			    }
			    if (i > 0) {
				    nodes[i].SetPrevious(nodes[i - 1]);
			    }
		    }
		    // nodes[length - 2].data = 9; // Uncomment to ruin palindrome
		
		    LinkedListNode head = nodes[0];
		    Console.WriteLine(head.PrintForward());
            Console.WriteLine(IsPalindrome(head));
            Console.WriteLine(IsPalindrome2(head));
        }
    }
}
