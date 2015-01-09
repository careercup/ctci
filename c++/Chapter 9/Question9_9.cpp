//()r=y&5#R
#include <iostream>
#include <vector>
#include <cmath>
using namespace std;

#define GRID_SIZE 8
typedef vector<vector<int> > vi;

// To check if Queen palced is in valid spot in comaparison to previous one
bool checkValid(vector<int> coloums, int row1, int col1) {
	for (int row2 = 0; row2 < row1; ++row2) {
		int col2 = coloums[row2];
		if (col1 == col2)
			return false;
		int rowDist = row1 - row2;
		int colDist = abs(col1 - col2);
		if (rowDist == colDist)
			return false;
	}
	return true;
}

void placeQueens(int row, vector<int> &colums, vi &result){
	if (row == GRID_SIZE)	//Placed all Queens
		result.push_back(colums);
	else {
		for (int col = 0; col < GRID_SIZE; ++col) {
			if (checkValid(colums, row, col)) {
				colums[row] = col;		//Place Queen
				placeQueens(row+1, colums, result);
			}
		}
	}
}

int main(){
	vi v;
	vector<int> colums;
	colums.resize(8);
	placeQueens(0, colums, v);
	for (int i = 0; i < v.size(); ++i) {
		for (int j = 0; j < GRID_SIZE; ++j) {
			cout<<v[i][j]<<" ";
		}
		cout<<'\n';
	}
	return 0;
}

