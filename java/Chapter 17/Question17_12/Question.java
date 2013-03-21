package Question17_12;

import java.util.Arrays;

public class Question {	
	public static void printPairSums(int[] array, int sum) {
		Arrays.sort(array);
		int first = 0;
		int last = array.length - 1;
		while (first < last) {
			int s = array[first] + array[last];
			if (s == sum) {
				System.out.println(array[first] + " " + array[last]);
				++first;
				--last;
			} else {
				if (s < sum) {
					++first;
				} else {
					--last;
				}
			}
		}
	}
	
	public static void main(String[] args) {
		int[] test = {9, 3, 6, 5, 7, -1, 13, 14, -2, 12, 0};
		printPairSums(test, 12);
	}
}
