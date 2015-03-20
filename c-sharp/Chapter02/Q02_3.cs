
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter02
{
    public class Q02_3 : IQuestion
    {
        bool DeleteNode(LinkedListNode node)
        {
            if (node == null || node.Next == null)
            {
                return false; // Failure
            }
            
            var next = node.Next;
            node.Data = next.Data;
            node.Next = next.Next;

            return true;
        }

        public void Run()
        {
		    var head = AssortedMethods.RandomLinkedList(10, 0, 10);
		    Console.WriteLine(head.PrintForward());

            var deleted = DeleteNode(head.Next.Next.Next.Next); // delete node 4
            Console.WriteLine("deleted? {0}", deleted);
		    Console.WriteLine(head.PrintForward());
        }
    }
}