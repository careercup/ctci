#include <iostream>

using namespace std;

// declarations
int factors_of_five(int);
int count_fact_zeros(int);

int count_fact_zeros_alternate(int);

/* Method 1 - Start */

int factors_of_five(int x) {

	int zero_count = 0;
	while (x%5 == 0) {
		zero_count++;
		x /= 5;
	}
	return zero_count;
}

int count_fact_zeros(int number) {

	if (number < 0) return -1;
	int zero_count = 0, i;
	for (i=2; i<=number; i++) {
		zero_count += factors_of_five(i);
	}
	return zero_count;
}

/* Method 1 - End */

/* Method 2 - Start */

int count_fact_zeros_alternate(int number) {

	if (number < 0) return -1;
	int zero_count = 0, i;

	for (i=5; number/i > 0; i=i*5) {
		zero_count += number/i;
	}

	return zero_count;
}

/* Method 1 - End */

int main() {

	int number1 = 20, number2 = 25;

	cout << "\n-------------  Using count_fact_zeros() method -------------\n" << endl;
	cout << "Number of trailing zeros in " << number1 << "'s factorial are : " << count_fact_zeros(number1) << endl;
	cout << "Number of trailing zeros in " << number2 << "'s factorial are : " << count_fact_zeros(number2) << endl;
	cout << endl;

	cout << "\n-------------  Using count_fact_zeros_alternate() method -------------\n" << endl;
	cout << "Number of trailing zeros in " << number1 << "'s factorial are : " << count_fact_zeros_alternate(number1) << endl;
	cout << "Number of trailing zeros in " << number2 << "'s factorial are : " << count_fact_zeros_alternate(number2) << endl;
	cout << endl;

	return 0;
}


/*

Commands to run
----------------

g++ -std=c++11 Question17_3.cpp -o Question17_3
./Question17_3

*/
