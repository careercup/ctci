// Implement a function void reverse(char* str) in C or C++
// which reverses a null-terminated string

#include <stdlib.h>
#include <stdio.h>

void reverse(char *str){
  
  if(str == NULL)
    return ;

  int length, i;
  char * rev;

  for(i=0;;i++)
    if(str[i] == '\0')
      break;
  length = i;

  if(length > 0){
    rev = malloc(length * sizeof(char));
    
    for(i=0; i<length; i++)
      rev[length-1-i] = str[i];

    for(i=0; i<length; i++)
      str[i] = rev[i];

    free(rev);
  }

}

int is_reverse(char *str, char *rev){
  if(str == NULL || rev == NULL)
    return 0;

  int length, i;

  for(i=0;;i++)
    if(str[i] == '\0')
      break;
  
  length = i;

  for(i=0;;i++)
    if(rev[i] == '\0'){
      if(i != length)
        return 0;
      break;
    }

  for(i=0; i<length; i++)
    if(str[i] != rev[length-1-i])
      return 0;

  return 1;
}

int main(){
  char str[20] = "abcdefg";
  char str_backup[20] = "abcdefg";
  char * null = NULL;

  reverse(str);
  if(is_reverse(str, str_backup))
    printf("reverse(str) passed\n");
  else
    printf("reverse(str) failed\n");

  reverse(null);
  if(null == NULL)
    printf("reversible(null) passed\n");
  else
    printf("reversible(null) failed\n");

  return EXIT_SUCCESS;
}
