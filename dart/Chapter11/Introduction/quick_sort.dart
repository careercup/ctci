import '../../utils/assorted_methods.dart';

void swap(List<int> array, int i, int j) {
  int tmp = array[i];
  array[i] = array[j];
  array[j] = tmp;
}

int partition(List<int> arr, int left, int right) {
  int pivot = arr[(left + right) ~/ 2]; // Pick a pivot point. Can be an element

  while(left <= right) { // Until we've gone through the whole array
    // Find element on left that should be on right
    while (arr[left] < pivot) {
      left++;
    }

    // Find element on right that should be on left
    while (arr[right] > pivot) {
      right--;
    }

    // Swap elements, and move left and right indices
    if (left <= right) {
      swap(arr, left, right);
      left++;
      right--;
    }
  }

  return left;
}

void quickSort(List<int> arr, int left, int right) {
  int index = partition(arr, left, right);
  if (left < index - 1) { // Sort left half
    quickSort(arr, left, index - 1);
  }

  if (index < right) { // Sort right half
    quickSort(arr, index, right);
  }
}

void main() {
  List<int> arr = randomArray(20, 0, 20);
  print(arr);
  quickSort(arr, 0, arr.length - 1);
  print(arr);
}