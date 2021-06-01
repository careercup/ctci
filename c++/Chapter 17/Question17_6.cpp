#include <iostream>
#include <algorithm>

using namespace std;

#define SIZE 13

// declarations

void find_unsorted_sequence(int*, int);
int shrink_left(int*, int, int);
int shrink_right(int*, int, int, int);
int find_end_left_subseq(int*, int);
int find_start_right_subseq(int*, int);
bool validate(int*, int, int, int);

// definitions

void find_unsorted_sequence(int* arr, int size) {

	// finding the end left and start right
	int end_left = find_end_left_subseq(arr, size);
	if (end_left > size) return;

	int start_right = find_start_right_subseq(arr, size);

	// now finding the min and max indices
	int max_ind = end_left, min_ind = start_right;
	for (int i=min_ind; i<=max_ind; i++) {
		if (arr[i] > arr[max_ind]) max_ind = i;
		if (arr[i] < arr[min_ind]) min_ind = i;
	}

	/* Now start sliding left and right until
	   1. left is less than arr[min_ind]
	   2. right is greater than arr[max_index] 
	*/

	int left_ind = shrink_left(arr, min_ind, end_left);
	int right_ind = shrink_right(arr, max_ind, start_right, size);

	/* Now validating if the indices are correct */ 
	if (validate(arr, left_ind, right_ind, size)) {
		cout << "Unsorted sequence is available with" << " left index = " << left_ind << " and right_ind = " << right_ind << endl;
	}
	else {
		cout << "Unsorted sequence is not available." << endl;
	}
}

int shrink_left(int* arr, int min_ind, int end_left) {
	int compare_value = arr[min_ind];
	for (int i=end_left-1; i>=0; i--) {
		if (arr[i] <= compare_value) {
			return (i+1);
		}
	}
	return 0;
}

int shrink_right(int* arr, int max_ind, int start_right, int size) {
	int compare_value = arr[max_ind];
	for (int i=start_right; i<size; i++) {
		if (compare_value <= arr[i]) {
			return (i-1);
		}
	}
	return (size-1);
}

int find_end_left_subseq(int* arr, int size) {
	for (int i=0; i<size; i++) {
		if (arr[i+1] < arr[i]) {
			return i;
		}
	}
	return (size-1);
}

int find_start_right_subseq(int* arr, int size) {
	for (int i=size-1; i>=0; i--) {
		if (arr[i-1] > arr[i]) {
			return i;
		}
	}
	return 0;
}

bool validate(int* arr, int left_ind, int right_ind, int size) {

	// create a new array and fill it
	int* ans = new int[right_ind - left_ind + 1];
	for (int i=left_ind; i<=right_ind; i++) {
		ans[i - left_ind] = arr[i];
	}

	// sort the array
	sort(ans, ans + (right_ind - left_ind + 1));

	// putting the array back in the original array
	for (int i=left_ind; i<=right_ind; i++) {
		arr[i] = ans[i - left_ind];
	}

	// now check the complete array
	for (int i=1; i<size; i++) {
		if (arr[i] < arr[i-1]) {
			return false;
		}
	}

	return true;
}

int main() {

	int arr[SIZE] = {1, 2, 4, 7, 10, 11, 8, 12, 5, 7, 16, 18, 19};

	find_unsorted_sequence(arr, SIZE);

	return 0;
}


/*

Commands to run
----------------

g++ -std=c++11 Question17_6.cpp -o Question17_6
./Question17_6

*/