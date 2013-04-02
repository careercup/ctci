
int factorsOf5(int i) {
  int count = 0;
  while (i % 5 == 0) {
    count++;
    i ~/= 5;
  }
  return count;
}

int countFactZeros(int n) {
  int count = 0;
  for (int i = 2; i <= n; i++) {
    count += factorsOf5(i);
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
  for (int i = 1; i < 12; i++) {
    print("$i! (or ${factorial(i)}) has ${countFactZeros(i)} zeros");
  }
}