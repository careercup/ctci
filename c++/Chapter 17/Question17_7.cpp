#include <iostream>
#include <string>
#include <vector>

using namespace std;

// declarations
string number_to_str(int number);
string number_to_str_100(int number);

// global variables

vector<string> digits = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"};
vector<string> teens = {"Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"};
vector<string> tens = {"Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"};
vector<string> bigs = {"", "Thousand", "Million", "Billion"};

/** The main function used for doing the conversion */
string number_to_str(int number) {

    if (number == 0) return "Zero";

    if (number < 0) {
      return "Negative" + number_to_str(-1 * number);
    }
    int count = 0;
    string str = "";
    // main logic starts here
    while (number > 0) {
      if (number%1000 != 0) {
          str = number_to_str_100(number % 1000) + bigs[count] + " " + str;
      }
      number /= 1000;
      count++;
    }
    return str;
}

/** Helper function that converts the ones, tens and Hundereds place */
string number_to_str_100(int number) {

    string str = "";

    /** Convert 100s place */
    if (number >= 100) {
      str += digits[number/100 - 1] + " Hundered ";
      number %= 100;
    }

    /** Convert tens place */
    if (number >= 11 && number <= 19) { // if number is a teen
        str += teens[number - 11] + " ";
        return str;
    }
    else if(number == 10 || number >= 20) {
        str += tens[number/10 - 1] + " ";
        number %= 10;
    }

    /** Converting ones place */
    if (number >= 1 && number <= 9) {
      str += digits[number - 1] + " ";
    }

    return str;
}

int main() {

  string str;
  for (int i=1; i<100; i++) {
    str = number_to_str(i);
    cout << i << " : " << str << endl;
  }

  cout << number_to_str(10045) << endl;
  cout << number_to_str(98345) << endl;
  cout << number_to_str(1000076) << endl;
  cout << number_to_str(1000000000) << endl;

  cout << endl;

  return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_7.cpp -o Question17_7
./Question17_7

*/
