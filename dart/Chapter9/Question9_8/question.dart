
int makeChange(int n, [int denom = 25]) {
  //print("$n $denom");

  int next_denom = 0;
  switch(denom) {
    case 25:
      next_denom = 10;
      break;
    case 10:
      next_denom = 5;
      break;
    case 5:
      next_denom = 1;
      break;
    case 1:
      return 1;
  }

  int ways = 0;
  for (int i = 0; i * denom <= n; i++) {
    ways += makeChange(n - i * denom, next_denom);
  }

  return ways;
}

void main() {
  for (int i = 100; i >= 1; i--) {
    print("makeChange($i) = ${makeChange(i)}");
  }
}