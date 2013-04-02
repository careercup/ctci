
int numberOf2s(int n) {
  int count = 0;
  while (n > 0) {
    if (n % 10 == 2) {
      count++;
    }

    n = n ~/ 10;
  }

  return count;
}

int numberOf2sInRange(int n) {
  int count = 0;
  for (int i = 2; i <= n; i++) { // Might as well start at 2;
    count += numberOf2s(i);
  }

  return count;
}

void main() {
  for (int i = 0; i < 1000; i++) {
    int v = numberOf2sInRange(i);
    print("Between 0 and $i: $v");
  }
}