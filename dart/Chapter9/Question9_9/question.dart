import 'dart:math';

int GRID_SIZE = 8;

/*
 * Check if (row1, column1) is a valid spot for a queen by checking
 * if there is a queen in the same column or diagonal. We don't need
 * to check it for queens in the same row because the calling
 * placeQueen only attempts to place one queen at a time. We know
 * this row is empty.
 */
bool checkValid(List<int> columns, int row1, int column1) {

  for(int row2 = 0; row2 < row1; row2++) {
    int column2 = columns[row2];
    /* Check if (row2, column2) invalidates (row1, column1) as a queen spot */

    /* Check if rows have a queen in the same column */
    if (column1 == column2) {
      return false;
    }

    /* Check diagonals: if the distance between the columns equals the distance
     * between the rows, then they're in the same diagonal.
     */
    int columnDistance = (column2 - column1).abs();
    int rowDistance = row1 - row2; // row1 > row2, so no need to use absolute value
    if (columnDistance == rowDistance) {
      return false;
    }
  }
  return true;
}

void placeQueens(int row, List<int> columns, List<List<int>> results) {
  if (row == GRID_SIZE) { // Found valid placement
    results.add(new List.from(columns));
  } else {
    for (int col = 0; col < GRID_SIZE; col++) {
      if (checkValid(columns, row, col)) {
        columns[row] = col; // Place queen
        placeQueens(row + 1, columns, results);
      }
    }
  }
}

void clear(List<int> columns) {
  for (int i = 0; i < GRID_SIZE; i++) {
    columns[i] = -1;
  }
}

void printBoard(List<int> columns) {
  print("-----------------");
  StringBuffer sb = new StringBuffer();
  for (int i = 0; i < GRID_SIZE; i++) {
    sb.write("|");
    for (int j = 0; j < GRID_SIZE; j++) {
      if (columns[i] == j) {
        sb.write("Q|");
      } else {
        sb.write(" |");
      }
    }
    print(sb.toString());
    sb.clear();
    print("-----------------");
  }
  print("");
}

bool equals(List<int> first, List<int> second) {
  for (int k = 0; k < GRID_SIZE; k++) {
    if (first[k] != second[k]) {
      return false;
    }
  }
  return true;
}

bool isUnique(List<List<int>> boards, int index) {
  List<int> first = boards[index];
  for (int i = 0; i < index; i++) {
    List<int> second = boards[i];
    if (equals(first, second)) {
      return false;
    }
  }

  return true;
}

void checkBoard(List<int> columnsForRow) {
  for (int i = 0; i < GRID_SIZE; i++) {}
}

void printBoards(List<List<int>> boards) {
  for (int i = 0; i < boards.length; i++) {
    List<int> board = boards[i];
    printBoard(board);
  }
}

void main() {
  List<List<int>> results = new List<List<int>>();
  List<int> columns = new List<int>(GRID_SIZE);
  clear(columns);
  placeQueens(0, columns, results);
  printBoards(results);
  print(results.length);

}