#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void replace(char *str){
  if(str == NULL)
    return;

  int length, i, j;
  char *backup;

  for(i=0;; i++)
    if(str[i] == '\0')
      break;
  length = i+1; // number of characters in str including null character

  // back str up so that we can overwrite str
  backup = malloc(length*sizeof(char));
  for(i=0; i<length; i++)
    backup[i] = str[i];

  // index 'backup' with 'i'; index 'str' with 'j'
  // < length-1 because we don't need to write the null character
  // as the null character is already in the correct place
  // j is faster or as fast as i, so terminating on j sufficient
  for(i=0, j=0; j<length-1; i++){
    if((int)backup[i] != 32)
      str[j] = backup[i];
    else{
      str[j] = '%';
      str[j+1] = '2';
      str[j+2] = '0';
      j += 2;
    }
    
    j++;
  }
  
  free(backup);
}

int main(){
  char example[18] = "Mr John Smith    "; // 17 characters (including spaces)
                                         // + 1 character for null character
  char small[6] = "a b  ";
  char one_space[4] = "   ";
  char no_space[1] = "";
  char *null_str = NULL;

  replace(example);
  replace(small);
  replace(one_space);
  replace(no_space);
  replace(null_str);

  if(strcmp(example, "Mr%20John%20Smith") == 0)
    printf("example passed\n");
  else
    printf("example failed\n");

  if(strcmp(small, "a%20b") == 0)
    printf("small passed\n");
  else
    printf("small failed\n");

  if(strcmp(one_space, "%20") == 0)
    printf("one_space passed\n");
  else
    printf("one_space failed\n");

  if(strcmp(no_space, "") == 0)
    printf("no_space passed\n");
  else
    printf("no_space failed\n");

  if(null_str == NULL)
    printf("null_str passed\n");
  else
    printf("null_str failed\n");

  return EXIT_SUCCESS;
}
