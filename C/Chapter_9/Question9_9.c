#include<stdio.h>
#include<string.h>

int row[8], ld[15], rd[15], gc, gr, lc = 0, rw[8], row[8];

void placeCol(int col) {
  int i, j;

  if( col >= 8 && row[gc] == gr) {
    printf("%2d    %d", ++lc, row[0] + 1);
    for(j = 1; j < 8 ; j++) {
      printf(" %d", row[j] + 1);
    }
    printf("\n");
    return; //all queens placed
  }
  else {
    for(i = 0; i < 8; i++) {
      if(rw[i] == 0 && ld[i - col + 7] == 0 && rd[i + col] == 0) {
        row[col] = i;

        if(col == gc && row[col] != gr)
          continue;
        else {
          rw[i] = ld[i - col + 7] = rd[i + col] = 1;
          placeCol(col + 1);
          rw[i] = ld[i - col + 7] = rd[i + col] = 0;
        }
      }
    }
  }
}

int main() {

  int i, j, res;
  int board[8][8] = {0};

  memset(row, 0 , sizeof(row));
  lc = 0;

  scanf("%d %d",&gr,&gc);
  gr--;
  gc--;

  printf("SOLN     COLUMN\n");
  printf(" #    1 2 3 4 5 6 7 8\n\n");
  placeCol(0);

  return 0;
}
