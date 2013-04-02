import '../../utils/assorted_methods.dart';

class StackData {
  int start;
  int pointer;
  int size = 0;
  int capacity;
  StackData(this.start, this.capacity) {
    pointer = this.start - 1;
  }

  bool isWithinStack(int index, int total_size) {
    // Note: if stack wraps, the head (right side) wraps around to the left.
    if (start <= index && index < start + capacity) {
      // non-wrapping, or "head" (right side) of wrapping case
      return true;
    } else if (start + capacity > total_size && index < (start + capacity) % total_size) {
      // tail (left side) of wrapping case
      return true;
    }

    return false;
  }
}


final int number_of_stacks = 3;
final int default_size = 4;
final int total_size = default_size * number_of_stacks;
final List<StackData> stacks = [new StackData(0, default_size), new StackData(default_size, default_size), new StackData(default_size * 2, default_size)];
final List<int> buffer = new List<int>(total_size);

bool isEmpty(int stackNum) => stacks[stackNum].size == 0;
int peek(int stackNum) => buffer[stacks[stackNum].pointer];

int numberOfElements() => stacks[0].size + stacks[1].size + stacks[2].size;

int nextElement(int index) {
  if (index + 1 == total_size) {
    return 0;
  } else {
    return index + 1;
  }
}

int previousElement(int index) {
  if (index == 0) {
    return total_size - 1;
  } else {
    return index - 1;
  }
}

void shift(int stackNum) {
  StackData stack = stacks[stackNum];
  if (stack.size >= stack.capacity) {
    int nextStack = (stackNum + 1) % number_of_stacks;
    shift(nextStack); // make some room
    stack.capacity++;
  }

  for (int i = (stack.start + stack.capacity - 1) % total_size; // end of array
      stack.isWithinStack(i, total_size);
      i = previousElement(i)) {
    buffer[i] = buffer[previousElement(i)];
  }

  buffer[stack.start] = 0;
  stack.start = nextElement(stack.start); // move start stack
  stack.pointer = nextElement(stack.pointer); // move stack pointer
  stack.capacity--; // return capacity to original
}

/* Expand stack by shifting over other stacks */
void expand(int stackNum) {
  shift((stackNum + 1) % number_of_stacks);
  stacks[stackNum].capacity++;
}

void push(int stackNum, int value) {
  StackData stack = stacks[stackNum];
  /* Check that we have space */
  if (stack.size >= stack.capacity) {
    if (numberOfElements() >= total_size) { // Totally full
      throw "Out of space.";
    } else { // just need to shift things around
      expand(stackNum);
    }
  }

  /* Find the index of the top element in the array + 1,
   * and increment the stack pointer
   */
  stack.size++;
  stack.pointer = nextElement(stack.pointer);
  buffer[stack.pointer] = value;
}

int pop(int stackNum) {
  StackData stack = stacks[stackNum];

  if (stack.size == 0) {
    throw "Trying to pop an empty stack.";
  }

  int value = buffer[stack.pointer];
  buffer[stack.pointer] = 0;
  stack.pointer = previousElement(stack.pointer);
  stack.size--;
  return value;
}

void main() {

  push(0, 10);
  push(1, 20);
  push(2, 30);

  push(1, 21);
  push(0, 11);
  push(0, 12);

  pop(0);

  push(2, 31);

  push(0, 13);
  push(1, 22);

  push(2, 31);
  push(2, 32);
  push(2, 33);
  push(2, 34);

  print("Final Stack: ${arrayToString(buffer)}");

  pop(1);
  push(2, 35);

  print("Final Stack: ${arrayToString(buffer)}");
}