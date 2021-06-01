#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void pair_sum(vector<int>, int);

void pair_sum(vector<int> a, int target_sum) {

  /** Sort the vector */
  sort(a.begin(), a.end());

  int left = 0, right = a.size()-1, curr_sum = 0;

  while (left < right) {
      curr_sum = a[left] + a[right];
      if (curr_sum == target_sum) {
        cout << "Found Pair : {" << a[left] << ", " << a[right] << "}" << endl;
        left++;
        right--;
      }
      else if (curr_sum > target_sum) {
        right--;
      }
      else {
        left++;
      }
  }
}

int main() {

  int arr[] = {9, 3, 6, 5, 7, -1, 13, 14, -2, 12, 0};
  int size = sizeof(arr)/sizeof(*arr);
  vector<int> ar(arr, arr+size);
  int target_sum = 12;

  pair_sum(ar, target_sum);
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_12.cpp -o Question17_12
./Question17_12

*/
