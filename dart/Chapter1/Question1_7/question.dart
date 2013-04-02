/*
 * Write an algorithm such that if an element in an MxN matrix is 0,
 * its entire row and column are set to 0.
 */
import '../../utils/assorted_methods.dart';
void setZeros(List<List<int>> matrix) {
  List<bool> row = new List<bool>(matrix.length);
  List<bool> column = new List<bool>(matrix[0].length);

  // Dart does not default to false.
  for (int i = 0; i < row.length; i++) {
    row[i] = false;
  }
  for (int i = 0; i < column.length; i++) {
    column[i] = false;
  }

  // Store the row and column index with value 0
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      if (matrix[i][j] == 0) {
        row[i] = true;
        column[j] = true;
      }
    }
  }

  // Set arr[i][j] to 0 if either row i or column j has a 0
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[0].length; j++) {
      if (row[i] || column[j]) {
        matrix[i][j] = 0;
      }
    }
  }
}

void main() {
  List<List<int>> matrix = randomMatrix(3, 5, 0, 5);
  printIntMatrix(matrix);
  setZeros(matrix);
  print("\n");
  printIntMatrix(matrix);
}