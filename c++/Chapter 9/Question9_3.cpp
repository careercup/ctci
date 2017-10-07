#include <iostream>
using namespace std;

//For distinct and sorted array
int findMagicIndex(int arr[], int startInd, int endInd){
	if(endInd < startInd)
		return -1;
	int midInd = startInd + (endInd - startInd)/2;
	if(arr[midInd] > midInd)
		return findMagicIndex(arr, startInd, midInd);
	else if(arr[midInd] < midInd)
		return findMagicIndex(arr, midInd+1, endInd);
	else
		return midInd;
}

//For non-distinct and sorted array
int findMagicIndex1(int arr[], int startInd, int endInd){
	if(endInd < startInd)
		return -1;
	int midInd = startInd + (endInd - startInd)/2;
	if (arr[midInd] == midInd)
		return midInd;

	//Left search
	int leftInd = min(arr[midInd], midInd-1);
	int left = findMagicIndex1(arr, startInd, leftInd);
	if(left > -1)
		return left;

	//right search
	int rightInd = max(arr[midInd], midInd+1);
	int right = findMagicIndex1(arr, rightInd, endInd);
	if(right > -1)
		return right;
}

int main(){
	int arr[] = {-40, -30, -1, 1, 2, 3, 5, 7, 9, 12, 13};
	cout<<findMagicIndex(arr, 0, 10)<<'\n';

	int arr1[] = {-10, -5, 2, 2, 2, 3, 4, 8, 9, 12, 13};
	cout<<findMagicIndex1(arr1, 0, 10);
	return 0;
}