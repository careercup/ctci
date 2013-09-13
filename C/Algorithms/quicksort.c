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

int is_sorted(int *nbr, int n){
  int i;
  for(i=0; i<n-1; i++)
    if(nbr[i] > nbr[i+1])
      return 0;
  return 1;
}

int main(){
  int i;
  int nbr[5] = {10, 1, 0, 5, 2};
  int nbr_small[2] = {100, 2};
  int *nbr_null = NULL;

  quicksort(nbr, 5);
  quicksort(nbr_small, 2);
  quicksort(nbr_null, 10);

  if(is_sorted(nbr, 5))
    printf("nbr passed\n");
  else
    printf("nbr failed\n");

  if(is_sorted(nbr_small, 2))
    printf("nbr_small passed\n");
  else
    printf("nbr_small failed\n");

  if(nbr_null == NULL)
    printf("nbr_null passed\n");
  else
    printf("nbr_null failed\n");

  return EXIT_SUCCESS;
}
