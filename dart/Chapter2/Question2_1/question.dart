/*
 * Write code to remove duplicates from an unsorted linked list.
 * FOLLOW UP
 * How would you solve this problem if a temporary buffer is not
 * allowed?
 */
import '../../utils/linked_list_node.dart';

int tapB = 0;
int tapC = 0;

void tap(int i) {
  if (i == 0) {
    tapB++;
  } else {
    tapC++;
  }
}

void deleteDupsA(LinkedListNode n) {
  Map table = new Map();
  LinkedListNode previous = null;
  while (n != null) {
    if (table.containsKey(n.data)) {
      previous.next = n.next;
    } else {
      table[n.data] = true;
      previous = n;
    }
    n = n.next;
  }
}

void deleteDupsC(LinkedListNode head) {
  if (head == null) {
    return;
  }

  LinkedListNode previous = head;
  LinkedListNode current = previous.next;
  while (current != null) {
    // Look backwards for dups, and remove any that you see.
    LinkedListNode runner = head;
    while (runner != current) {
      tap(1);
      if (runner.data == current.data) {
        LinkedListNode tmp = current.next;
        previous.next = tmp;
        current = tmp;
        /* We know we can't have more than one dup preceding
         * our element since it would have been removed
         * earlier.
         */
        break;
      }
      runner = runner.next;
    }

    /* If runner == current, then we didn't find any duplicate
     * elements in the previous for loop. We then need to
     * increment current.
     * If runner != current, then we must have hit the 'break'
     * condition, in which case we found a dup and current has
     * already been incremented.
     */
    if (runner == current) {
      previous = current;
      current = current.next;
    }
  }
}

void deleteDupsB(LinkedListNode head) {
  if (head == null) {
    return;
  }

  LinkedListNode current = head;
  while (current != null) {
    /* Remove all future nodes that have the same value */
    LinkedListNode runner = current;
    while (runner.next != null) {
      tap(0);
      if (runner.next.data == current.data) {
        runner.next = runner.next.next;
      } else {
        runner = runner.next;
      }
    }
    current = current.next;
  }
}


void main() {
  LinkedListNode first = new LinkedListNode(0, null, null);
  LinkedListNode head = first;
  LinkedListNode second = first;
  for (int i = 1; i < 8; i++) {
    second = new LinkedListNode(i % 2, null, null);
    first.setNext(second);
    second.setPrevious(first);
    first = second;
  }

  print(head.printFoward());
  LinkedListNode clone = head.clone();
  deleteDupsB(head);
  deleteDupsC(clone);
  print(tapB);
  print(tapC);
}