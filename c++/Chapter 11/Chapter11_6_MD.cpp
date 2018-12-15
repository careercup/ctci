// Program: Finding a number in a matrix ordered in ascendent order by row and by column;
//

#include "stdafx.h"
#include <iostream>
#include <algorithm>
#include <cmath>
#include <string>
#include <vector>

using namespace std;
#define MAX_ELEMENTS 4

int matrix[MAX_ELEMENTS][MAX_ELEMENTS] = {
	{ 1, 5,   8, 11 },
	{ 2, 7,  10, 13 },
	{ 3, 9,  12, 15 },
	{ 4, 11, 14, 17 } };

bool findNumInMatrix(int matrix[MAX_ELEMENTS][MAX_ELEMENTS], int size, int x) {
	int row = 0;
	int column = size - 1;
	while (row < size && column >= 0) {
		int value = matrix[row][column];
		if (value == x) {
			return true; // found
		}
		//cout << "\t" << x;
		if (value < x) {
			++row; // try a row with greater values
			//cout << " > " << value << " going to next row" << endl;
		}
		else if (value > x) {
			--column; // try a column with minor values
			//cout << " < " << value << " going to previous column" << endl;
		}
	}
	return false;
}

void evaluate(int values[], int length) {
	for (int ind = 0; ind < length; ++ind)
		cout << "Value \'" << values[ind] << "\': " <<
		(findNumInMatrix(matrix, MAX_ELEMENTS, values[ind]) ? "Found" : "Not found") << endl;
}

int main() {
	int values[6] = { 12, 17, 20, 0, 11, 4 };
	evaluate(values, 6);
	return 0;
}

