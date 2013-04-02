import 'dart:math';
import 'dart:collection';

void printQueue(Queue<int> q, int x) {
  StringBuffer sb = new StringBuffer();
  sb.write("${x}: ");
  for (int a in q) {
    sb.write("${a ~/ x}, ");
  }
  print(sb.toString());
}

int getKthMagicNumber(int k) {
  if (k < 0) {
    return 0;
  }

  int val = 0;
  Queue<int> queue3 = new Queue<int>();
  Queue<int> queue5 = new Queue<int>();
  Queue<int> queue7 = new Queue<int>();
  queue3.add(1);
  for (int i = 0; i <= k; i++) { // Include 0th iteration through kth iteration
    int v3 = queue3.length > 0 ? queue3.first : -1;
    int v5 = queue5.length > 0 ? queue5.first : -1;
    int v7 = queue7.length > 0 ? queue7.first : -1;
    val = min(v3, min(v5, v7));
    if (val == v3) {
      queue3.removeFirst();
      queue3.add(3 * val);
      queue5.add(5 * val);
    } else if (val == v5) {
      queue5.removeFirst();
      queue5.add(5 * val);
    } else if (val == v7) {
      queue7.removeFirst();
    }

    queue7.add(7 * val);
  }

  return val;
}

void main() {
  for(int i = 0; i < 14; i++) {
    print("$i : ${getKthMagicNumber(i)}");
  }
}