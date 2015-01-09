#include <iostream>
using namespace std;

template <class T>
void Swap(T &a, T &b){
	T tmp = a;
	a = b;
	b = tmp;
}

// Runtime average and worst case O(n2). Memory O(1)
template <class U>
void bubbleSort(U &arr, int low, int high){
	if (high <= low) {
		return;
	}
	int noOfElements = high - low + 1;
	for (int i = 0; i < noOfElements-1; ++i) {
		for (int j = low; j < high; ++j) {
			if (int(arr[j]) > int(arr[j+1])) {
				Swap(arr[j], arr[j+1]);
			}
		}
	}
}

// Runtime average and worst case O(n2). Memory O(1)
void selectionSort(int arr[], int low, int high){
	if (high <= low) {
		return;
	}
	int noOfElements = high - low + 1;
	for (int i = 0; i < noOfElements-1; ++i) {
		int minIndex = low+i;
		for (int j = i+low; j <= high; ++j) {
			if (arr[minIndex] > arr[j]) {
				minIndex = j;
			}
		}
		Swap(arr[i+low], arr[minIndex]);
	}
}

// Runtime average and worst case O(n log(n)). Memory Depends
void merge(int arr[], int low, int middle, int high){
	int helper[high-low+1];
	for (int i = low; i <= high; ++i) {
		helper[i-low] = arr[i];
	}
	int i=low, j=middle+1, k=low;
	while(i<=middle and j<=high){
		if (helper[i-low] < helper[j-low]) {
			arr[k] = helper[i-low];
			i++;
		}
		else {
			arr[k] = helper[j-low];
			j++;
		}
		k++;
	}
	if (i>middle) {
		for (; j <= high; ++j) {
			arr[k] = helper[j-low];
			k++;
		}
	}
	else {
		for (; i <= middle; ++i) {
			arr[k] = helper[i-low];
			k++;
		}
	}
}

void mergeSort(int arr[], int low, int high){
	if (high <= low) {
		return;
	}
	int noOfElements = high - low + 1;
	int middleElement = (high+low)/2;
	mergeSort(arr, low, middleElement);
	mergeSort(arr, middleElement+1, high);
	merge(arr, low, middleElement, high);
}

// Runtime average: O(n log(n)) and worst case O(n2). Memory O(log(n))
int partition(int arr[], int low, int high) {
	int pivot = arr[int((low+high)/2)];
	while(low <= high) {
		while(arr[low] < pivot)
			low++;
		while(arr[high] > pivot) 
			high--;
		if(low <= high) {
			Swap(arr[low], arr[high]);
			low++;
			high--;
		}
	}
	return low;
}

void quickSort(int arr[], int low, int high) {
	int index = partition(arr, low, high);
	if (low<index-1)
		quickSort(arr, low, index-1);
	if (index<high)
		quickSort(arr, index, high);
}

// Runtime average: Depends and worst case O(log(n)). Memory O(1)
int binarySearch(int arr[], int low, int high, int x) {
	while(high >= low) {
		int middle = (low+high)/2;
		if (arr[middle] > x)
			high = middle-1;
		else if (arr[middle] < x)
			low = middle+1;
		else
			return middle;

	}
	return -1;
}