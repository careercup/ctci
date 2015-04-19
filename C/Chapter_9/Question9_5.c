#include<stdio.h>

/* Function to swap values at two pointers */
void swap (char *x, char *y)
{
    char temp;
    temp = *x;
    *x = *y;
    *y = temp;
}

void permutations(char *arr, int index, int n) {
  int j;

  if(index == n)
    printf("%s\n",arr);
  else {
    for(j = index; j <= n; j++) {
      swap((arr + index), (arr + j));
      permutations(arr, index + 1, n);
      swap((arr + index), (arr + j));
    }
  }
}


int main() {
  char arr[] = "abc";

  permutations(arr, 0, 2);

  return 0;
}
