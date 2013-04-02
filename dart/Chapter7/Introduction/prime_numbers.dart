import 'dart:math';

bool primeNaive(int n) {
  for (int i = 2; i < n; i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

bool primeSlightlyBetter(int n) {
  int s = sqrt(n).toInt();
  for (int i = 2; i <= s; i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}

void main() {
  for (int i = 2; i < 100; i++) {
    if (primeSlightlyBetter(i)) {
      print(i);
    }
  }

}