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

        void DeleteDupsA(LinkedListNode node)
        {
            var table = new Dictionary<int, bool>();
            LinkedListNode previous = null;

            while (node != null)
            {
                if (table.ContainsKey(node.Data))
                {
                    if (previous != null)
                    {                     
                        previous.Next = node.Next;
                    }
                }
                else
                {
                    table.Add(node.Data, true);
                    previous = node;
                }

                node = node.Next;
            }
        }

        void DeleteDupsB(LinkedListNode head)
        {
            if (head == null) return;

            var current = head;

            while (current != null)
            {
                /* Remove all future nodes that have the same value */
                var runner = current;

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

            var previous = head;
            var current = previous.Next;

            while (current != null)
            {
                // Look backwards for dups, and remove any that you see.
                var runner = head;

                while (runner != current)
                {
                    Tap(1);

                    if (runner.Data == current.Data)
                    {
                        var temp = current.Next;
                        previous.Next = temp;
                        current = temp;
                        /* We know we can't have more than one dup preceding
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
		    var first = new LinkedListNode(0, null, null);
		    var originalList = first;
		    var second = first;

		    for (var i = 1; i < 8; i++) 
            {
			    second = new LinkedListNode(i % 2, null, null);
			    first.SetNext(second);
			    second.SetPrevious(first);
			    first = second;
		    }

            var list1 = originalList.Clone();
            var list2 = originalList.Clone();
            var list3 = originalList.Clone();

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