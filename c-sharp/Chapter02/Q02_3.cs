using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_3 : IQuestion
    {
        bool DeleteNode(LinkedListNode n)
        {
            if (n == null || n.Next == null)
            {
                return false; // Failure
            }
            LinkedListNode next = n.Next;
            n.Data = next.Data;
            n.Next = next.Next;
            return true;
        }

        public void Run()
        {
		    LinkedListNode head = AssortedMethods.RandomLinkedList(10, 0, 10);
		    Console.WriteLine(head.PrintForward());
            DeleteNode(head.Next.Next.Next.Next); // delete node 4
		    Console.WriteLine(head.PrintForward());
        }
    }
}
