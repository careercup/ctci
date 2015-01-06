#include <iostream>
using namespace std;

int search(int arr[], int low, int high, int x) {
	int mid = (low+high)/2;
	if(arr[mid]==x)
		return mid;
	if (low > high)
		return -1;
	if(arr[low] < arr[mid]) {
		if(x <= arr[mid] && x >= arr[low])
			return search(arr, low, mid-1, x);
		else
			return search(arr, mid+1, high, x);
	}
	else if(arr[mid] < arr[high]){
		if (x >= arr[mid] && x <= arr[high])
			return search(arr, mid+1, high, x);
		else
			return search(arr, low, mid-1, x);
	}
	else if(arr[low] == arr[mid]) {
		if(arr[mid] != arr[high])
			return search(arr, mid+1, high, x);
		else {
			int result = search(arr, low, mid-1, x);
			if (result == -1)
				return search(arr, mid+1, high, x);
			else
				return -1;
		}
	}
	return -1;
}

int main(){
	int arr[] = {5, 8, 16, 17, 20, 23, 0, 2, 3, 4};
	cout<<search(arr, 0, 9, 8);
	return 0;
}