// Conversion: write a function to determine the number of bits you would need
// to flip the convert integer A to interget B.
// Example: 29 (11101) to 15 (01111) = 2

//#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <cmath>
#include <string>
#include <vector>
#include <unordered_map>
#include <memory>
#include <set>
#include <algorithm>

using namespace std;

void mergeSortedArrays(int arrayA[], size_t lenA, int arrayB[], size_t lenB) {
	size_t totalLength = lenA + lenB;
	--lenA;
	--lenB;
	for (size_t i = totalLength - 1; i >= 0 && i < totalLength; --i) {
		if (arrayA[lenA] > arrayB[lenB]) {
			arrayA[i] = arrayA[lenA--];
		} else {
			arrayA[i] = arrayB[lenB--];
		}
	}
}

void printArray(int arr[], size_t len) {
	for (int i = 0; i < len; ++i) {
		cout << arr[i] << ", ";
	}
	cout << endl;
}

int main() {
	int a[15] = { 1,2,3,7,8,9,12 };
	int b[] = { 3,4,5, 6,10,11 };
	int lenA = 7, lenB = sizeof(b) / sizeof(int);
	printArray(a, lenA);
	printArray(b, lenB);

	mergeSortedArrays(a, lenA, b, lenB);
	printArray(a, lenA+lenB);

	return EXIT_SUCCESS;
}

