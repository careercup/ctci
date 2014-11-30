#include<iostream>
using namespace std;

void printBinary(int n){
    int arr[32];
    int len = 8*sizeof(n);
    int mask = 1;
    int index = 0;
    while(len--){
        if(n&mask)
            arr[index] = 1;
        else
            arr[index] = 0;
        index++;
        mask <<= 1;
    }
    for(int i=31; i>=0; i--){
        cout<<arr[i];
    }
    cout<<'\n';
}

int swapOddEven(int a){
	int mask = 0xaaaaaaaa;	//.....10101010
	int mask1 = 0x55555555;	//.....01010101
	int oddBits = a&mask;	//Store odd bits
	int evenBits = a&mask1;	//Store even bits
	oddBits >>=1;
	evenBits <<=1;			//Swaping possitions
	return (oddBits|evenBits);
}

int main(){
	int a = 0xaaaaaaa;
	printBinary(a);
	printBinary(swapOddEven(a));
}