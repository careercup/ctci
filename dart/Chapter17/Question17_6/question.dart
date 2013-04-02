import '../../utils/assorted_methods.dart';

int findEndOfLeftSubsequence(List<int> array) {
  for (int i = 1; i < array.length; i++) {
    if (array[i] < array[i - 1]) {
      return i - 1;
    }
  }

  return array.length - 1;
}

int findStartOfRightSubsequence(List<int> array) {
  for (int i = array.length - 2; i >= 0; i--) {
    if (array[i] > array[i + 1]) {
      return i + 1;
    }
  }

  return 0;
}

int shrinkLeft(List<int> array, int min_index, int start) {
  int comp = array[min_index];
  for (int i = start - 1; i >= 0; i--) {
    if (array[i] <= comp) {
      return i + 1;
    }
  }

  return 0;
}

int shrinkRight(List<int> array, int max_index, int start) {
  int comp = array[max_index];
  for (int i = start; i < array.length; i++) {
    if (array[i] >= comp) {
      return i - 1;
    }
  }

  return array.length - 1;
}

void findUnsortedSequence(List<int> array) {
  // find left subsequence
  int end_left = findEndOfLeftSubsequence(array);

  // find right subsequence
  int start_right = findStartOfRightSubsequence(array);

  // find min and max elements of middle
  int min_index = end_left + 1;
  if (min_index >= array.length) {
    // print("The array is already sorted.");
    return; // Already sorted
  }

  int max_index = start_right - 1;
  for (int i = end_left; i <= start_right; i++) {
    if (array[i] < array[min_index]) {
      min_index = i;
    }

    if (array[i] > array[max_index]) {
      max_index = i;
    }
  }

  // slide left until less than array[min_index]
  int left_index = shrinkLeft(array, min_index, end_left);

  // slide right until greater than array[max_index]
  int right_index = shrinkRight(array, max_index, start_right);

  if (validate(array, left_index, right_index)) {
    print("TRUE: $left_index $right_index");
  } else {
    print("FALSE: $left_index $right_index");
  }
}

/*
 * Validate that sorting between these indices will sort the array. Note that
 * this is not a complete validation, as it does not check if these are the
 * best possible indices.
 */
bool validate(List<int> array, int left_index, int right_index) {
  List<int> middle = new List<int>(right_index - left_index + 1);
  for (int i = left_index; i <= right_index; i++) {
    middle[i - left_index] = array[i];
  }

  middle.sort();

  for (int i = left_index; i <= right_index; i++) {
    array[i] = middle[i - left_index];
  }

  for (int i = 1; i < array.length; i++) {
    if (array[i - 1] > array[i]) {
      return false;
    }
  }

  return true;
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 11, 7, 12, 6, 7, 16, 18, 19];
  findUnsortedSequence(array);
}