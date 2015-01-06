#include <iostream>
using namespace std;

bool search(int *arr, int M, int N, int ele){
	int row = 0;
	int col = N-1;
	while(row < M && col >= 0) {
		if (*(arr+row*N+col) == ele){
			return true;
		}
		else if (*(arr+row*N+col) > ele) {
			col--;
		}
		else {
			row++;
		}
	}
	return false;
}

bool binarySearch(int *arr, int MStart, int NStart, int MEnd, int NEnd, int N, int ele) {
	int MMid = (MStart+MEnd)/2;
	int NMid = (NStart+NEnd)/2;
	int midEle = *(arr+MMid*N+NMid);
	if (midEle == ele)
		return true;
	if (MStart >= MEnd && NStart >= NEnd)
		return false;
	bool a=false, b=false, c=false, d=false;

	// if element in first partition
	if (*(arr+MStart*N+NStart) <= ele && *(arr+MMid*N+NMid) >= ele) {
		a = binarySearch(arr, MStart, NStart, MMid, NMid, N, ele);
	}
	// if element in second partition
	if (*(arr+MStart*N+NMid+1) <= ele && *(arr+MMid*N+NEnd) >= ele) {
		b = binarySearch(arr, MStart, NMid+1, MMid, NEnd, N, ele);
	}
	// if element in third partition
	if (*(arr+(MMid+1)*N+NStart) <= ele && *(arr+MEnd*N+NMid) >= ele) {
		c = binarySearch(arr, MMid+1, NStart, MEnd, NMid, N, ele);
	}
	// if element in forth partition
	if (*(arr+(MMid+1)*N+NEnd) <= ele && *(arr+MEnd*N+NEnd) >= ele) {
		d = binarySearch(arr, MMid+1, NEnd, MEnd, NEnd, N, ele);
	}
	return (a+b+c+d);
}

int main(){
	int arr[4][5] = {
		{15, 20, 70, 85, 90},
		{25, 35, 80, 95, 100},
		{30, 55, 95, 105, 105},
		{40, 80, 120, 120, 150}
	};
	cout<<search(*arr, 4, 5, 15)<<'\n';;
	cout<<binarySearch(*arr, 0, 0, 3, 4, 5, 95);
	return 0;
}