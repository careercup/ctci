import '../../utils/linked_list_node.dart';

class Stack<E> {
  List<E> _stack = new List<E>();

  push(E item) {
    _stack.add(item);
  }

  E pop() {
    return _stack.removeLast();
  }
}


bool isPalindrome(LinkedListNode head) {
  LinkedListNode fast = head;
  LinkedListNode slow = head;

  Stack<int> stack = new Stack<int>();

  while (fast != null && fast.next != null) {
    stack.push(slow.data);
    slow = slow.next;
    fast = fast.next.next;
  }

  /* Has odd number of elements, so skip the middle */
  if (fast != null) {
    slow = slow.next;
  }

  while (slow != null) {
    int top = stack.pop();
    print("${slow.data}  ${top}");
    if (top != slow.data) {
      return false;
    }

    slow = slow.next;
  }

  return true;
}

void main() {
  int length = 9;
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

  // nodes[length - 2].data = 9; // Uncomment to ruin palindrome

  LinkedListNode head = nodes[0];
  print(head.printFoward());
  print(isPalindrome(head));
}