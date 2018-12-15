// Conversion: write a function to determine the number of bits you would need
// to flip the convert integer A to interget B.
// Example: 29 (11101) to 15 (01111) = 2

// #include "stdafx.h"
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

int numberOfFlips(int A, int B) {
	int bitIndex = 0;
	int flips = 0;
	int numBits = std::max(ceil(log2(A)), ceil(log2(B)));
	for (int i = 0; i < numBits; ++i) {
		int a = A & (1 << i);
		int b = B & (1 << i);
		if (a != b)
			++flips;
	}
	return flips;
}

int main() {
	cout << numberOfFlips(29, 15) << endl;
	return EXIT_SUCCESS;
}

