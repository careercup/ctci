import '../../utils/assorted_methods.dart';
bool findElement(List<List<int>> matrix, int elem) {
  int row = 0;
  int col = matrix[0].length - 1;
  while (row < matrix.length  && col >= 0) {
    if (matrix[row][col] == elem) {
      return true;
    } else if (matrix[row][col] > elem) {
      col--;
    } else {
      row++;
    }
  }

  return false;
}

void main() {

  int M = 10;
  int N = 5;
  List<List<int>> matrix = new List<List<int>>(M);
  for (int i = 0; i < M; i++) {
    matrix[i] = new List<int>(N);
    for (int j = 0; j < N; j++) {
      matrix[i][j] = 10 * i + j;
    }
  }

  printIntMatrix(matrix);

  for (int i = 0; i < M; i++) {
    for (int j = 0; j < M; j++) {
      int v = 10 * i + j;
      print("$v: ${findElement(matrix, v)}");
    }
  }
}