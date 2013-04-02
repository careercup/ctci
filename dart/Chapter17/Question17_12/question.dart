
void printPairSums(List<int> array, int sum) {
  array.sort();

  int first = 0;
  int last = array.length - 1;
  while (first < last) {
    int s = array[first] + array[last];
    if (s == sum) {
      print("${array[first]} ${array[last]}");
      ++first;
      --last;
    } else {
      if (s < sum) {
        ++first;
      } else {
        --last;
      }
    }
  }
}

void main() {
  List<int> test = [9, 3, 6, 5, 7, -1, 13, 14, -2, 12, 0];
  printPairSums(test, 12);
}

