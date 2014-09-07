
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter02
{
    public class Q02_5 : IQuestion
    {
        #region First Part

        LinkedListNode AddLists(LinkedListNode list1, LinkedListNode list2, int carry)
        {
            if (list1 == null && list2 == null && carry == 0)
            {
                return null;
            }

            var result = new LinkedListNode();
            var value = carry;
            
            if (list1 != null)
            {
                value += list1.Data;
            }
            if (list2 != null)
            {
                value += list2.Data;
            }

            result.Data = value % 10;

            if (list1 != null || list2 != null)
            {
                var more = AddLists(list1 == null ? null : list1.Next,
                                               list2 == null ? null : list2.Next,
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
            public LinkedListNode Sum = null;
            public int Carry = 0;
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

        PartialSum AddListsHelper(LinkedListNode list1, LinkedListNode list2)
        {
            if (list1 == null && list2 == null)
            {
                return new PartialSum();
            }

            var sum = new PartialSum();
            var val = 0;
            
            if (list1 != null) 
            {
                sum = AddListsHelper(list1.Next, list2.Next);
                val = sum.Carry + list1.Data + list2.Data;
            }

            var fullResult = insertBefore(sum.Sum, val % 10);
            sum.Sum = fullResult;
            sum.Carry = val / 10;
            
            return sum;
        }

        LinkedListNode AddLists2(LinkedListNode list1, LinkedListNode list2)
        {
            var len1 = Length(list1);
            var len2 = Length(list2);

            if (len1 < len2)
            {
                list1 = PadList(list1, len2 - len1);
            }
            else
            {
                list2 = PadList(list2, len1 - len2);
            }

            var sum = AddListsHelper(list1, list2);
            
            if (sum.Carry == 0)
            {
                return sum.Sum;
            }
            else
            {
                var result = insertBefore(sum.Sum, sum.Carry);
                return result;
            }
        }

        LinkedListNode PadList(LinkedListNode listNode, int padding)
        {
            var head = listNode;

            for (var i = 0; i < padding; i++)
            {
                var n = new LinkedListNode(0, null, null);
                head.Prev = n;
                n.Next = head;
                head = n;
            }

            return head;
        }

        LinkedListNode insertBefore(LinkedListNode list, int data)
        {
            var node = new LinkedListNode(data, null, null);

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
                var lA1 = new LinkedListNode(9, null, null);
                var lA2 = new LinkedListNode(9, null, lA1);
                var lA3 = new LinkedListNode(9, null, lA2);

                var lB1 = new LinkedListNode(1, null, null);
                var lB2 = new LinkedListNode(0, null, lB1);
                var lB3 = new LinkedListNode(0, null, lB2);

                var list3 = AddLists(lA1, lB1, 0);

                Console.WriteLine("  " + lA1.PrintForward());
                Console.WriteLine("+ " + lB1.PrintForward());
                Console.WriteLine("= " + list3.PrintForward());

                var l1 = LinkedListToInt(lA1);
                var l2 = LinkedListToInt(lB1);
                var l3 = LinkedListToInt(list3);

                Console.Write(l1 + " + " + l2 + " = " + l3 + "\n");
                Console.WriteLine(l1 + " + " + l2 + " = " + (l1 + l2));
            }

            #endregion

            #region Followup
            {
		        var lA1 = new LinkedListNode(3, null, null);
                var lA2 = new LinkedListNode(1, null, lA1);
                //LinkedListNode lA3 = new LinkedListNode(5, null, lA2);

                var lB1 = new LinkedListNode(5, null, null);
                var lB2 = new LinkedListNode(9, null, lB1);
                var lB3 = new LinkedListNode(1, null, lB2);

                var list3 = AddLists2(lA1, lB1);

                Console.WriteLine("  " + lA1.PrintForward());
                Console.WriteLine("+ " + lB1.PrintForward());
                Console.WriteLine("= " + list3.PrintForward());

                var l1 = linkedListToInt(lA1);
                var l2 = linkedListToInt(lB1);
                var l3 = linkedListToInt(list3);
		
		        Console.Write(l1 + " + " + l2 + " = " + l3 + "\n");
		        Console.WriteLine(l1 + " + " + l2 + " = " + (l1 + l2));		
            }
            #endregion
        }
    }
}