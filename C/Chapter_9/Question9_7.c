#include<stdio.h>
//x is column y is row.

void paintfill(int screen[5][5], int x, int y, int n, int m, int ocolor, int ncolor) {
  int i, j;

  if(x < 0 || x >= n || y < 0 || y >= m)
    return ;

  if(screen[y][x] == ocolor) {
    screen[y][x] = ncolor;
    paintfill(screen, x - 1, y, n, m, ocolor, ncolor);
    paintfill(screen, x + 1, y, n, m, ocolor, ncolor);
    paintfill(screen, x, y - 1, n, m, ocolor, ncolor);
    paintfill(screen, x, y + 1, n, m, ocolor, ncolor);
  }

  return;
}

int main() {
  int i, j, tmp, screen[5][5], n = 5, m = 5;

  for (i = 0; i < m; i++) {
    for (j = 0; j < n; j++) {
      printf("Enter at %d %d\n",i,j);
      scanf("%d",&tmp);
      screen[i][j] = tmp;
    }
  }
  paintfill(screen, 3, 1, 5, 5, 3, 2);

  for (i = 0; i < m; i++) {
    for (j = 0; j < n; j++) {
      printf("%d ", screen[i][j]);
    }
    printf("\n");
  }

  return 0;
}
