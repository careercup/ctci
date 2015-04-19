#include<stdio.h>

int countPathsDp(int x, int y) {

  int i, j;
  int dp[3][3]; //dp[x + 1][y + 1];

  for(i = x; i >= 0; i--) {
    for(j = y; j >= 0; j--) {
      if(i == x || j == y)
        dp[i][j] = 1;
      else
        dp[i][j] = dp[i + 1][j] + dp[i][j + 1];
    }
  }
  return dp[0][0];
}

int countPathsWithObstacle(int x, int y, int obs[][3]) {
  int dp[3][3]; //dp[x + 1][y + 1];
  int i, j, val;

  for(i = x; i >= 0; i--) {
    for(j = y; j >= 0; j--) {

      val = obs[i][j];
      printf("%d \n", val);
      if(i == x && j == y) {
        if(val)
          dp[i][j] = 0;
        else
          dp[i][j] = 1;
      }
      else if(i == x) {
         if(val)
          dp[i][j] = 0;
        else
          dp[i][j] = dp[i][j + 1];
      }
      else if(j == y) {
         if(val)
          dp[i][j] = 0;
        else
          dp[i][j] = dp[i + 1][j];
      }
      else {
         if(val)
          dp[i][j] = 0;
        else
          dp[i][j] = dp[i + 1][j] + dp[i][j + 1];
      }
    }
  }

  return dp[0][0];
}

int main() {
  int x = 2; // index - row
  int y = 2; // index - col
  int res = 0, i, j;
  int obstacleMatrix[3][3] = {0 , 0, 0, 0, 1, 0, 0, 0, 0};

  res = countPathsDp(x, y);
  printf("%d ways\n",res);

  res = countPathsWithObstacle(x,y,obstacleMatrix);
  printf("%d ways\n",res);
  return 0;
}
