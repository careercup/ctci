
int countFactZeros(int n) {
  int count = 0;
  if (n < 0) {
    print("Factorial is not defined for negative numbers");
    return 0;
  }

  for (int i = 5; n ~/ i > 0; i *= 5) {
    count += n ~/ i;
  }

  return count;
}

int factorial(int n) {
  if (n == 1) {
    return 1;
  } else if (n > 1) {
    return n * factorial(n - 1);
  } else {
    return -1; // Error;
  }
}

void main() {
  for (int i = 0; i < 12; i++) {
    print("$i! (or ${factorial(i)}) has ${countFactZeros(i)} zeros");
  }
}