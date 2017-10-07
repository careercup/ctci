#include<iostream>
#include<climits>
#include<cmath>
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

void next_smallest(int n){
	int len = 0;
	int tmp = n;
	int res;
	while(len<31){
		if((tmp&1) == 0){
			tmp >>= 1;
			len++;
			if(tmp&1 == 1){
				//10 occured
				res = n - (1<<len) + (1<<(len-1)); 
				printBinary(res);
				return;
			}
		}
		else{
			tmp >>=1;
			len++;
		}
	}
	//All 1's
	cout<<INT_MIN<<'\n';
}

void next_largest(int n){
	int len = 0;
	int tmp = n;
	int res;
	while(len<31){
		if(tmp&1 == 1){
			tmp >>= 1;
			len++;
			if((tmp&1) == 0){
				//01 occured
				res = n + (1<<len) - (1<<(len-1));
				printBinary(res);
				return;
			}
		}
		else{
			tmp >>=1;
			len++;
		}
	}
	cout<<INT_MAX;
}

int main(){
	int a = (1<<31)+(1<<29);
	cout<<a<<'\n';
	printBinary(a);
	next_smallest(a);
	next_largest(a);
    return 0;
}
