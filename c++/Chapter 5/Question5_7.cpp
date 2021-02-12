#include<iostream>
using namespace std;

int fetchBit(int bit, int no){
	no >>=bit;
	return (no&1);
}

int findMissingWithXor(int A[], int N){
    int n = 1;
    int xorTarget = 1;
    int xorActual = 0;
    
    int maxBytes = sizeof(int); // optimize to number of significant bits in N
    for(int i = 0; i < N; ++i){
        
        // Find the XOR sum of elements 0...N
        // Possibly can optimzie without loop
        xorTarget ^= ++n;
        
        // Sweep throug each bit (preferably significant)
        // and calculate XOR sum of that
        for(int j = 0; j < maxBytes; ++j){
            xorActual ^= (fetchBit(A[i], j) << j);
        }
    }
    // XOR target and actual sums to find missing
    return xorActual ^ xorTarget;
}

int findMissingUtils(int A[], int n, int col){
	if(n <2){
		return 0;
	}
	int b0[(n/2)+1], b1[(n/2)+1];
	int count0 = 0;
	int count1 = 0;
	for(int i=0; i<n; i++){
		if(fetchBit(col, A[i])){
			b1[count1] = A[i];
			count1++;
		}
		else{
			b0[count0] = A[i];
			count0++;
		}
	}
	int v;
	if(count0<=count1){
		v = findMissingUtils(b0, count0, col+1);
		return (v<<1) | 0;
	}
	else
		v = findMissingUtils(b1, count1, col+1);
		return (v<<1) | 1;
}

void findMissing(int A[], int n){
	cout<<findMissingUtils(A, n, 0);
}

int main(){
	int A[] = {2, 5, 6, 0, 1, 3, 4, 8, 9, 10, 11, 12};
	//findMissing(A, 12);
    findMissingWithXor(A, 12);
	return 0;
}