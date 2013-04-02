import 'dart:collection';

int removeMin(Queue<int> q) {
  int min = q.first;
  for (int v in q) {
    if (min > v) {
      min = v;
    }
  }
  while (q.contains(min)) {
    q.removeFirst();
  }

  return min;
}

void addProducts(Queue<int> q, int v) {
  q.add(v * 3);
  q.add(v * 5);
  q.add(v * 7);
}

int getKthMagicNumber(int k) {
  if (k < 0) {
    return 0;
  }

  int val = 1;
  Queue<int> q = new Queue<int>();
  addProducts(q, 1);
  for (int i = 0; i < k; i++) { // Start at 1 since we've already done one iteration
    val = removeMin(q);
    addProducts(q, val);
  }
  return val;
}

void main() {

  for(int i = 0; i < 14; i++) {
    print("$i : ${getKthMagicNumber(i)}");
  }
}