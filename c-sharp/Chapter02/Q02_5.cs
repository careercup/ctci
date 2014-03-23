using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter02
{
    public class Q02_5 : IQuestion
    {
        #region First Part

        LinkedListNode AddLists(LinkedListNode l1, LinkedListNode l2, int carry)
        {
            if (l1 == null && l2 == null && carry == 0)
            {
                return null;
            }

            LinkedListNode result = new LinkedListNode();
            int value = carry;
            if (l1 != null)
            {
                value += l1.Data;
            }
            if (l2 != null)
            {
                value += l2.Data;
            }
            result.Data = value % 10;
            if (l1 != null || l2 != null)
            {
                LinkedListNode more = AddLists(l1 == null ? null : l1.Next,
                                               l2 == null ? null : l2.Next,
                                               value >= 10 ? 1 : 0);
                result.SetNext(more);
            }
            return result;
        }

        int LinkedListToInt(LinkedListNode node)
        {
            int value = 0;
            if (node.Next != null)
            {
                value = 10 * LinkedListToInt(node.Next);
            }
            return value + node.Data;
        }

        #endregion

        #region Followup

        class PartialSum
        {
            public LinkedListNode sum = null;
            public int carry = 0;
        }

        int Length(LinkedListNode l)
        {
            if (l == null)
            {
                return 0;
            }
            else
            {
                return 1 + Length(l.Next);
            }
        }

        PartialSum AddListsHelper(LinkedListNode l1, LinkedListNode l2)
        {
            if (l1 == null && l2 == null)
            {
                return new PartialSum();
            }
            PartialSum sum = AddListsHelper(l1.Next, l2.Next);
            int val = sum.carry + l1.Data + l2.Data;
            LinkedListNode full_result = insertBefore(sum.sum, val % 10);
            sum.sum = full_result;
            sum.carry = val / 10;
            return sum;
        }

        LinkedListNode AddLists2(LinkedListNode l1, LinkedListNode l2)
        {
            int len1 = Length(l1);
            int len2 = Length(l2);
            if (len1 < len2)
            {
                l1 = PadList(l1, len2 - len1);
            }
            else
            {
                l2 = PadList(l2, len1 - len2);
            }
            PartialSum sum = AddListsHelper(l1, l2);
            if (sum.carry == 0)
            {
                return sum.sum;
            }
            else
            {
                LinkedListNode result = insertBefore(sum.sum, sum.carry);
                return result;
            }
        }

        LinkedListNode PadList(LinkedListNode l, int padding)
        {
            LinkedListNode head = l;
            for (int i = 0; i < padding; i++)
            {
                LinkedListNode n = new LinkedListNode(0, null, null);
                head.Prev = n;
                n.Next = head;
                head = n;
            }
            return head;
        }

        LinkedListNode insertBefore(LinkedListNode list, int data)
        {
            LinkedListNode node = new LinkedListNode(data, null, null);
            if (list != null)
            {
                list.Prev = node;
                node.Next = list;
            }
            return node;
        }

        int linkedListToInt(LinkedListNode node)
        {
            int value = 0;
            while (node != null)
            {
                value = value * 10 + node.Data;
                node = node.Next;
            }
            return value;
        }	

        #endregion

        public void Run()
        {
            #region First Part
            {
                LinkedListNode lA1 = new LinkedListNode(9, null, null);
                LinkedListNode lA2 = new LinkedListNode(9, null, lA1);
                LinkedListNode lA3 = new LinkedListNode(9, null, lA2);

                LinkedListNode lB1 = new LinkedListNode(1, null, null);
                LinkedListNode lB2 = new LinkedListNode(0, null, lB1);
                LinkedListNode lB3 = new LinkedListNode(0, null, lB2);

                LinkedListNode list3 = AddLists(lA1, lB1, 0);

                Console.WriteLine("  " + lA1.PrintForward());
                Console.WriteLine("+ " + lB1.PrintForward());
                Console.WriteLine("= " + list3.PrintForward());

                int l1 = LinkedListToInt(lA1);
                int l2 = LinkedListToInt(lB1);
                int l3 = LinkedListToInt(list3);

                Console.Write(l1 + " + " + l2 + " = " + l3 + "\n");
                Console.WriteLine(l1 + " + " + l2 + " = " + (l1 + l2));
            }

            #endregion

            #region Followup
            {
		        LinkedListNode lA1 = new LinkedListNode(3, null, null);
		        LinkedListNode lA2 = new LinkedListNode(1, null, lA1);
                //LinkedListNode lA3 = new LinkedListNode(5, null, lA2);
		
		        LinkedListNode lB1 = new LinkedListNode(5, null, null);
		        LinkedListNode lB2 = new LinkedListNode(9, null, lB1);
		        LinkedListNode lB3 = new LinkedListNode(1, null, lB2);	
		
		        LinkedListNode list3 = AddLists2(lA1, lB1);

                Console.WriteLine("  " + lA1.PrintForward());
                Console.WriteLine("+ " + lB1.PrintForward());
                Console.WriteLine("= " + list3.PrintForward());	
		
		        int l1 = linkedListToInt(lA1);
		        int l2 = linkedListToInt(lB1);
		        int l3 = linkedListToInt(list3);
		
		        Console.Write(l1 + " + " + l2 + " = " + l3 + "\n");
		        Console.WriteLine(l1 + " + " + l2 + " = " + (l1 + l2));		
            }
            #endregion
        }
    }
}
