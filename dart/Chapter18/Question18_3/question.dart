import 'dart:math';

Random random = new Random();

/* Random number between lower and higher, inclusive */
int rand(int lower, int higher) {
  return lower + (random.nextDouble() * (higher - lower  + 1)).toInt();
}

/*
 * pick M elements from original array. Clone original array so that
 * we don't destory the input.
 */
List<int> pickMRandomly(List<int> original, int m) {
  List<int> subset = new List<int>(m);
  List<int> array = new List<int>.from(original);

  for (int j = 0; j < m; j++) {
    int index = rand(j, array.length - 1);
    subset[j] = array[index];
    array[index] = array[j]; // array[j] is now "Dead"
  }

  return subset;
}

void main() {
  List<int> cards = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(cards);
  List<int> s = pickMRandomly(cards, 4);
  print(s);
}
