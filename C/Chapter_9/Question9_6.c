#include<stdio.h>
#include<string.h>

void printParanthesis(char str[], int leftRem, int rightRem, int count) {
  if(leftRem < 0 || rightRem < leftRem)
    return;

  if(leftRem == 0 && rightRem == 0) {
    printf("%s\n",str);
  }
  else {
    if(leftRem > 0) {
      str[count] = '(';
      printParanthesis(str, leftRem - 1, rightRem, count + 1);
    }
    if(rightRem > leftRem){
      str[count] = ')';
      printParanthesis(str, leftRem, rightRem - 1, count + 1);
    }
  }
}

int main() {
  int n = 3;
  char str[6];
  printParanthesis(str, n, n, 0);

  return 0;
}
