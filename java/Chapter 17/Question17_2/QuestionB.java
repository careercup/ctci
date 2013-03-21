package Question17_2;

import CtCILibrary.AssortedMethods;

public class QuestionB {

	enum Piece { Empty, Red, Blue };
	
	public enum Check {
		Row,
		Column,
		Diagonal,
		ReverseDiagonal
	}
	
	public static Piece getIthColor(Piece[][] board, int index, int var, Check check) {
		int N = board.length;
		if (check == Check.Row) {
			return board[index][var];
		} else if (check == Check.Column) {
			return board[var][index];
		} else if (check == Check.Diagonal) {
			return board[var][var];
		} else if (check == Check.ReverseDiagonal) {
			return board[N - 1 - var][var];
		}
		return Piece.Empty;
	}
	
	public static Piece getWinner(Piece[][] board, int fixed_index, Check check) {
		Piece color = getIthColor(board, fixed_index, 0, check);
		if (color == Piece.Empty) {
			return Piece.Empty;
		}
		for (int var = 1; var < board.length; var++) { 
			if (color != getIthColor(board, fixed_index, var, check)) {
				return Piece.Empty;
			}  
		}
		return color;
	}
	
	/* Only works for 3x3 board */
	public static Piece hasWon1(Piece[][] board) {
		for (int i = 0; i < board.length; i++) {
			if (board[i][0] != Piece.Empty && board[i][0] == board[i][1] && board[i][0] == board[i][2]) {
				return board[i][0];
			}
			if (board[0][i] != Piece.Empty && board[0][i] == board[1][i] && board[0][i] == board[2][i]) {
				return board[0][i];
			}
		}
		if (board[0][0] != Piece.Empty && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {
			return board[0][0];
		}
		if (board[2][0] != Piece.Empty && board[2][0] == board[1][1] && board[2][0] == board[0][2]) {
			return board[2][0];
		}
		return Piece.Empty;
	}	
	
	/* NxN board - prioritizes code reuse */
	public static Piece hasWon2(Piece[][] board) {
		int N = board.length;
		Piece winner = Piece.Empty;
		
		// Check rows and columns
		for (int i = 0; i < N; i++) {
			winner = getWinner(board, i, Check.Row);
			if (winner != Piece.Empty) {
				return winner;
			}
			
			winner = getWinner(board, i, Check.Column);
			if (winner != Piece.Empty) {
				return winner;
			}
		}	
		
		winner = getWinner(board, -1, Check.Diagonal);
		if (winner != Piece.Empty) {
			return winner;
		}
		
		// Check diagonal
		winner = getWinner(board, -1, Check.ReverseDiagonal);
		if (winner != Piece.Empty) {
			return winner;
		}	
		
		return Piece.Empty;
	}	
	
	/* NxN solution */
	public static Piece hasWon3(Piece[][] board) {
		int N = board.length;
		int row = 0;
		int col = 0;
		
		// Check rows
		for (row = 0; row < N; row++) {
			if (board[row][0] != Piece.Empty) {
				for (col = 1; col < N; col++) {
					if (board[row][col] != board[row][col-1]) {
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
			if (board[0][col] != Piece.Empty) {
				for (row = 1; row < N; row++) {
					if (board[row][col] != board[row-1][col]) {
						break;
					}
				}
				if (row == N) {
					return board[0][col];
				}
			}
		}
		
		// Check diagonal (top left to bottom right)
		if (board[0][0] != Piece.Empty) {
			for (row = 1; row < N; row++) {
				if (board[row][row] != board[row-1][row-1]) {
					break;
				}
			}
			if (row == N) {
				return board[0][0];
			}		
		}
		
		// Check diagonal (bottom left to top right)
		if (board[N-1][0] != Piece.Empty) {
			for (row = 1; row < N; row++) {
				if (board[N-row-1][row] != board[N-row][row-1]) {
					break;
				}
			}
			if (row == N) {
				return board[N-1][0];
			}	
		}
		
		return Piece.Empty;
	}
	
	/* Shortest of the NxN solutions */
	public static Piece hasWon4(Piece[][] board) {
		int N = board.length;
		int i, j;
		
		Piece[] pieces = {Piece.Red, Piece.Blue};
		for (Piece color : pieces) {
			// Check rows and columns
			for (i = 0; i < N; i++) {
				boolean maybe_column = true;
				boolean maybe_row = true;				
				for (j = 0; j < N; j++) {
					if (board[i][j] != color) { // row
						maybe_row = false;
					}
					if (board[j][i] != color) { // columns
						maybe_column = false;
					}
				}
				if (maybe_column || maybe_row) {
					return color;
				}
			}	
			
			// Check diagonals
			boolean maybe_diag1 = true;
			boolean maybe_diag2 = true;
			for (i = 0; i < N; i++) {
				if (board[i][i] != color) { // normal diag
					maybe_diag1 = false;
				}
				if (board[N-i-1][i] != color) { // reverse diag
					maybe_diag2 = false;
				}				
			}
			if (maybe_diag1 || maybe_diag2) {
				return color;
			}
		}
		return Piece.Empty;
	}
	
	public static Piece convertIntToPiece(int i) {
		if (i == 1) {
			return Piece.Blue;
		} else if (i == 2) {
			return Piece.Red;
		} else {
			return Piece.Empty;
		}
	}
	
	public static void main(String[] args) {
		for (int k = 0; k < 100; k++) {
			int N = 3;
			int[][] board_t = AssortedMethods.randomMatrix(N, N, 0, 2);
			Piece[][] board = new Piece[N][N];
			for (int i = 0; i < N; i++) {
				for (int j = 0; j < N; j++) {
					board[i][j] = convertIntToPiece(board_t[i][j]);
				}
			}
			//AssortedMethods.printMatrix(board_t);
			Piece p1 = hasWon1(board);
			Piece p2 = hasWon2(board);
			Piece p3 = hasWon3(board);
			Piece p4 = hasWon4(board);
			//System.out.println(p + " " + p2);
			if (p1 != p2 || p2 != p3 || p3 != p4) {
				System.out.println(p1 + " " + p2 + " " + p3 + " " + p4);
				AssortedMethods.printMatrix(board_t);
			}
		}
	}

}
