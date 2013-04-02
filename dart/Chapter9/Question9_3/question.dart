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

  int mid = (start + end) ~/ 2;

  if (array[mid] == mid) {
    return mid;
  } else if (array[mid] > mid) {
    return magicFast(array, start, mid - 1);
  } else {
    return magicFast(array, mid + 1, end);
  }
}

int magicFastFromArray(List<int> array) {
  return magicFast(array, 0, array.length - 1);
}

/* Creates an array that is distinct and sorted */
List<int> getDistinctSortedArray(int size) {

  List<int> array = randomArray(size, -1 * size, size);
  array.sort();
  for (int i = 1; i < array.length; i++) {
    if (array[i] == array[i - 1]) {
      array[i]++;
    } else if (array[i] < array[i - 1]) {
      array[i] = array[i - 1] + 1;
    }
  }

  return array;
}

void main() {
  print("enter main");
  for (int i = 0; i < 1000; i++) {
    int size = randomIntInRange(5, 10);
    List<int> array = getDistinctSortedArray(size);
    int v2 = magicFastFromArray(array);
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