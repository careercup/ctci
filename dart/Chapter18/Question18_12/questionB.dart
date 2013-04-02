import '../../utils/assorted_methods.dart';

int getMaxMatrix(List<List<int>> original) {
  int maxArea = -0xfffffffff; // Important! Max could be < 0
  int rowCount = original.length;
  int columnCount = original[0].length;

  List<List<int>> matrix = precomputeMatrix(original);
  for (int row1 = 0; row1 < rowCount; row1++) {
    for (int row2 = row1; row2 < rowCount; row2++) {
      for (int col1 = 0; col1 < columnCount; col1++) {
        for (int col2 = col1; col2 < columnCount; col2++) {
          int sum = computeSum(matrix, row1, row2, col1, col2);
          if (sum > maxArea) {
            print("New Max of $sum: (rows $row1 to $row2) and (columns $col1 to $col2)");
            maxArea = sum;
          }
        }
      }
    }
  }

  return maxArea;
}

List<List<int>> precomputeMatrix(List<List<int>> matrix) {
  List<List<int>> sumMatrix = new List<List<int>>(matrix.length);

  for (int i = 0; i < matrix.length; i++) {
    sumMatrix[i] = new List<int>.fixedLength(matrix[0].length, fill: 0);
  }

  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
      if (i == 0 && j == 0) { // first cell
        sumMatrix[i][j] = matrix[i][j];
      } else if (j == 0) { // cell in first column
        sumMatrix[i][j] = sumMatrix[i - 1][j] + matrix[i][j];
      } else if (i == 0) { // cell in first row
        sumMatrix[i][j] = sumMatrix[i][j - 1] + matrix[i][j];
      } else {
        sumMatrix[i][j] = sumMatrix[i - 1][j] + sumMatrix[i][j - 1] -
            sumMatrix[i - 1][j - 1] + matrix[i][j];
      }
    }
  }

  return sumMatrix;
}

int computeSum(List<List<int>> sumMatrix, int i1, int i2, int j1, int j2) {
  if (i1 == 0 && j1 == 0) { // starts at row 0, column 0
    return sumMatrix[i2][j2];
  } else if (i1 == 0) { // starts at row 0
    return sumMatrix[i2][j2] - sumMatrix[i2][j1 - 1];
  } else if (j1 == 0) { // starts at column 0
    return sumMatrix[i2][j2] - sumMatrix[i1 - 1][j2];
  } else {
    return sumMatrix[i2][j2] - sumMatrix[i2][j1 - 1] - sumMatrix[i1 - 1][j2] + sumMatrix[i1 -1][j1 -1];
  }
}

void main() {
  List<List<int>> matrix = randomMatrix(10, 10, -5, 5);
  //List<List<int>> matrix = randomMatrix(3, 3, -7, 5);
  printIntMatrix(matrix);
  print(getMaxMatrix(matrix));
}