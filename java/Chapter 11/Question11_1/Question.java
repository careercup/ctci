package Question11_1;

import CtCILibrary.AssortedMethods;

public class Question {


	/** Merges array
	 * @param a first array
	 * @param b second array
	 * @param lastA number of "real" elements in a
	 * @param lastB number of "real" elements in b
	 */
	public static void merge(int[] a, int[] b, int lastA, int lastB) {
		int indexMerged = lastB + lastA - 1; /* Index of last location of merged array */
		int indexA = lastA - 1; /* Index of last element in array b */
		int indexB = lastB - 1; /* Index of last element in array a */
	
		/* Merge a and b, starting from the last element in each */
		while (indexA >= 0 && indexB >= 0) {
			if (a[indexA] > b[indexB]) { /* end of a is bigger than end of b */
				a[indexMerged] = a[indexA]; // copy element
				indexMerged--; // move indices
				indexA--; 
			} else {
				a[indexMerged] = b[indexB]; // copy element
				indexMerged--; // move indices
				indexB--;
			}
		}
		
		/* Copy remaining elements from b into place */
		while (indexB >= 0) {
			a[indexMerged] = b[indexB];
			indexMerged--;
			indexB--;
		}
	}
	
	public static void main(String[] args) {
		int[] a = {1, 3, 4, 5, 6, 8, 10, 0, 0, 0, 0, 0};
		int[] b = {4, 7, 9, 10, 12};
		merge(a, b, 7, 5);
		System.out.println(AssortedMethods.arrayToString(a));
	}

}
