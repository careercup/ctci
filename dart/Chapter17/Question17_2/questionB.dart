import '../../utils/assorted_methods.dart';

class Piece {
  static final int Empty = 0;
  static final int Red = 1;
  static final int Blue = 2;
  int value;
  Piece(this.value);
  toString() {
    return "$value";
  }
}

class Check {
  static final int Row = 0;
  static final int Column = 1;
  static final int Diagonal = 2;
  static final int ReverseDiagonal = 3;
  int value;
  Check(this.value);
  toString() {
    return "$value";
  }
}

Piece getIthColor(List<List<Piece>> board, int index, int v, Check check) {
  int N = board.length;
  if (check.value == Check.Row) {
    return board[index][v];
  } else if (check.value == Check.Column) {
    return board[v][index];
  } else if (check.value == Check.Diagonal) {
    return board[v][v];
  } else if (check.value == Check.ReverseDiagonal) {
    return board[N - 1 - v][v];
  }

  return new Piece(Piece.Empty);
}

Piece getWinner(List<List<Piece>> board, int fixed_index, Check check) {
  Piece color = getIthColor(board, fixed_index, 0, check);
  if (color.value == Piece.Empty) {
    return new Piece(Piece.Empty);
  }

  for (int v = 1; v < board.length; v++) {
    if (color != getIthColor(board, fixed_index, v, check)) {
      return new Piece(Piece.Empty);
    }
  }

  return color;
}

/* Only works for 3x3 board */
Piece hasWon1(List<List<Piece>> board) {
  for (int i = 0; i < board.length; i++) {
    if (board[i][0].value != Piece.Empty && board[i][0].value == board[i][1].value && board[i][0].value == board[i][2].value) {
      return board[i][0];
    }

    if (board[0][i].value != Piece.Empty && board[0][i].value == board[1][i].value && board[0][i].value == board[2][i].value) {
      return board[0][i];
    }
  }

  if (board[0][0].value != Piece.Empty && board[0][0].value == board[1][1].value && board[0][0].value == board[2][2].value) {
    return board[0][0];
  }

  if (board[2][0].value != Piece.Empty && board[2][0].value == board[1][1].value && board[2][0].value == board[0][2].value) {
    return board[2][0];
  }

  return new Piece(Piece.Empty);
}

Piece hasWon2(List<List<Piece>> board) {
  int N = board.length;
  Piece winner = new Piece(Piece.Empty);

  // Check rows and columns
  for (int i = 0; i < N; i++) {
    winner = getWinner(board, i, new Check(Check.Row));
    if (winner.value != Piece.Empty) {
      return winner;
    }

    winner = getWinner(board, i, new Check(Check.Column));
    if (winner.value != Piece.Empty) {
      return winner;
    }
  }

  winner = getWinner(board, -1, new Check(Check.Diagonal));
  if (winner.value != Piece.Empty) {
    return winner;
  }

  // Check diagonal
  winner = getWinner(board, -1, new Check(Check.ReverseDiagonal));
  if (winner.value != Piece.Empty) {
    return winner;
  }

  return new Piece(Piece.Empty);
}

Piece hasWon3(List<List<Piece>> board) {
  int N = board.length;
  int row = 0;
  int col = 0;

  // Check rows
  for (row = 0; row < N; row++) {
    if (board[row][0] != Piece.Empty) {
      for (col = 1; col < N; col++) {
        if (board[row][col].value != board[row][col - 1].value) {
          break;
        }
      }
      if (col == N) {
        return board[row][0];
      }
    }
  }

  // Check columns
  for (col = 0; col < N; col++) {
    if (board[0][col].value != Piece.Empty) {
      for (row = 1; row < N; row++) {
        if (board[row][col].value != board[row - 1][col].value) {
          break;
        }
      }
      if (row == N) {
        return board[0][col];
      }
    }
  }

  // Check diagonal (top left to bottom right)
  if (board[0][0].value != Piece.Empty) {
    for (row = 1; row < N; row++) {
      if (board[row][row].value != board[row - 1][row - 1].value) {
        break;
      }
    }

    if (row == N) {
      return board[0][0];
    }
  }

  // Check diagonal (bottom left to top right)
  if (board[N - 1][0].value != Piece.Empty) {
    for (row = 1; row < N; row++) {
      if (board[N - row - 1][row].value != board[N - row][row - 1].value) {
        break;
      }
    }
    if (row == N) {
      return board[N - 1][0];
    }
  }

  return new Piece(Piece.Empty);
}

/* Shortest of the NxN solutions */
Piece hasWon4(List<List<Piece>> board) {
  int N = board.length;
  int i, j;

  List<Piece> pieces = [new Piece(Piece.Red), new Piece(Piece.Blue)];
  for (Piece color in pieces) {
    // Check rows and columns
    for (i = 0; i < N; i++) {
      bool maybe_column = true;
      bool maybe_row = true;
      for (j = 0; j < N; j++) {
        if (board[i][j].value != color.value) { // row
          maybe_row = false;
        }
        if (board[j][i].value != color.value) { // columns
          maybe_column = false;
        }
      }
      if (maybe_column || maybe_row) {
        return color;
      }
    }

    // Check diagonals
    bool maybe_diag1 = true;
    bool maybe_diag2 = true;
    for (i = 0; i < N; i++) {
      if (board[i][i].value != color.value) { // normal diag
        maybe_diag1 = false;
      }

      if (board[N - i - 1][i].value != color.value) { // reverse diag
        maybe_diag2 = false;
      }
    }

    if (maybe_diag1 || maybe_diag2) {
      return color;
    }
  }

  return new Piece(Piece.Empty);
}

Piece convertIntToPiece(int i) {
  if (i == 1) {
    return new Piece(Piece.Blue);
  } else if (i == 2) {
    return new Piece(Piece.Red);
  } else {
    return new Piece(Piece.Empty);
  }
}

void main() {
  for (int k = 0; k < 100; k++) {
    int N = 3;
    List<List<int>> board_t = randomMatrix(N, N, 0, 2);
    List<List<Piece>> board = new List<List<Piece>>.fixedLength(N, fill: new List<Piece>.fixedLength(N));

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < N; j++) {
        board[i][j] = convertIntToPiece(board_t[i][j]);
      }
    }

    // printMatrix(board_t);
    Piece p1 = hasWon1(board);
    Piece p2 = hasWon2(board);
    Piece p3 = hasWon3(board);
    Piece p4 = hasWon4(board);

    if (p1.value != p2.value || p2.value != p3.value || p3.value != p4.value) {
      print("$p1 $p2 $p3 $p4");
      printIntMatrix(board_t);
    }
  }

}