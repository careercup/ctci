/*
 * You have two numbers represented by a linked list, where
 * each node contains a single digit. The digits are stored
 * in reverse order, such that the 1's digit is at the
 * head of the list. Write a function that adds the two numbers
 * and returns the sum as a linked list.
 *
 * EXAMPLE
 * Input: (7->1->6) + (5->9->2). That is, 617 + 295.
 * Output: 2->1->9. That is, 912.
 *
 * FOLLOW UP
 *
 * Suppose the digits are stored in forward order. Repeat the above
 * problem.
 *
 * Example
 * Input: (6->1->7) + (2->9->5). That is, 617 + 295.
 * Output: 9->1->2. That is, 912.
 */
import '../../utils/linked_list_node.dart';
import '../../utils/assorted_methods.dart';

LinkedListNode addLists(LinkedListNode l1, LinkedListNode l2, int carry) {
  if (l1 == null && l2 == null && carry == 0) {
    return null;
  }

  LinkedListNode result = new LinkedListNode(carry, null, null);
  int value = carry;
  if (l1 != null) {
    value += l1.data;
  }
  if (l2 != null) {
    value += l2.data;
  }
  result.data = value % 10;
  if (l1 != null || l2 != null || value >= 10) {
    LinkedListNode more = addLists(l1 == null ? null : l1.next,
                                   l2 == null ? null : l2.next,
                                   value >= 10 ? 1 : 0);
    result.setNext(more);
  }
  return result;
}

int linkedListToInt(LinkedListNode node) {
  int value = 0;
  if (node.next != null) {
    value = 10 * linkedListToInt(node.next);
  }
  return value + node.data;
}

void main() {
  LinkedListNode lA1 = new LinkedListNode(3, null, null);
  LinkedListNode lA2 = new LinkedListNode(1, null, lA1);
  LinkedListNode lA3 = new LinkedListNode(5, null, lA2);

  LinkedListNode lB1 = new LinkedListNode(5, null, null);
  LinkedListNode lB2 = new LinkedListNode(9, null, lB1);
  LinkedListNode lB3 = new LinkedListNode(1, null, lB2);

  LinkedListNode list3 = addLists(lA1, lB1, 0);

  print(" ${lA1.printFoward()}");
  print("+ ${lB1.printFoward()}");
  print("= ${list3.printFoward()}");

  int l1 = linkedListToInt(lA1);
  int l2 = linkedListToInt(lB1);
  int l3 = linkedListToInt(list3);

  print("$l1 + $l2 = $l3");
  print("$l1 + $l2 = ${l1 + l2}");
}