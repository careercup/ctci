using System;
using System.Collections.Generic;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_4 : IQuestion
    {
        LinkedListNode Partition(LinkedListNode node, int x)
        {
            LinkedListNode beforeStart = null;
            LinkedListNode beforeEnd = null;
            LinkedListNode afterStart = null;
            LinkedListNode afterEnd = null;

            /* Partition list */
            while (node != null)
            {
                LinkedListNode next = node.Next;
                node.Next = null;
                if (node.Data < x)
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

        LinkedListNode Partition2(LinkedListNode node, int x)
        {
            LinkedListNode beforeStart = null;
            LinkedListNode afterStart = null;

            /* Partition list */
            while (node != null)
            {
                LinkedListNode next = node.Next;
                if (node.Data < x)
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

            LinkedListNode head = beforeStart;
            while (beforeStart.Next != null)
            {
                beforeStart = beforeStart.Next;
            }
            beforeStart.Next = afterStart;
            return head;
        }

        LinkedListNode Partition3(LinkedListNode listHead, int pivot)
        {
            LinkedListNode leftList = new LinkedListNode(); // empty temp node to not have an IF inside the loop
            LinkedListNode rightList = new LinkedListNode(pivot, null, null);

            LinkedListNode leftListHead = leftList; // Used at the end to remove the empty node.
            LinkedListNode rightListHead = rightList; // Used at the end to merge lists.

            LinkedListNode currentNode = listHead;
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

            LinkedListNode finalList = leftListHead.Next;
            leftListHead.Next = null; // remove the temp node, GC will release the mem

            return finalList;
        }

        LinkedListNode Partition4(LinkedListNode listHead, int pivot)
        {
            LinkedListNode nextNode = null;
            LinkedListNode leftSubList = null;
            LinkedListNode rightSubList = null;
            LinkedListNode rightSubListHead = null;
            LinkedListNode pivotNode = null;

            LinkedListNode currentNode = listHead;
            while (currentNode != null)
            {
                nextNode = currentNode.Next;
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
		    LinkedListNode head = new LinkedListNode(vals[0], null, null);
		    LinkedListNode current = head;
		    for (int i = 1; i < vals.Length; i++) {
			    current = new LinkedListNode(vals[i], null, current);
		    }
		    Console.WriteLine(head.PrintForward());

            LinkedListNode head2 = head.Clone();
            LinkedListNode head3 = head.Clone();
            LinkedListNode head4 = head.Clone();
		
		    /* Partition */
		    LinkedListNode h = Partition(head, 5);
            LinkedListNode h2 = Partition2(head2, 5);
            LinkedListNode h3 = Partition3(head3, 5);
            LinkedListNode h4 = Partition4(head4, 5);
		
		    /* Print Result */
            Console.WriteLine(h.PrintForward());
            Console.WriteLine(h2.PrintForward());
            Console.WriteLine(h3.PrintForward());
            Console.WriteLine(h4.PrintForward());
        }
    }
}
