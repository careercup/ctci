import 'dart:math' as Math;
import 'minPQ.dart';
import 'maxPQ.dart';

// TODO: fix code, not working.

int maxHeapComparator(int o1, int o2) {
  if (o1 < o2) return 1;
  else if (o1 == o2) return 0;
  else return -1;
}

int minHeapComparator(int o1, int o2) {
  if (o1 > o2) return 1;
  else if (o1 == o2) return 0;
  else return -1;
}

MinPQ<int> minHeap;
MaxPQ<int> maxHeap;

void addNewNumber(int randomNumber) {
  /* Note: addNewNumber maintains a condition that maxHeap.size() >= minHeap.size() */
  if (maxHeap.size() == minHeap.size()) {
    if (!minHeap.isEmpty() &&
      randomNumber > minHeap.min()) {
      maxHeap.insert(minHeap.poll());
      minHeap.insert(randomNumber);
    } else {
      maxHeap.insert(randomNumber);
    }
  } else {
    if (randomNumber < maxHeap.max()) {
      minHeap.insert(maxHeap.poll());
      maxHeap.insert(randomNumber);
    } else {
      minHeap.insert(randomNumber);
    }
  }
}

double getMedian() {
  /* maxHeap is always at least as big as minHeap. So if maxHeap is empty, then
   * minHeap is also.
   */
  if (maxHeap.isEmpty()) {
    return 0.0;
  }

  if (maxHeap.size() == minHeap.size()) {
    return (minHeap.min() + maxHeap.max()) / 2;
  } else {
    /* If maxHeap and minHeap are of different sizes, then maxHeap must have one extra element.
     * Return maxHeap's top element.
     */
    return maxHeap.max().toDouble();
  }
}

void addNewNumberAndPrintMedian(int randomNumber) {
  addNewNumber(randomNumber);
  print("Random Number = ${randomNumber}");
  printMinHeapAndMaxHeap();
  print("Median = ${getMedian()}");
}

void printMinHeapAndMaxHeap() {
  List<int> minHeapArray = minHeap.toList().where((e)=>e!=null).toList();
  List<int> maxHeapArray = maxHeap.toList().where((e)=>e!=null).toList();

  print(minHeapArray);
  print(maxHeapArray);

  minHeapArray.sort(maxHeapComparator);
  maxHeapArray.sort(maxHeapComparator);
  StringBuffer sb = new StringBuffer();
  sb.write("MinHeap = ");
  for (int i = minHeapArray.length - 1; i >= 0; i--) {
    sb.write(" ${minHeapArray[i]}");
  }

  sb.write("\nMaxHeap = ");
  for (int i = 0; i < maxHeapArray.length; i++) {
    sb.write(" ${maxHeapArray[i]}");
  }
}

Math.Random rnd = new Math.Random();

void main() {
  int arraySize = 10;
  int range = 7;

  maxHeap = new MaxPQ.from(new List<int>.fixedLength(arraySize - arraySize ~/ 2, fill: 0), maxHeapComparator);
  minHeap = new MinPQ.from(new List<int>.fixedLength(arraySize - arraySize ~/ 2, fill: 0), minHeapComparator);

  for (int i = 0; i < arraySize; i++) {
    int randomNumber = (rnd.nextDouble() * (range + 1)).toInt();
    addNewNumberAndPrintMedian(randomNumber);
  }
}