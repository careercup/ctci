
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter02
{
    public class Q02_2 : IQuestion
    {
        int NthToLastR1(LinkedListNode head, int n)
        {
		    if (n == 0 || head == null) 
            {
			    return 0;
		    }

		    var k = NthToLastR1(head.Next, n) + 1;

		    if (k == n) 
            {
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

            var node = NthToLastR2(head.Next, n, ref i);
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
            
            var result = NthToLastR3Helper(head.Next, k);
            
            if (result.Node == null)
            {
                result.Count++;

                if (result.Count == k)
                {
                    result.Node = head;
                }
            }

            return result;
        }

        LinkedListNode NthToLastR3(LinkedListNode head, int k)
        {
            var result = NthToLastR3Helper(head, k);

            if (result != null)
            {
                return result.Node;
            }

            return null;
        }

        LinkedListNode NthToLast(LinkedListNode head, int n)
        {
            var p1 = head;
            var p2 = head;

            if (n <= 0) return null;

            // Move p2 n nodes into the list.  Keep n1 in the same position.
            for (var i = 0; i < n - 1; i++)
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
		    var head = AssortedMethods.RandomLinkedList(10, 0, 10);
		    Console.WriteLine(head.PrintForward());
		    const int nth = 3;
            
		    var node = NthToLastR3(head, nth);
		    NthToLastR1(head, nth);
		    
            if (node != null) 
            {
			    Console.WriteLine(nth + "th to last node is " + node.Data);
		    } 
            else 
            {
			    Console.WriteLine("Null.  n is out of bounds.");
		    }            
        }
    }

    internal class Result
    {
        public LinkedListNode Node { get; set; }
        public int Count { get; set; }
        public Result(LinkedListNode node, int count)
        {
            Node = node;
            Count = count;
        }
    }
}