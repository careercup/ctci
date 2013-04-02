import 'dart:math';

Random random = new Random();

int rand7() {
  while(true) {
    int r1 = 2 * rand5(); /* evens between 0 and 9 */
    int r2 = rand5(); /* will be later used to generate a 0 or 1 */
    if (r2 != 4) { /* r2 has an extra even number, so discard the extra */
      int rand1 = r2 % 2; /* Generate 0 or 1 */
      int n = r1 + rand1; /* will be in the range 0 through 9 */
      if (n < 7) {
        return n;
      }
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
