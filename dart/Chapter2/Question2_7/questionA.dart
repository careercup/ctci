import '../../utils/linked_list_node.dart';

class Result {
  LinkedListNode node;
  bool result;
  Result(this.node, this.result);
}

class Question {

  Result isPalindromeRecurse(LinkedListNode head, int length) {

    if (head == null || length == 0) {
      return new Result(null, true);
    } else if (length == 1) {
      return new Result(head.next, true);
    } else if (length == 2) {
      return new Result(head.next.next, head.data == head.next.data);
    }

    Result res = isPalindromeRecurse(head.next, length - 2);
    if (!res.result || res.node == null) {
      return res; // Only "result" member is actually used in the call stack.
    } else {
      res.result = head.data == res.node.data;
      res.node = res.node.next;
      return res;
    }
  }

  bool isPalindrome(LinkedListNode head) {
    int size = 0;
    LinkedListNode n = head;
    while (n != null) {
      size++;
      n = n.next;
    }

    Result p = isPalindromeRecurse(head, size);
    return p.result;
  }
}

void main() {
  int length = 10;
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

  // nodes[length - 2].data = 9; // Uncomment to ruin palidrome

  LinkedListNode head = nodes[0];
  print(head.printFoward());
  Question q = new Question();
  print(q.isPalindrome(head));

}