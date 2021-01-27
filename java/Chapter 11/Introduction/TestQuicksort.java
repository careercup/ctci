package Introduction;

import static org.junit.jupiter.api.Assertions.*;
import static org.junit.Assert.assertArrayEquals;
import org.junit.jupiter.api.Test;


class TestQuicksort {

	@Test
	void test1() {
		Quicksort quicksort1 = new Quicksort();
		int[] arr1 = {0,9,8,1};
		assertArrayEquals({0,1,8,9},quicksort1.quickSort(arr1, 0, 3));
		
		
	}
	
	@Test
	void test2() {
		Quicksort quicksort2 = new Quicksort();
		int[] arr2 = {3,0,7,-2,1};
		assertArrayEquals({-2,0,1,3,7},quicksort2.quickSort(arr2, 0, 4));
		
		
	}

	@Test
	void test3() {
		Quicksort quicksort3 = new Quicksort();
		int[] arr3 = {-6,2,0};
		assertArrayEquals({-6,0,2},quicksort3.quickSort(arr3, 0, 2));
		
		
	}

	@Test
	void test4() {
		Quicksort quicksort4 = new Quicksort();
		int[] arr4 = {-4,-5,0,7,1,-8};
		assertArrayEquals({-8,-5,-4,0,1,7},quicksort4.quickSort(arr4, 0, 5));
		
		
	}

	@Test
	void test5() {
		Quicksort quicksort5 = new Quicksort();
		int[] arr5 = {-8,-3,2,0};
		assertArrayEquals({-8,-3,0,2},quicksort5.quickSort(arr5, 0, 3));
		
		
	}

	
}
