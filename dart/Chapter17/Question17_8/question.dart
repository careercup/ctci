
int getMaxSum(List<int> a) {
  int maxSum = 0;
  int runningSum = 0;
  for (int i = 0; i < a.length; i++) {
    runningSum += a[i];
    if (maxSum < runningSum) {
      maxSum = runningSum;
    } else if (runningSum < 0) {
      runningSum = 0;
    }
  }

  return maxSum;
}

void main() {
  List<int> a = [2, -8, 3, -2, 4, -10];
  print(getMaxSum(a));
}

