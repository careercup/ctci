using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_2 : IQuestion
    {
        int NthToLastR1(LinkedListNode head, int n)
        {
		    if (n == 0 || head == null) {
			    return 0;
		    }
		    int k = NthToLastR1(head.Next, n) + 1;
		    if (k == n) {
			    Console.WriteLine(n + "th to last node is " + head.Data);
		    }
		    return k;
	    }

        LinkedListNode NthToLastR2(LinkedListNode head, int n, ref int i)
        {
            if (head == null)
            {
                return null;
            }
            LinkedListNode node = NthToLastR2(head.Next, n, ref i);
            i = i + 1;
            if (i == n)
            {
                return head;
            }
            return node;
        }

        Result NthToLastR3Helper(LinkedListNode head, int k)
        {
            if (head == null)
            {
                return new Result(null, 0);
            }
            Result res = NthToLastR3Helper(head.Next, k);
            if (res.Node == null)
            {
                res.Count++;
                if (res.Count == k)
                {
                    res.Node = head;
                }
            }
            return res;
        }

        LinkedListNode NthToLastR3(LinkedListNode head, int k)
        {
            Result res = NthToLastR3Helper(head, k);
            if (res != null)
            {
                return res.Node;
            }
            return null;
        }

        LinkedListNode NthToLast(LinkedListNode head, int n)
        {
            LinkedListNode p1 = head;
            LinkedListNode p2 = head;

            if (n <= 0) return null;

            // Move p2 n nodes into the list.  Keep n1 in the same position.
            for (int i = 0; i < n - 1; i++)
            {
                if (p2 == null)
                {
                    return null; // Error: list is too small.
                }
                p2 = p2.Next;
            }
            if (p2 == null)
            { // Another error check.
                return null;
            }

            // Move them at the same pace.  When p2 hits the end, 
            // p1 will be at the right element.
            while (p2.Next != null)
            {
                p1 = p1.Next;
                p2 = p2.Next;
            }
            return p1;
        }

        public void Run()
        {
		    LinkedListNode head = AssortedMethods.RandomLinkedList(10, 0, 10);
		    Console.WriteLine(head.PrintForward());
		    int nth = 3;
            //IntWrapper wr = new IntWrapper();
		    LinkedListNode n = NthToLastR3(head, nth);
		    NthToLastR1(head, nth);
		    if (n != null) {
			    Console.WriteLine(nth + "th to last node is " + n.Data);
		    } else {
			    Console.WriteLine("Null.  n is out of bounds.");
		    }            
        }
    }

    internal class Result
    {
        public LinkedListNode Node { get; set; }
        public int Count { get; set; }
        public Result(LinkedListNode n, int c)
        {
            Node = n;
            Count = c;
        }
    }
}
