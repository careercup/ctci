package Question18_6;

import java.util.Arrays;

import CtCILibrary.AssortedMethods;

public class QuestionC {

	public static int rankB(int[] array, int rank) {
		int[] cloned = array.clone();
		Arrays.sort(cloned);
		return cloned[rank];
	}
	
	public static void swap(int[] array, int i, int j) {
		int t = array[i];
		array[i] = array[j];
		array[j] = t;
	}
	
	public static boolean validate(int[] array, int left, int right, int pivot, int endLeft) {
		for (int i = left; i <= endLeft; i++) {
			if (array[i] > pivot) {
				return false;
			}
		}
		for (int i = endLeft + 1; i <= right; i++) {
			if (array[i] <= pivot) {
				return false;
			}
		}
		return true;
	}
	
	public static boolean validateFull(int[] array) {
		for (int i = 0; i < array.length; i++) {
			for (int j = i; j < array.length; j++) {
				for (int k = i; k <= j; k++) {
					int[] cloned = array.clone();
					int pivot = array[k];
					int p = partition(cloned, i, j, pivot);
					if (!validate(cloned, i, j, pivot, p)) {
						AssortedMethods.printIntArray(cloned);
						String val = p >= 0 && p < cloned.length ? String.valueOf(array[i]) : "?"; 
						System.out.println("pivot: " + pivot + " | " + p + " | " + val);
						return false;
					}
				}
			}
		}		
		return true;
	}
	
	public static boolean isUnique(int[] array) {
		int[] cloned = array.clone();
		Arrays.sort(cloned);
		for (int i = 1; i < cloned.length; i++) {
			if (cloned[i] == cloned[i - 1]) {
				return false;
			}
		}
		return true;
	}
	
	public static int max(int[] array, int left, int right) {
		int max = Integer.MIN_VALUE;
		for (int i = left; i <= right; i++) {
			max = Math.max(array[i], max);
		}
		return max;
	}
	
	public static int randomInt(int n) {
		return (int) (Math.random() * n);
	}
	
	public static int randomIntInRange(int min, int max) {
		return randomInt(max + 1 - min) + min;
	}
	
	public static int partition(int[] array, int left, int right, int pivot) {
		while (true) {
			while (left <= right && array[left] <= pivot) {
				left++;
			}
			
			while (left <= right && array[right] > pivot) {
				right--;
			}
			
			if (left > right) {
				return left - 1;
			} 
			swap(array, left, right);
		}
    }	
	
	public static int rank(int[] array, int left, int right, int rank) {
		int pivot = array[randomIntInRange(left, right)];
		int leftEnd = partition(array, left, right, pivot); // returns end of left partition
		int leftSize = leftEnd - left + 1;
		if (leftSize == rank + 1) {
			return max(array, left, leftEnd);
		} else if (rank < leftSize) {
			return rank(array, left, leftEnd, rank);
		} else {
			return rank(array, leftEnd + 1, right, rank - leftSize);
		}
	}
	

	public static void main(String[] args) {
		int numberOfTests = 1000;
		int count = 0;
		while (count < numberOfTests) {
			int[] array = AssortedMethods.randomArray(10, -1000, 1000);
			if (isUnique(array)) {
				int n = AssortedMethods.randomIntInRange(0, array.length - 1);
				int rank1 = rank(array.clone(), 0, array.length - 1, n);
				int rank2 = rankB(array.clone(), n);
				
				if (rank1 != rank2) {
					System.out.println("ERROR: " + rank1 + " " + rank2);
					AssortedMethods.printIntArray(array);
				}
				count++;
			}
		}
		System.out.println("Completed " + count + " runs.");
	}

}
