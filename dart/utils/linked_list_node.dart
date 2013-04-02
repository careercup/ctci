library linked_list_node;

class LinkedListNode {
  LinkedListNode next;
  LinkedListNode prev;
  LinkedListNode last;
  int data;
  LinkedListNode(int d, LinkedListNode n, LinkedListNode p) {
    data = d;
    setNext(n);
    setPrevious(p);
  }

  void setNext(LinkedListNode n) {
    next = n;
    if (this == last) {
      last = n;
    }
    if (n != null && n.prev != this) {
      n.setPrevious(this);
    }
  }

  void setPrevious(LinkedListNode p) {
    prev = p;
    if (p != null && p.next != this) {
      p.setNext(this);
    }
  }

  String printFoward() {
    if (next != null) {
      return "$data->${next.printFoward()}";
    } else {
      return data.toString();
    }
  }

  LinkedListNode clone() {
    LinkedListNode next2 = null;
    if (next != null) {
      next2 = next.clone();
    }
    LinkedListNode head2 = new LinkedListNode(data, next2, null);
    return head2;
  }
}