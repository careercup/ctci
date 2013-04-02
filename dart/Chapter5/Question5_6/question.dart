int swapOddEvenBits(int x) {
  return (((x & 0xaaaaaaaa) >> 1) | ((x & 0x55555555) << 1));
}

void main() {
  int a = 103217;
  print ("$a: ${a.toRadixString(2)}");
  int b = swapOddEvenBits(a);
  print("$b: ${b.toRadixString(2)}");
}