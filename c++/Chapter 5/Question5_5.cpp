#include<iostream>
#include<climits>
using namespace std;

int noOfBits(int a, int b){
	int len = 32;
	int count=0;
	while(len--){
		if((a&1) != (b&1))
			count++;
		a >>=1;
		b >>=1;
	}
	return count;
}

int noOfBits1(int a, int b){
	int count = 0;
	for(int i=a^b; i != 0; i >>=1){
		count += (i&1);
	}
	return count;
}

int main(){
	int a = 9456;
	int b = 12000;
	cout<<noOfBits1(a, b);
	return 0;
}