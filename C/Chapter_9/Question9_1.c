#include<stdio.h>
#include<string.h>

int countWaysDp(int n, int arr[]) {
  if(n < 0) {
    return 0; //no ways possible
  }
  else if(n == 0) {
    return 1; // found exactly one way - no way to climb the stairs
  }
  else if (arr[n] > -1) {
    return arr[n];
  }
  else {
    arr[n] = countWaysDp(n - 1, arr) + countWaysDp(n - 2, arr) + countWaysDp(n - 3, arr);
    return arr[n];
  }
}

int main() {

  int n = 3;
  int arr[4];
  int res = 0;

  memset(&arr,-1,sizeof(arr));
  res = countWaysDp(n, arr);

  printf("Number of ways %d\n",res);

  return 0;
}
