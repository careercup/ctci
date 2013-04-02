
final int stackSize = 10;
final List<int> buffer = new List<int>(stackSize * 3);

// 3 stack pointers to keep track of the index of the top element
final List<int> stackPointer = [-1, -1, -1];

/* returns index of the top of the stack "stackNum", in absolute terms */
int absTopOfStack(int stackNum) => stackNum * stackSize + stackPointer[stackNum];

void push(int stackNum, int value) {
  /* Check that we have space for the next element */
  if (stackPointer[stackNum] + 1 >= stackSize) {
    throw "Out of space.";
  }

  /* Increment stack pointer and then update top value */
  stackPointer[stackNum]++;
  buffer[absTopOfStack(stackNum)] = value;
}

int pop(int stackNum) {
  if (stackPointer[stackNum] == -1) {
    throw "Trying to pop an empty stack.";
  }

  int value = buffer[absTopOfStack(stackNum)]; // Get top
  buffer[absTopOfStack(stackNum)] = 0; // Clear index
  stackPointer[stackNum]--; // Decrement pointer
  return value;
}

int peek(int stackNum) => buffer[absTopOfStack(stackNum)];
bool isEmpty(int stackNum) => stackPointer[stackNum] == -1;

void main() {
  push(2, 4);
  print("Peek 2: ${peek(2)}");
  push(0, 3);
  push(0, 7);
  push(0, 5);
  print("Peek 0: ${peek(0)}");
  pop(0);
  print("Peek 0: ${peek(0)}");
  pop(0);
  print("Peek 0: ${peek(0)}");
}