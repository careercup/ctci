
void swap(int a, int b) {
  // Example for a = 9, b = 4
  a = a - b; // a = 9 - 4 = 5
  b = a + b; // b = 5 + 4 = 9
  a = b - a; // a = 9 - 5

  print("a: $a");
  print("b: $b");
}

void swap_opt(int a, int b) {
  a = a^b;
  b = a^b;
  a = a^b;

  print("a: $a");
  print("b: $b");
}

void main() {
  int a = 1672;
  int b = 9332;

  print("a: $a");
  print("b: $b");

  //swap(a, b);
  swap_opt(a, b);
}

