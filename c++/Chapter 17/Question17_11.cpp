#include <iostream>
#include <stdlib.h>

using namespace std;

#define NUMBER_5 5

int rand5();
int rand7();
int rand7_alternate();

int rand5() {
  return (rand() % NUMBER_5);
}

int rand7() {
  while (true) {
    int num = 5 * rand5() + rand5();
    if (num < 21) {
      return num % 7;
    }
  }
}

int rand7_alternate() {
  while (true) {
    int r1 = 2 * rand5();
    int r2 = rand5();
    if (r2 != 4) {
      int rand1 = r2 % 2;
      int num = r1 + rand1;
      if (num < 7)
        return num;
    }
  }
}

int main() {

  cout << "\n---------------  Using Method rand7() ---------------\n" << endl;
  for (int i=0; i<10; i++) {
    cout << rand7() << ", ";
  }
  cout << endl;

  cout << "\n---------------  Using Method rand7_alternate() ---------------\n" << endl;
  for (int i=0; i<10; i++) {
    cout << rand7_alternate() << ", ";
  }
  cout << endl;

  return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_11.cpp -o Question17_11
./Question17_11

*/
