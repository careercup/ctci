package Question9_8;

import java.util.Arrays;

public class Question {	
	public static int makeChange(int amount, int[] denoms, int index) {
		if (index >= denoms.length - 1) return 1; // one denom remaining -> one way to do it
		int denomAmount = denoms[index];
		int ways = 0;
		for (int i = 0; i * denomAmount <= amount; i++) {
			int amountRemaining = amount - i * denomAmount;
			ways += makeChange(amountRemaining, denoms, index + 1); // go to next denom
		}
		return ways;
	}
	
	public static int makeChange1(int n) {
		int[] denoms = {25, 10, 5, 1};
		return makeChange(n, denoms, 0);
	}

	public static int makeChange2(int n) {
		int[] denoms = {25, 10, 5, 1};
		int[][] map = new int[n + 1][denoms.length];
		return makeChange2(n, denoms, 0, map);
	}
	
	public static int makeChange2(int amount, int[] denoms, int index, int[][] map) {
		if (map[amount][index] > 0) { // retrieve value
			return map[amount][index];
		}
		if (index >= denoms.length - 1) return 1; // one denom remaining -> one way to do it
		int denomAmount = denoms[index];
		int ways = 0;
		for (int i = 0; i * denomAmount <= amount; i++) {
			// go to next denom, assuming i coins of denomAmount
			int amountRemaining = amount - i * denomAmount;
			ways += makeChange2(amountRemaining, denoms, index + 1, map);
		}
		map[amount][index] = ways;
		return ways;
	}	
	
	public static int makeChange(int n) {
		int x = makeChange1(n);
		int y = makeChange2(n);
		if (x != y) {
			System.out.println("Error: " + x + " " + y);
		}
		return x;
	}
	
	public static void main(String[] args) {
		for (int i = 0; i <= 100; i++) {
			System.out.println("makeChange(" + i + ") = " + makeChange(i));
		}
	}

}