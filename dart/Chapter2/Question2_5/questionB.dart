/* Suppose the digits are stored in forward order. Repeat the above
 * problem.
 *
 * Example
 * Input: (6->1->7) + (2->9->5). That is, 617 + 295.
 * Output: 9->1->2. That is, 912.
 */
import '../../utils/linked_list_node.dart';

class PartialSum {
  LinkedListNode sum = null;
  int carry = 0;
}

int length(LinkedListNode l) {
  if (l == null) {
    return 0;
  } else {
    return 1 + length(l.next);
  }
}

LinkedListNode padList(LinkedListNode l, int padding) {
  LinkedListNode head = l;
  for (int i = 0; i < padding; i++) {
    LinkedListNode n = new LinkedListNode(0, null, null);
    head.prev = n;
    n.next = head;
    head = n;
  }
  return head;
}

LinkedListNode insertBefore(LinkedListNode list, int data) {
  LinkedListNode node = new LinkedListNode(data, null, null);
  if (list != null) {
    list.prev = node;
    node.next = list;
  }
  return node;
}

PartialSum addListsHelper(LinkedListNode l1, LinkedListNode l2) {
  if (l1 == null && l2 == null) {
    PartialSum sum = new PartialSum();
    return sum;
  }

  PartialSum sum = addListsHelper(l1.next, l2.next);
  int val = sum.carry + l1.data + l2.data;
  LinkedListNode full_result = insertBefore(sum.sum, val % 10);
  sum.sum = full_result;
  sum.carry = val ~/ 10;
  return sum;
}

LinkedListNode addLists(LinkedListNode l1, LinkedListNode l2) {
  int len1 = length(l1);
  int len2 = length(l2);
  if (len1 < len2) {
    l1 = padList(l1, len2 - len1);
  } else {
    l2 = padList(l2, len1 - len2);
  }

  PartialSum sum = addListsHelper(l1, l2);
  if (sum.carry == 0) {
    return sum.sum;
  } else {
    LinkedListNode result = insertBefore(sum.sum, sum.carry);
    return result;
  }
}

int linkedListToInt(LinkedListNode node) {
  int value = 0;
  while (node != null) {
    value = value * 10 + node.data;
    node = node.next;
  }
  return value;
}

void main() {
  LinkedListNode lA1 = new LinkedListNode(3, null, null);
  LinkedListNode lA2 = new LinkedListNode(1, null, lA1);
  LinkedListNode lA3 = new LinkedListNode(5, null, lA2);

  LinkedListNode lB1 = new LinkedListNode(5, null, null);
  LinkedListNode lB2 = new LinkedListNode(9, null, lB1);
  LinkedListNode lB3 = new LinkedListNode(1, null, lB2);

  LinkedListNode list3 = addLists(lA1, lB1);

  print(" ${lA1.printFoward()}");
  print("+ ${lB1.printFoward()}");
  print("= ${list3.printFoward()}");

  int l1 = linkedListToInt(lA1);
  int l2 = linkedListToInt(lB1);
  int l3 = linkedListToInt(list3);

  print("$l1 + $l2 = $l3");
  print("$l1 + $l2 = ${l1 + l2}");
}