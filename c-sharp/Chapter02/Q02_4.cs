
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter02
{
    public class Q02_4 : IQuestion
    {
        LinkedListNode Partition(LinkedListNode node, int pivot)
        {
            LinkedListNode beforeStart = null;
            LinkedListNode beforeEnd = null;
            LinkedListNode afterStart = null;
            LinkedListNode afterEnd = null;

            /* Partition list */
            while (node != null)
            {
                var next = node.Next;
                node.Next = null;

                if (node.Data < pivot)
                {
                    if (beforeStart == null)
                    {
                        beforeStart = node;
                        beforeEnd = beforeStart;
                    }
                    else
                    {
                        beforeEnd.Next = node;
                        beforeEnd = node;
                    }
                }
                else
                {
                    if (afterStart == null)
                    {
                        afterStart = node;
                        afterEnd = afterStart;
                    }
                    else
                    {
                        afterEnd.Next = node;
                        afterEnd = node;
                    }
                }
                node = next;
            }

            /* Merge before list and after list */
            if (beforeStart == null)
            {
                return afterStart;
            }

            beforeEnd.Next = afterStart;

            return beforeStart;
        }

        LinkedListNode Partition2(LinkedListNode node, int pivot)
        {
            LinkedListNode beforeStart = null;
            LinkedListNode afterStart = null;

            /* Partition list */
            while (node != null)
            {
                var next = node.Next;

                if (node.Data < pivot)
                {
                    /* Insert node into start of before list */
                    node.Next = beforeStart;
                    beforeStart = node;
                }
                else
                {
                    /* Insert node into front of after list */
                    node.Next = afterStart;
                    afterStart = node;
                }
                node = next;
            }

            /* Merge before list and after list */
            if (beforeStart == null)
            {
                return afterStart;
            }

            var head = beforeStart;

            while (beforeStart.Next != null)
            {
                beforeStart = beforeStart.Next;
            }

            beforeStart.Next = afterStart;
            
            return head;
        }

        LinkedListNode Partition3(LinkedListNode listHead, int pivot)
        {
            var leftList = new LinkedListNode(); // empty temp node to not have an IF inside the loop
            var rightList = new LinkedListNode(pivot, null, null);

            var leftListHead = leftList; // Used at the end to remove the empty node.
            var rightListHead = rightList; // Used at the end to merge lists.

            var currentNode = listHead;

            while (currentNode != null)
            {
                if (currentNode.Data < pivot)
                {
                    leftList = new LinkedListNode(currentNode.Data, null, leftList);
                }
                else if (currentNode.Data > pivot)
                {
                    rightList = new LinkedListNode(currentNode.Data, null, rightList);
                }

                currentNode = currentNode.Next;
            }

            leftList.Next = rightListHead;

            var finalList = leftListHead.Next;
            leftListHead.Next = null; // remove the temp node, GC will release the mem

            return finalList;
        }

        LinkedListNode Partition4(LinkedListNode listHead, int pivot)
        {
            LinkedListNode leftSubList = null;
            LinkedListNode rightSubList = null;
            LinkedListNode rightSubListHead = null;
            LinkedListNode pivotNode = null;

            var currentNode = listHead;

            while (currentNode != null)
            {
                var nextNode = currentNode.Next;
                currentNode.Next = null;

                if (currentNode.Data < pivot)
                {
                    leftSubList = leftSubList == null
                        ? currentNode
                        : leftSubList = leftSubList.Next = currentNode;
                }
                else if (currentNode.Data > pivot)
                {
                    rightSubList = rightSubList == null
                        ? rightSubListHead = currentNode
                        : rightSubList = rightSubList.Next = currentNode;
                }
                else
                {
                    pivotNode = currentNode;
                }

                currentNode = nextNode;
            }

            pivotNode.Next = rightSubListHead;
            rightSubListHead = pivotNode;
            leftSubList.Next = rightSubListHead;

            return listHead;
        }

        public void Run()
        {
		    /* Create linked list */
		    int[] vals = {1, 3, 7, 5, 2, 9, 4};
		    var head = new LinkedListNode(vals[0], null, null);
		    var current = head;

		    for (var i = 1; i < vals.Length; i++) 
            {
			    current = new LinkedListNode(vals[i], null, current);
		    }
		    Console.WriteLine(head.PrintForward());

            var head2 = head.Clone();
            var head3 = head.Clone();
            var head4 = head.Clone();
		
		    /* Partition */
            var h = Partition(head, 5);
            var h2 = Partition2(head2, 5);
            var h3 = Partition3(head3, 5);
            var h4 = Partition4(head4, 5);
		
		    /* Print Result */
            Console.WriteLine(h.PrintForward());
            Console.WriteLine(h2.PrintForward());
            Console.WriteLine(h3.PrintForward());
            Console.WriteLine(h4.PrintForward());
        }
    }
}