
int updateBits(int n, int m, int i, int j) {

  // Validation
  if (i >= 32 || j < i) {
    return 0;
  }

  /**
   * Create a mask to clear bits i through j in n
   * EXAMPLE: i = 2, j = 4. Result should be 11100011.
   * (Using 8 bits for this example. This is obviously not actually 8
   * bits.)
   */
  int allOnes = ~0; // allOnes

  int left = allOnes << (j + 1); // 1s through position j, then 0s. left = 11100000
  int right = ((1 << i) - 1); // 1's after position i. right = 00000011
  int mask = left | right; // All 1s, except for 0s between i and j. mask = 11100011

  /* Clear i through j, then put m in there */
  int n_cleared = n & mask; // Clear bits j through i.
  int m_shifted = m << i; // Move m into correct position.

  /* OR them, and we're done! */
  return n_cleared | m_shifted;
}

void main() {
  int a = 103217;
  print(a.toRadixString(2));
  int b = 13;
  print(b.toRadixString(2));
  int c = updateBits(a, b, 4, 12);
  print(c.toRadixString(2));
}