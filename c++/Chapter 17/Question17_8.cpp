#include <iostream>
#include <vector>

using namespace std;

// declarations
int max_sum_subarray(int*);
int max(int, int);
int max_sum_subarray_alt(vector<int>);


/** Using vector class */
int max_sum_subarray_alt(vector<int> a) {
  int sum = 0, max_sum = 0, i;
  for (int i=0; i<a.size(); i++) {
    if (sum + a[i] < 0) {
      sum = 0;
    }
    else {
      sum += a[i];
    }
    max_sum = max(sum, max_sum);
  }
  return max_sum;
}

/** Using pointer to array */
int max_sum_subarray(int* a, int size) {
  int sum = 0, max_sum = 0, i;
  for (i=0; i<size; i++) {
    int curr = *(a+i);
    if (sum + curr < 0) {
      sum = 0;
    }
    else {
      sum += curr;
    }
    max_sum = max(sum, max_sum);
  }
  return max_sum;
}

int max(int a, int b) {
  int m = (a > b) ? a : b;
  return m;
}


int main() {

  cout << "\n-------------  Using max_sum_subarray() ------------------\n" << endl;

  int a[6] = {2, -8, 3, -2, 4, -10};
  int size = sizeof(a) / sizeof (int);
  cout << "The max sum subarray is : " << max_sum_subarray(a, size) << endl;

  int b[] = {2, -8, 3, -1, 2, 4, -2, 3};
  size = sizeof(b) / sizeof (int);
  cout << "The max sum subarray is : " << max_sum_subarray(b, size) << endl;

  cout << "\n-------------  Using max_sum_subarray_alt() -----------------\n" << endl;

  vector<int> c = {2, -8, 3, -2, 4, -10};
  vector<int> d = {2, -8, 3, -1, 2, 4, -2, 3};
  cout << "The max sum subarray is : " << max_sum_subarray_alt(c) << endl;
  cout << "The max sum subarray is : " << max_sum_subarray_alt(d) << endl;
  cout << endl;

  return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_8.cpp -o Question17_8
./Question17_8

*/
