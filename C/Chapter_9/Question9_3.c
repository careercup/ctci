#include<stdio.h>

int findMagicIndex(int arr[], int start, int end) {
  int mid;

  if(end < start || start < 0)
    return -1;

  mid = (start + end) / 2;

  if(arr[mid] == mid)
    return mid;
  else if (arr[mid] > mid)
    return findMagicIndex(arr, start, mid - 1);
  else
    return findMagicIndex(arr, mid + 1, end);
}

int findMin(int a, int b) {
  return (a < b) ? a : b;
}

int findMagicWithDuplicate(int arr[], int start, int end) {
  int mid, midValue, left, right, li, ri;

  if(end < start || start < 0)
    return -1;

  mid = (start + end) / 2;

  midValue = arr[mid];

  if(midValue == mid)
    return mid;

  // search left
  left = findMin(mid - 1, midValue);
  li = findMagicWithDuplicate(arr, start, left);
  if(li >= 0)
    return li;

  //search right
  right = findMin(mid + 1, midValue);
  ri = findMagicWithDuplicate(arr, right, end);
  return ri;
}

int main() {
  //int arr[] = {-40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13};
  int arr[] = {-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13};
  int n = 11;
  int res;

  //res = findMagicIndex(arr, 0, n - 1);
  //printf("%d is result\n",res);

  res = findMagicWithDuplicate(arr, 0, n - 1);
  printf("%d is result\n",res);
  return 0;
}
