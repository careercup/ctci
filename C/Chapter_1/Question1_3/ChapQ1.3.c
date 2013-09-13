#include <stdlib.h>
#include <stdio.h>

void quicksort(int *nbr, int n){
  if(n <= 1)
    return;
  if(n == 2 && nbr[0] <= nbr[1])
    return;
  if(nbr == NULL)
    return;

  int pivot = (int)(n/2.);
  int i;

  for(i = 0; i < n; i++){
    if(nbr[i] > nbr[pivot] && i < pivot){
      int temp = nbr[pivot];
      nbr[pivot] = nbr[i];
      nbr[i] = temp;
    }
    if(nbr[i] < nbr[pivot] && i > pivot){
      int temp = nbr[pivot];
      nbr[pivot] = nbr[i];
      nbr[i] = temp;
    }
  }

  int *left = malloc((pivot + 1)*sizeof(int));
  int *right = malloc((n - pivot - 1)*sizeof(int));

  for(i = 0; i < pivot + 1; i++)
    left[i] = nbr[i];

  for(i = 0; i < n - pivot - 1; i++)
    right[i] = nbr[pivot + 1 + i];

  quicksort(left, pivot+1);
  quicksort(right, n-pivot-1);

  for(i = 0; i < pivot + 1; i++)
    nbr[i] = left[i];

  for(i = 0; i < n - pivot - 1; i++)
    nbr[pivot + 1 + i] = right[i];

  free(left);
  free(right);
}

int is_permutation(char *str1, char *str2){

  int length, i;
  int *stra1, *stra2;

  if(str1 == NULL || str2 == NULL)
    return 0;

  for(i=0;; i++)
    if(str1[i] == '\0')
      break;
  length = i; // number of characters, excluding null character

  for(i=0;; i++)
    if(str2[i] == '\0')
      break;

  // not permutation because of difference in length
  if(length != i)
    return 0;

  // convert to ASCII code arrays
  stra1 = malloc(length*sizeof(int));
  stra2 = malloc(length*sizeof(int));
  
  for(i=0; i<length; i++){
    stra1[i] = (int)str1[i];
    stra2[i] = (int)str2[i];
  }

  // sort ASCII arrays
  quicksort(stra1, length);
  quicksort(stra2, length);

  // compare ASCII codes
  for(i=0; i<length; i++)
    if(stra1[i] != stra2[i])
      return 0;

  // free memory
  free(stra1);
  free(stra2);

  // permutation not excluded neither based on length, nor sorted ASCII codes
  // conclude that strings are permutations of one another
  return 1;
}

int main(){
  char str[10] = "abcdefg";
  char str_perm[10] = "bacedgf";
  char str_not_perm[10] = "gffaecd";
  char str_wrong_length[10] = "ab";
  char *str_null = NULL;

  if(is_permutation(str, str))
    printf("str, str passed\n");
  else
    printf("str, str failed\n");

  if(is_permutation(str, str_perm))
    printf("str, str_perm passed\n");
  else
    printf("str, str_perm failed\n");

  if(is_permutation(str, str_not_perm))
    printf("str, str_not_perm failed\n");
  else
    printf("str, str_not_perm passed\n");

  if(is_permutation(str, str_wrong_length))
    printf("str, str_wrong_length failed\n");
  else
    printf("str, str_wrong_length passed\n");

  if(is_permutation(str, str_null))
    printf("str, str_null failed\n");
  else
    printf("str, str_null passed\n");

  return EXIT_SUCCESS;
}
