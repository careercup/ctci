import '../../utils/assorted_methods.dart';
import 'dart:collection';

class MyQueue<T> {
  List<T> stackNewest, stackOldest;

  MyQueue() {
    stackNewest = new List<T>();
    stackOldest = new List<T>();
  }

  int size() => stackNewest.length + stackOldest.length;

  void add(T value) {
    // Push onto stack1
    stackNewest.add(value);
  }

  /*
   * Move elements from stackNewest into stackOldest. This is
   * usually done so we can do operations on stackOldest.
   */
  void shiftStacks() {
    if (stackOldest.isEmpty) {
      while (!stackNewest.isEmpty) {
        stackOldest.add(stackNewest.removeLast());
      }
    }
  }

  T peek() {
    shiftStacks();
    return stackOldest.last; // retrieve the oldest item.
  }

  T remove() {
    shiftStacks();
    return stackOldest.removeLast(); // pop the oldest item.
  }
}

void main() {
  MyQueue<int> my_queue = new MyQueue<int>();

  // Let's test our code against a "real" queue.
  Queue<int> test_queue = new Queue<int>();

  for (int i = 0; i < 100; i++) {
    int choice = randomIntInRange(0, 10);
    if (choice <= 5) { // enqueue
      int element = randomIntInRange(1, 10);
      test_queue.add(element);
      my_queue.add(element);
      print("Enqueued $element");

    } else if (test_queue.length > 0) {
      int top1 = test_queue.removeFirst();
      int top2 = my_queue.remove();
      if (top1 != top2) { // Check for error
        print("*** FAILURE - DIFFERENT TOPS: $top1 , $top2");
      }
      print("Dequeued $top1");
    }

    if (test_queue.length == my_queue.size()) {
      if (test_queue.length > 0 && test_queue.first != my_queue.peek()) {
        print("*** FAILURE - DIFFERENT TOPS: ${test_queue.last} != ${my_queue.peek()}");
      }
    } else {
      print(" *** FAILURE - DIFFERENT SIZES");
    }
  }
}