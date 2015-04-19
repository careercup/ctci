#include<stdio.h>

void printSubsets(int arr[], int n, int cnt) {
  int j;

  if(cnt < 0)
    return;

  printf("{");

  for(j = 0; j < n; j++) {
    if(cnt & (1 << j))
      printf("%d ",arr[j]);
  }
  printf("}\n");

  printSubsets(arr, n, cnt - 1);

  return;
}

int main() {

  int arr[] = {1, 2, 3, 4};

  printSubsets(arr, 4, 16 - 1);

  return 0;
}
