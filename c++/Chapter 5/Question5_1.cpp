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

int insertBit(int N, int M, int i, int j){
    int allOnes = ~0;
    int left = allOnes << (j+1);
    int right = (1<<i)-1;
    int mask = left|right;
    int clr = N & mask;
    int shifted = M<<i;
    return shifted | clr;
}

int main(){
    int N, M, i, j;
    N = 1<<10;      //10000000000
    M = 19;         //10011
    i=2;
    j=6;
    printBinary(N);
    printBinary(M);
    int res = insertBit(N, M, i, j);
    printBinary(res);
}
