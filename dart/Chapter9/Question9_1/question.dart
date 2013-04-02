
Stopwatch sw = new Stopwatch();

int countWaysDP(int n, List<int> map) {
  if (n < 0) {
    return 0;
  } else if (n == 0) {
    return 1;
  } else if (map[n] > -1) {
    return map[n];
  } else {
    map[n] = countWaysDP(n - 1, map)
        + countWaysDP(n - 2, map)
        + countWaysDP(n - 3, map);
    return map[n];
  }

}

int countWaysRecursive(int n) {
  if (n < 0) {
    return 0;
  } else if (n == 0) {
    return 1;
  } else {
    return countWaysRecursive(n - 1) + countWaysRecursive(n - 2) + countWaysRecursive(n - 3);
  }
}

void main() {
  for (int i = 0; i < 30; i++) {
    sw.start();
    int t1 = sw.elapsedMilliseconds;
    List<int> map = new List<int>(30 + 1);
    for (int j = 0; j < map.length; j++) {
      map[j] = -1;
    }

    int c1 = countWaysDP(i, map);
    int t2 = sw.elapsedMilliseconds;
    int d1 = t2 - t1;

    int t3 = sw.elapsedMilliseconds;
    int c2 = countWaysRecursive(i);
    int t4 = sw.elapsedMilliseconds;
    int d2 = t4 - t3;
    print("$i $c1 $c2 $d1 $d2");
    sw.stop();
    sw.reset();
  }
}