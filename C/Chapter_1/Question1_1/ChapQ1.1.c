// Implement an algorithm to determine if a string has all unique
// characters. What if you cannot use additional data structures?

#include <stdlib.h>
#include <stdio.h>

int unique(char * string){
  if(string == NULL)
    return 0;

  int i,j;
  int length;

  for(i=0;;i++)
    if(string[i] == '\0')
      break;
  length = i - 1;

  for(i=0;i<length;i++)
    for(j=0;j<length;j++)
      if(string[i] == string[j] && i != j)
        return 0;
  return 1;
}

int main(){
  char * null_address = NULL;
  char unique_str[100] = "abcdefgh;123";
  char non_unique_str[100] = "abcdeefgh1123";

  if(unique(null_address))
    printf("null_string: test failed\n");
  else
    printf("null_string: test passed\n");

  if(unique(unique_str))
    printf("unique_str: test passed\n");
  else
    printf("unique_str: test failed\n");

  if(unique(non_unique_str))
    printf("non_unique_str: test failed\n");
  else
    printf("non_unique_str: test passed\n");

  return EXIT_SUCCESS;
}
