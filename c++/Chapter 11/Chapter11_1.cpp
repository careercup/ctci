#include <iostream>
using namespace std;

void merge(int a[], int lastA, int b[], int lastB) {
	int index = lastB + lastA + 1;
	while(index >= 0) {
		if (a[lastA] > b[lastB]) {
			a[index] = a[lastA];
			lastA--;
		}
		else {
			a[index] = b[lastB];
			lastB--;
		}
		index--;
	}
}

int main(){

	int a[13] = {0, 4, 14, 23, 29, 30, 31};
	int b[] = {6, 7, 29, 31, 100, 200};
	merge(a, 6, b, 5);
	for (int i = 0; i < 13; ++i) {
		cout<<a[i]<<" ";
	}
	return 0;
}