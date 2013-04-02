/*
 * Implement an algorithm to find the kth to last element
 * of a singly linked list.
 */

import '../../utils/linked_list_node.dart';
import '../../utils/assorted_methods.dart';

class IntWrapper {
  int value = 0;
}

class Result {
  LinkedListNode node;
  int count;
  Result(this.node, this.count);
}

int nthToLastR1(LinkedListNode head, int n) {
  if (n == 0 || head == null) {
    return 0;
  }

  int k = nthToLastR1(head.next, n) + 1;
  if (k == n) {
    print("${n}th to last node is ${head.data}");
  }
  return k;
}

LinkedListNode nthToLastR2(LinkedListNode head, int n, IntWrapper i) {
  if (head == null) {
    return null;
  }

  LinkedListNode node = nthToLastR2(head.next, n, i);
  i.value = i.value + 1;
  if (i.value == n) {
    return head;
  }
  return node;
}

Result nthToLastR3Helper(LinkedListNode head, int k) {
  if (head == null) {
    return new Result(null, 0);
  }
  Result res = nthToLastR3Helper(head.next, k);
  if (res.node == null) {
    res.count++;
    if (res.count == k) {
      res.node = head;
    }
  }
  return res;
}

LinkedListNode nthToLastR3(LinkedListNode head, int k) {
  Result res = nthToLastR3Helper(head, k);
  if (res != null) {
    return res.node;
  }

  return null;
}

LinkedListNode nthToLast(LinkedListNode head, int n) {
  LinkedListNode p1 = head;
  LinkedListNode p2 = head;

  if (n <= 0) {
    return null;
  }

  // Move p2 n nodes into the list. Keep n1 in the same position.
  for (int i = 0; i < n - 1; i++) {
    if (p2 == null) {
      return null; // Error: list is too small.
    }

    p2 = p2.next;
  }

  if (p2 == null) { // Another error check.
    return null;
  }

  // Move them at the same pace. When p2 hits the end,
  // p1 will be at the right element.
  while (p2.next != null) {
    p1 = p1.next;
    p2 = p2.next;
  }

  return p1;
}

void main() {
  LinkedListNode head = randomLinkedList(10, 0, 10);
  print(head.printFoward());
  int nth = 3;
  IntWrapper wr = new IntWrapper();
  LinkedListNode n = nthToLastR3(head, nth);
  nthToLastR1(head, nth);
  if (n != null) {
    print("${nth}th to last node is ${n.data}");
  } else {
    print("Null. n is out of bounds.");
  }
}