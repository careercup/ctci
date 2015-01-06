#include <iostream>
using namespace std;

int noOfSteps(int n, int arr[]){
	if(arr[n])
		return arr[n];
	if(n<4){
		if(n==1)
			arr[n] = 1;
		else if(n==2){
			arr[2] = 2;
		}
		else if(n==3){
			arr[3] = 4;
		}
	}
	else
		arr[n] = noOfSteps(n-1, arr) + noOfSteps(n-2, arr) + noOfSteps(n-3, arr);
	return arr[n];
}

int main(){
	int n = 36;
	int arr[n+1] = {-1};
	cout<<noOfSteps(n, arr);
	return 0;
}