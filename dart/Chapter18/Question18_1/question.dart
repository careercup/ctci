import 'dart:math';

Random random = new Random();

int add(int a, int b) {
  if (b == 0) return a;

  int sum = a ^ b; // Add without carrying
  int carry = (a & b) << 1; // carry, but don't add
  return add(sum, carry);
}

int randomInt(int n) {
  return (random.nextDouble() * n).toInt();
}

void main() {
  for (int i = 0; i < 100; i++) {
    int a = randomInt(10);
    int b = randomInt(10);
    int sum = add(a, b);
    print("$a + $b = $sum");
    assert(sum == a + b);
  }
}