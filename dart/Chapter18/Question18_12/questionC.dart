import 'dart:math' as Math;
import '../../utils/assorted_methods.dart';

void clearArray(List<int> array) {
  for (int i = 0; i < array.length; i++) {
    array[i] = 0;
  }
}

int maxSubMatrix(List<List<int>> matrix) {
  int rowCount = matrix.length;
  int colCount = matrix[0].length;

  List<int> partialSum = new List<int>(colCount);
  int maxSum = 0; // Max sum is an empty matrix

  for (int rowStart = 0; rowStart < rowCount; rowStart++) {
    clearArray(partialSum);

    for (int rowEnd = rowStart; rowEnd < rowCount; rowEnd++) {
      for (int i = 0; i < colCount; i++) {
        partialSum[i] += matrix[rowEnd][i];
      }

      int tempMaxSum = maxSubArray(partialSum, colCount);

      // if you want to track the coordinates, add code here to do that
      maxSum = Math.max(maxSum, tempMaxSum);
    }
  }

  return maxSum;
}

int maxSubArray(List<int> array, int N) {
  int maxSum = 0;
  int runningSum = 0;

  for(int i = 0; i < N; i++) {
    runningSum += array[i];
    maxSum = Math.max(maxSum, runningSum);

    /*
     * If running_sum is < 0 no point in trying to contuine the
     * series. Reset.
     */
    if (runningSum < 0) {
      runningSum = 0;
    }
  }

  return maxSum;
}

void main() {
  List<List<int>> matrix = randomMatrix(5, 7, -100, 100);
  int sum = maxSubMatrix(matrix);
  printIntMatrix(matrix);
  print(sum);
}

