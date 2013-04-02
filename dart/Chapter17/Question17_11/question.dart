import 'dart:math';

Random random = new Random();

int rand7() {
  while(true) {
    int n = 5 * rand5() + rand5();
    if (n < 21) {
      return n % 7;
    }
  }
}

int rand5() {
  return ((random.nextDouble() * 100) % 5).toInt();
}

void main() {
  /*
   * Test: call rand7 many times and inspect the results;
   */
  List<int> arr = new List<int>.fixedLength(7, fill: 0);

  int test_size = 1000000;
  for (int k = 0; k < test_size; k++) {
    arr[rand7()]++;
  }

  for (int i = 0; i < 7; i++) {
    double percent = 100.0 * arr[i] / test_size;
    print ("$i appeared $percent% of the time.");
  }
}
