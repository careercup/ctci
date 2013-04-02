import 'dart:math';
import '../../utils/assorted_methods.dart';

int magicSlow(List<int> array) {
  for (int i = 0; i < array.length; i++) {
    if (array[i] == i) {
      return i;
    }
  }

  return -1;
}

int magicFast(List<int> array, int start, int end) {
  if (end < start || start < 0 || end >= array.length) {
    return -1;
  }

  int midIndex = (start + end) ~/ 2;
  int midValue = array[midIndex];
  if (midValue == midIndex) {
    return midIndex;
  }

  /* Search left */
  int leftIndex = min(midIndex - 1, midValue);
  int left = magicFast(array, start, leftIndex);
  if (left >= 0) {
    return left;
  }

  /* Search right */
  int rightIndex = max(midIndex + 1, midValue);
  int right = magicFast(array, rightIndex, end);

  return right;
}

int magicFastAsArray(List<int> array) {
  return magicFast(array, 0, array.length - 1);
}

/* Creates an array that is sorted */
List<int> getSortedArray(int size) {
  List<int> array = randomArray(size, -1 * size, size);
  array.sort();
  return array;
}

void main() {
  for (int i = 0; i < 1000; i++) {
    int size = randomIntInRange(5, 20);
    List<int> array = getSortedArray(size);
    int v2 = magicFastAsArray(array);
    if (v2 == -1 && magicSlow(array) != -1) {
      int v1 = magicSlow(array);
      print("Incorrect value: index = -1, actual = $v1 $i");
      break;
    } else if (v2 > -1 && array[v2] != v2) {
      print("Incorrect values: index=$v2, value ${array[v2]}");
      print(arrayToString(array));
      break;
    }
  }
}