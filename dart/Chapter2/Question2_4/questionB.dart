import '../../utils/linked_list_node.dart';
import '../../utils/assorted_methods.dart';

LinkedListNode partition(LinkedListNode node, int x) {
  LinkedListNode beforeStart;
  LinkedListNode afterStart;

  /* Partition list */
  while (node != null) {
    LinkedListNode next = node.next;
    if (node.data < x) {
      /* Insert node into start of before list */
      node.next = beforeStart;
      beforeStart = node;
    } else {
      /* Insert node into front of after list */
      node.next = afterStart;
      afterStart = node;
    }
    node = next;
  }

  /* Merge before list and after list */
  if (beforeStart == null) {
    return afterStart;
  }

  LinkedListNode head = beforeStart;
  while (beforeStart.next != null) {
    beforeStart = beforeStart.next;
  }
  beforeStart.next = afterStart;
  return head;
}

void main() {
  int length = 20;
  List<LinkedListNode> nodes = new List<LinkedListNode>(length);
  for (int i = 0; i < length; i++) {
    nodes[i] = new LinkedListNode(i >= length / 2 ? length - i - 1 : i, null, null);
  }

  for (int i = 0; i < length; i++) {
    if (i < length - 1) {
      nodes[i].setNext(nodes[i + 1]);
    }
    if (i > 0) {
      nodes[i].setPrevious(nodes[i - 1]);
    }
  }

  LinkedListNode head = nodes[0];
  print(head.printFoward());

  LinkedListNode h = partition(head, 7);
  print(h.printFoward());
}