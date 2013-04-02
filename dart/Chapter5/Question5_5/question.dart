
int bitSwapRequired(int a, int b) {
  int count = 0;
  for (int c = a ^ b; c != 0; c = c >> 1) {
    count += c & 1;
  }

  return count;
}

int bitSwapRequired2(int a, int b) {
  int count = 0;
  for (int c = a ^ b; c != 0; c = c & (c - 1)) {
    count++;
  }

  return count;
}

void main() {
  int a = 23432;
  int b = 512132;
  print("$a: ${a.toRadixString(2)}");
  print("$b: ${b.toRadixString(2)}");
  int nbits = bitSwapRequired(a, b);
  int nbits2 = bitSwapRequired2(a, b);
  print("Required number of bits: $nbits $nbits2");
}