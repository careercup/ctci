
class Node {
  Node above;
  Node below;
  int value;
  Node(this.value);
}

class Stack {
  int capacity;
  Node top;
  Node bottom;
  int size = 0;

  Stack(this.capacity);

  bool isFull() => capacity == size;

  void join(Node above, Node below) {
    if (below != null) {
      below.above = above;
    }

    if (above != null) {
      above.below = below;
    }
  }

  bool push(int v) {
    if (size >= capacity) {
      return false;
    }

    size++;

    Node n = new Node(v);
    if (size == 1) {
      bottom = n;
    }

    join(n, top);
    top = n;

    return true;
  }

  int pop() {
    Node t = top;
    top = top.below;
    size--;
    return t.value;
  }

  bool isEmpty() => size == 0;

  int removeBottom() {
    Node b = bottom;
    bottom = bottom.above;
    if (bottom != null) {
      bottom.below = null;
    }

    size--;
    return b.value;
  }
}

class SetOfStacks {
  List<Stack> stacks = new List<Stack>();
  int capacity;

  SetOfStacks(this.capacity);

  Stack getLastStack() {
    if (stacks.length == 0) {
      return null;
    }

    return stacks[stacks.length -1];
  }

  void push(int v) {
    Stack last = getLastStack();
    if (last != null && !last.isFull()) { // add to last
      last.push(v);
    } else { // must create new stack
      Stack stack = new Stack(capacity);
      stack.push(v);
      stacks.add(stack);
    }
  }

  int pop() {
    Stack last = getLastStack();
    int v = last.pop();
    if (last.size == 0) {
      stacks.removeAt(stacks.length - 1);
    }

    return v;
  }

  int popAt(int index) => leftShift(index, true);

  int leftShift(int index, bool removeTop) {
    Stack stack = stacks[index];
    int removed_item;
    if (removeTop) {
      removed_item = stack.pop();
    } else {
      removed_item = stack.removeBottom();
    }

    if (stack.isEmpty()) {
      stacks.removeAt(index);
    } else if (stacks.length > index + 1) {
      int v = leftShift(index + 1, false);
      stack.push(v);
    }

    return removed_item;
  }

  bool isEmpty() {
    Stack last = getLastStack();
    return last == null || last.isEmpty();
  }
}

void main() {
  int capacity_per_substack = 5;
  SetOfStacks set = new SetOfStacks(capacity_per_substack);
  for (int i = 0; i < 34; i++) {
    set.push(i);
  }

  for (int i = 0; i < 34; i++) {
    print("Popped ${set.pop()}");
  }
}