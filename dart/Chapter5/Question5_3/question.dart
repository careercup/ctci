
int countOnes(int i) {
  int count = 0;
  while (i > 0) {
    if ((i & 1) == 1) {
      count++;
    }
    i = i >> 1;
  }
  return count;
}

int countZeros(int i) {
  return 32 - countOnes(i);
}

bool hasValidNext(int i) {
  if (i == 0) {
    return false;
  }

  int count = 0;
  while ((i & 1) == 1) {
    i >>= 1;
    count++;
  }

  if (count == 31) {
    return false;
  }

  return true;
}

bool hasValidPrev(int i) {
  while ((i & 1) == 1) {
    i >>= 1;
  }

  if (i == 0) {
    return false;
  }

  return true;
}

int getNextSlow(int i) {
  if (!hasValidNext(i)) {
    return -1;
  }

  int num_ones = countOnes(i);
  i++;

  while(countOnes(i) != num_ones) {
    i++;
  }

  return i;
}

int getPrevSlow(int i) {
  if (!hasValidPrev(i)) {
    return -1;
  }

  int num_ones = countOnes(i);
  i--;

  while(countOnes(i) != num_ones) {
    i--;
  }

  return i;
}

int getNext(int n) {
  int c = n;
  int c0 = 0;
  int c1 = 0;

  while(((c & 1) == 0) && (c != 0)) {
    c0++;
    c >>= 1;
  }

  while ((c & 1) == 1) {
    c1++;
    c >>= 1;
  }

  /**
   * If c is 0, then n is a sequence of 1s followed by a sequence of 0s.
   * This is already the biggest number with c1 ones. Return error.
   */
  if (c0 + c1 == 31 || c0 + c1 == 0) {
    return -1;
  }

  int pos = c0 + c1; // position of right-most non-trailing zero (where the right most bit is bit 0)

  /* Flip the right-most non-trailing zero (which will be at position pos) */
  n |= (1 << pos);

  /**
   * Clear all bits to the right of pos.
   * Example with pos = 5;
   * (1) Shift 1 over by 5 to create 0..0100000     [ mask = 1 << pos ]
   * (2) Subtract 1 o get 0..0011111                [ mask = mask - 1
   * (3) Flip all the bits by using '~' to get 1..1100000 [ mask = ~mask ]
   * (4) AND with n
   */
  n &= ~((1 << pos) - 1);


  /**
   * Put (ones - 1) 1s on the right by doing the following:
   * (1) Shift 1 over by (ones - 1) spots.
   * (2) Subtract one from that to get 0..0011
   * (3) OR with n
   */
  n |= (1 << (c1 - 1)) - 1;

  return n;
}

int getNextArith(int n) {
  int c = n;
  int c0 = 0;
  int c1 = 0;
  while (((c & 1) == 0) && (c != 0)) {
    c0++;
    c >>= 1;
  }

  while ((c & 1) == 1) {
    c1++;
    c >>= 1;
  }

  /**
   * If c is 0, then n is a sequence of 1s followed by a sequence of 0s.
   * This is already the biggest number with c1 ones. Return error.
   */
  if (c0 + c1 == 31 || c0 + c1 == 0) {
    return -1;
  }

  /**
   * Arithmetically:
   * 2^c0 = 1 << c0
   * 2^(c1 - 1) = 1 << (c0 - 1)
   * next = n + 2^c0 + 2^(c1 - 1) - 1;
   */

  return n + (1 << c0) + (1 << (c1 - 1)) - 1;
}

int getPrev(int n) {
  int temp = n;
  int c0 = 0;
  int c1 = 0;

  while((temp & 1) == 1) {
    c1++;
    temp >>= 1;
  }

  /**
   * If temp is 0, then the number is a sequence of 0s followed by a sequence of 1s.
   * This is already the smallest number with c1 onces. Return -1 for an error.
   */
  if (temp == 0) {
    return -1;
  }

  while (((temp & 1) == 0) && (temp != 0)) {
    c0++;
    temp >>= 1;
  }

  int p = c0 + c1; // position of right-most non-trailing one (where the right most bit is bit 0)

  /**
   * Flip right-most non-trailing one.
   * Example: n = 00011100011.
   * c1 = 2
   * c0 = 3
   * pos = 5
   *
   * Build up a mask as follows:
   * (1) ~0 will be a sequence of 1s
   * (2) shifting left by p + 1 will give you 11.111000000 (six 0s)
   * (3) ANDing with n will clear the last 6 bits
   * n is now 00011000000
   */
  n &= ((~0) << (p + 1)); // Clears from bit p onwards (to the right)

  /**
   * Create a sequence of (c1 + 1) 1s as follows
   * (1) Shift 1 to the left (c1 + 1) times. If c1 is 2, this will give you
   * 0..001000
   * (2) Subtract one from that. This will give you 0..00111
   */
  int mask = (1 << (c1 + 1)) - 1; // Sequence of (c1 + 1) ones

  /**
   * Move the ones to be right up next to bit p
   * Since this is a sequence of (c1 + 1) ones, and p = c1 + c0, we just need to
   * shift this over by (c0 - 1) spots.
   *
   * If c0 = 3 and c1 = 2, then this will look like 00...0011100
   *
   * Then, finally, we OR this with n.
   */
  n |= mask << (c0 - 1);

  return n;
}

int getPrevArith(int n) {
  int temp = n;
  int c0 = 0;
  int c1 = 0;
  while (((temp & 1) == 1) && (temp != 0)) {
    c1++;
    temp >>= 1;
  }

  /**
   * If temp is 0, then the number is a sequence of 0s followed by a sequence of 1s.
   * This is already the smallest number with c1 ones. Return -1 for an error.
   */
  if (temp == 0) {
    return -1;
  }

  while ((temp & 1) == 0 && (temp != 0)) {
    c0++;
    temp >>= 1;
  }

  /**
   * Arithmetric:
   * 2^c1 = 1 << c1
   * 2^(c0 - 1) = 1 << (c0 -1)
   */
  return n - (1 << c1) - (1 << (c0 - 1)) + 1;
}

void binPrint(int i) {
  print("$i: ${i.toRadixString(2)}");
}

void main() {

  // XXX: This example does not fully work, must be broken cause of the way dart
  // handles numbers.

  for (int i = 0; i < 200; i++) {
    int p1 = getPrevSlow(i);
    int p2 = getPrev(i);
    int p3 = getPrevArith(i);

    int n1 = getNextSlow(i);
    int n2 = getNext(i);
    int n3 = getNextArith(i);

    //if (p1 != p2 || p2 != p3 || n1 != n2 || n2 != n3) {
      binPrint(i);
      binPrint(p1);
      binPrint(p2);
      binPrint(p3);
      binPrint(n1);
      binPrint(n2);
      binPrint(n3);
      print("");
    //}
  }
}