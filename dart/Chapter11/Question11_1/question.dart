/**
 * Merges array
 * a first array
 * b second array
 * lastA number of "real" elements in a
 * lastB number of "real" elements in b
 */
void merge(List<int> a, List<int> b, int lastA, int lastB) {
  int indexMerged = lastB + lastA - 1; /* Index of last location of merged array */
  int indexA = lastA - 1; /* Index of last element in array a */
  int indexB = lastB - 1; /* Index of last element in array b */

  /* Merge a and b, starting from the last element in each */
  while (indexA >= 0 && indexB >= 0) {
    if (a[indexA] > b[indexB]) { /* end of a is bigger than end of b */
      a[indexMerged] = a[indexA]; // copy element
      indexMerged--; // Move indices
      indexA--;
    } else {
      a[indexMerged] = b[indexB]; // Copy element
      indexMerged--; // move indices
      indexB--;
    }
  }

  /* Copy remaining elements from b into place */
  while (indexB >= 0) {
    a[indexMerged] = b[indexB];
    indexMerged--;
    indexB--;
  }
}

void main() {
  List<int> a = [1, 3, 4, 5, 6, 8, 10, 0, 0, 0, 0, 0];
  List<int> b = [4, 7, 9, 10, 12];
  merge(a, b, 7, 5);
  print(a);
}