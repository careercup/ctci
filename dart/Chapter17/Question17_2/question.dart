int convertBoardToInt(List<List<String>> board) {
  int factor = 1;
  int sum = 0;
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[i].length; j++) {
      int v = 0;
      if (board[i][j] == 'x') {
        v = 1;
      } else if (board[i][j] == 'o') {
        v = 2;
      }

      sum += v * factor;
      factor *= 3;
    }
  }

  return sum;
}

void main() {
  List<List<String>> board = [
                              ['x', 'x', 'o'],
                              [' ', 'x', ' '],
                              [' ', ' ', 'x']
                              ];
  int v = convertBoardToInt(board);
  print(v);
}