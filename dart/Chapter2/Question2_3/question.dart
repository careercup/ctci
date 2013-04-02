/*
 * Implement an algorithm to delete a node in the middle of a
 * singly linked list, given only access to that node.
 * EXAMPLE
 * Input: the node c from the linked list a->b->c->d->e
 * Result: nothing is returned, but the new linked list looks like
 * a->b->d->e
 */
import '../../utils/linked_list_node.dart';
import '../../utils/assorted_methods.dart';

bool deleteNode(LinkedListNode n) {
  if (n == null || n.next == null) {
    return false; // Failure
  }

  LinkedListNode next = n.next;
  n.data = next.data;
  n.next = next.next;
  return true;
}

void main() {
  LinkedListNode head = randomLinkedList(10, 0, 10);
  print(head.printFoward());
  deleteNode(head.next.next.next.next);
  print(head.printFoward());
}