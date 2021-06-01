#include<stdio.h>

int makeChange(int n, int denom) {

  int next_denom = 0, ways = 0, i;

  switch(denom){
  case 25 :
    next_denom = 10;
    break;
  case 10 :
    next_denom = 5;
    break;
  case 5 :
    next_denom = 1;
    break;
  case 1 :
    return 1;
  }

  for(i = 0; i * denom <= n; i++)
    ways += makeChange(n - (i * denom),next_denom);

  return ways;
}

int main() {
  int res;
  res = makeChange(10, 25);
  
  printf("%d ways\n",res);
  return 0;
}
