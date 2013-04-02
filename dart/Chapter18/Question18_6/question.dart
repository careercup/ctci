import '../../utils/assorted_methods.dart';
import 'dart:math' as Math;

class Parts {
  int left;
  int right;
  Parts(this.left, this.right);
}

int rankB(List<int> array, int rank) {
  List<int> cloned = new List<int>.from(array);
  cloned.sort();
  return cloned[rank];
}

void swap(List<int> array, int i, int j) {
  int t = array[i];
  array[i] = array[j];
  array[j] = t;
}

bool validate(List<int> array, int left, int right, int pivot, int endLeft) {
  for (int i = left; i <= endLeft; i++) {
    if (array[i] > pivot) {
      return false;
    }
  }

  for (int i = endLeft + 1; i <= right; i++) {
    if (array[i] <= pivot) {
      return false;
    }
  }

  return true;
}

bool validateFull(List<int> array) {
  for (int i = 0; i < array.length; i++) {
    for (int j = i; j < array.length; j++) {
      for (int k = i; k <= j; k++) {
        List<int> cloned = new List<int>.from(array);
        int pivot = array[k];
        int p = partition(cloned, i, j, pivot);
        if (!validate(cloned, i, j, pivot, p)) {
          print(cloned);
          String val = p >= 0 && p < cloned.length ? array[i].toString() : "?";
          print("pivot: $pivot | $p | val");
          return false;
        }
      }
    }
  }

  return true;
}


bool isUnique(List<int> array) {
  List<int> cloned = new List<int>.from(array);
  cloned.sort();
  for (int i = 1; i < cloned.length; i++) {
    if (cloned[i] == cloned[i - 1]) {
      return false;
    }
  }

  return true;
}

int max(List<int> array, int left, int right) {
  int max = -0xfffffffffffffffff;
  for (int i = left; i <= right; i++) {
    max = Math.max(array[i], max);
  }

  return max;
}

Math.Random random = new Math.Random();

int randomInt(int n) {
  return (random.nextDouble() * n).toInt();
}

int randomIntInRange(int min, int max) {
  return randomInt(max + 1 - min) + min;
}

int partition(List<int> array, int left, int right, int pivot) {
  while (true) {
    while (left <= right && array[left] <= pivot) {
      left++;
    }

    while (left <= right && array[right] > pivot) {
      right--;
    }

    if (left > right) {
      return left - 1;
    }

    swap(array, left, right);
  }
}

int rank(List<int> array, int left, int right, int _rank) {
  int pivot = array[randomIntInRange(left, right)];
  int leftEnd = partition(array, left, right, pivot); // returns end of the left partition
  int leftSize = leftEnd - left + 1;
  if (leftSize == _rank + 1) {
    return max(array, left, leftEnd);
  } else if (_rank < leftSize) {
    return rank(array, left, leftEnd, _rank);
  } else {
    return rank(array, leftEnd + 1, right, _rank - leftSize);
  }
}

void main() {
  int numberOfTests = 1000;
  int count = 0;
  while (count < numberOfTests) {
    List<int> array = randomArray(10, -1000, 1000);
    if (isUnique(array)) {
      int n = randomIntInRange(0, array.length - 1);
      int rank1 = rank(new List<int>.from(array), 0, array.length - 1, n);
      int rank2 = rankB(new List<int>.from(array), n);

      if (rank1 != rank2) {
        print("ERROR: $rank1 $rank2");
        print(array);
      }

      count++;
    }
  }

  print("Completed $count runs.");
}