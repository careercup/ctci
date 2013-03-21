package Introduction;

import CtCILibrary.AssortedMethods;

public class MergeSort {	
	public static void mergesort(int[] array, int low, int high) {
		if (low < high) {
			int middle = (low + high) / 2;
			mergesort(array, low, middle); // Sort left half
			mergesort(array, middle + 1, high); // Sort right half
			merge(array, low, middle, high); // Merge them
		}
	}

	public static void merge(int[] array, int low, int middle, int high) {
		int[] helper = new int[array.length];

		// Copy both halves into a helper array
		for (int i = low; i <= high; i++) {
			helper[i] = array[i];
		}

		int helperLeft = low;
		int helperRight = middle + 1;
		int current = low;
		
		// Iterate through helper array. Compare the left and right half, copying back the 
		// smaller element into the original array.
		while (helperLeft <= middle && helperRight <= high) {
			if (helper[helperLeft] <= helper[helperRight]) { // If left element is smaller than right element
				array[current] = helper[helperLeft];
				helperLeft++;
			} else { // If right element is smaller than left element
				array[current] = helper[helperRight];
				helperRight++;
			}
			current++;
		}
		
		/* We need to copy any remaining elements from the helper array into the original array. Note that
		 * either the left or right half may have remaining elements, but not both. If the left half has
		 * remaining elements, we copy them (as shown below). Any remaining right side elements are already
		 * in the right place in our array. To demonstrate this, imagine an array like 
		 * [1, 4, 5 |MIDPOINT| 2, 8, 9]. The last two elements of the helper array (8, 9) will
		 * already be in place in the original array. There is no need to copy them.
		 */
		int remaining = middle - helperLeft;
		for (int i = 0; i <= remaining; i++) {
			array[current + i] = helper[helperLeft + i];
		}
	}
	
	public static void main(String[] args) {
		int[] array = AssortedMethods.randomArray(20, 0, 19);
		int[] validate = new int[20];
		AssortedMethods.printIntArray(array);
		for (int i = 0; i < 20; i++) {
			validate[array[i]]++;
		}
		mergesort(array, 0, array.length - 1);
		for (int i = 0; i < 20; i++) {
			validate[array[i]]--;
		}		
		AssortedMethods.printIntArray(array);
		for (int i = 0; i < 20; i++) {
			if (validate[i] != 0 || (i < 19 && array[i] > array[i+1])) {
				System.out.println("ERROR");
			}
		}		
	}

}
