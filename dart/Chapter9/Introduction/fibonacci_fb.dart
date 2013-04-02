
int max = 100;
List<int> fib = new List<int>(max);
int fibonacci(int i) {
  if (i == 0) {
    return 0;
  }

  if (i == 1) {
    return 1;
  }

  if (fib[i] != null) {
    return fib[i];
  }

  fib[i] = fibonacci(i - 1) + fibonacci(i - 2);
  return fib[i];
}

void main() {

  int trials = 10; // Run code multiple times to compute average time.
  List<int> times = new List<int>(max);
  for (int i = 0; i < times.length; i++) {
    times[i]=0;
  }
  Stopwatch sw = new Stopwatch();

  for (int j = 0; j < trials; j++) { // Run this 10 times to compute
    for (int i = 0; i < max; i++) {
      fib = new List<int>(max);
      sw.start();
      fibonacci(i);
      sw.stop();
      times[i] += sw.elapsedMilliseconds;
    }
  }

  for (int j = 0; j < max; j++) {
    print("$j: ${times[j]/trials}ms");
  }
}