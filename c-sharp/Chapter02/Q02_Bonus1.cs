
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter02
{
    public class Q02_Bonus1 : IQuestion
    {
        /// <summary>
        /// ReverseList - Another common question is how do you reverse a singly Linked List without using another Linked List
        /// </summary>
        /// <param name="root">LinkedListNode root</param>
        /// <returns>LinkedListNode - new head / root</returns>
        public LinkedListNode ReverseList(LinkedListNode root)
        {
            LinkedListNode previous = root, next = null;

            while (previous != null)
            {
                var temp = previous.Next;
                previous.Next = next;
                next = previous;
                previous = temp;
            }
            root = next;

            return root;
        }


        public void Run()
        {
            var head = AssortedMethods.RandomLinkedList(10, 0, 10);
            Console.WriteLine(head.PrintForward());

            head = ReverseList(head);
            Console.WriteLine(head.PrintForward());
        }
    }
}