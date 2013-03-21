package Question9_8;

public class Question {
	public static int makeChange2(int n, int[] denoms, int k) {
		if (k + 1 >= denoms.length) return 1;
		int ways = 0;
		for (int i = 0; i * denoms[k] <= n; i++) {
			ways += makeChange2(n - i * denoms[k], denoms, k + 1);
		}
		return ways;
	}	
	
	public static int makeChange(int n, int denom) {
		int next_denom = 0;
		switch (denom) {
		case 25:
			next_denom = 10;
			break;
		case 10:
			next_denom = 5;
			break;
		case 5:
			next_denom = 1;
			break;
		case 1:
			return 1;
		}
		int ways = 0;
		for (int i = 0; i * denom <= n; i++) {
			ways += makeChange(n - i * denom, next_denom);
		}
		return ways;
	}
	
	public static int makeChange(int n) {
		int[] denoms = {25, 10, 5, 1};
		int x = makeChange2(n, denoms, 0);
		int y = makeChange(n, 25);
		if (x != y) {
			System.out.println("Error: " + x + " " + y);
		}
		return x;
	}
	
	public static void main(String[] args) {
		for (int i = 100; i <= 100; i++) {
			System.out.println("makeChange(" + i + ") = " + makeChange(i));
		}
	}

}