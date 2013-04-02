/*
 * Write code to partition a linked list around a value x,
 * such that all nodes less than x come before all nodes
 * greater than or equal to x.
 */
import '../../utils/linked_list_node.dart';
import '../../utils/assorted_methods.dart';

LinkedListNode partition(LinkedListNode node, int x) {
  LinkedListNode beforeStart;
  LinkedListNode beforeEnd;
  LinkedListNode afterStart;
  LinkedListNode afterEnd;

  /* Partition list */
  while (node != null) {
    LinkedListNode next = node.next;
    node.next = null;
    if (node.data < x) {
      if (beforeStart == null) {
        beforeStart = node;
        beforeEnd = beforeStart;
      } else {
        beforeEnd.next = node;
        beforeEnd = node;
      }
    } else {
      if (afterStart == null) {
        afterStart = node;
        afterEnd = afterStart;
      } else {
        afterEnd.next = node;
        afterEnd = node;
      }
    }
    node = next;
  }

  /* Merge before list and after list */
  if (beforeStart == null) {
    return afterStart;
  }

  beforeEnd.next = afterStart;
  return beforeStart;
}

void main() {
  List<int> vals = [1, 3, 7, 5, 2, 9, 4];
  LinkedListNode head = new LinkedListNode(vals[0], null, null);
  LinkedListNode current = head;

  for (int i = 1; i < vals.length; i++) {
    current = new LinkedListNode(vals[i], null, current);
  }

  print(head.printFoward());

  /* Partition */
  LinkedListNode h = partition(head, 5);

  /* Print Result */
  print(h.printFoward());
}