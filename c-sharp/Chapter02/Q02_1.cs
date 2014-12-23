using System;
using System.Collections.Generic;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_1 : IQuestion
    {
        int _tapB = 0;
        int _tapC = 0;

        void Tap(int i)
        {
            if (i == 0)
            {
                _tapB++;
            }
            else
            {
                _tapC++;
            }
        }

        void DeleteDupsA(LinkedListNode n)
        {
            Dictionary<int, bool> table = new Dictionary<int, bool>();
            LinkedListNode previous = null;
            while (n != null)
            {
                if (table.ContainsKey(n.Data))
                {
                    previous.Next = n.Next;
                }
                else
                {
                    table.Add(n.Data, true);
                    previous = n;
                }
                n = n.Next;
            }
        }

        void DeleteDupsB(LinkedListNode head)
        {
            if (head == null) return;

            LinkedListNode current = head;
            while (current != null)
            {
                /* Remove all future nodes that have the same value */
                LinkedListNode runner = current;
                while (runner.Next != null)
                {
                    Tap(0);
                    if (runner.Next.Data == current.Data)
                    {
                        runner.Next = runner.Next.Next;
                    }
                    else
                    {
                        runner = runner.Next;
                    }
                }
                current = current.Next;
            }
        }

        void DeleteDupsC(LinkedListNode head)
        {
            if (head == null) return;
            LinkedListNode previous = head;
            LinkedListNode current = previous.Next;
            while (current != null)
            {
                // Look backwards for dups, and remove any that you see.
                LinkedListNode runner = head;
                while (runner != current)
                {
                    Tap(1);
                    if (runner.Data == current.Data)
                    {
                        LinkedListNode tmp = current.Next;
                        previous.Next = tmp;
                        current = tmp;
                        /* We know we can�t have more than one dup preceding
                         * our element since it would have been removed 
                         * earlier. */
                        break;
                    }
                    runner = runner.Next;
                }

                /* If runner == current, then we didn�t find any duplicate 
                 * elements in the previous for loop.  We then need to 
                 * increment current.  
                 * If runner != current, then we must have hit the �break� 
                 * condition, in which case we found a dup and current has
                 * already been incremented.*/
                if (runner == current)
                {
                    previous = current;
                    current = current.Next;
                }
            }
        }

        public void Run()
        {
		    LinkedListNode first = new LinkedListNode(0, null, null); //AssortedMethods.randomLinkedList(1000, 0, 2);
		    LinkedListNode originalList = first;
		    LinkedListNode second = first;
		    for (int i = 1; i < 8; i++) {
			    second = new LinkedListNode(i % 2, null, null);
			    first.SetNext(second);
			    second.SetPrevious(first);
			    first = second;
		    }

            LinkedListNode list1 = originalList.Clone();
            LinkedListNode list2 = originalList.Clone();
            LinkedListNode list3 = originalList.Clone();

            DeleteDupsA(list1);
            DeleteDupsB(list2);
            DeleteDupsC(list3);
            
            Console.WriteLine(originalList.PrintForward());
            Console.WriteLine(list1.PrintForward());
            Console.WriteLine(list1.PrintForward());
            Console.WriteLine(list1.PrintForward());

            Console.WriteLine(_tapB);
            Console.WriteLine(_tapC);
        }
    }
}
