#include <iostream>

using namespace std;

void swap(int*, int*);
void swap_alternate(int&, int&);

void swap(int* a, int* b) {

	(*a) = (*a) - (*b);
	(*b) = (*a) + (*b);
	(*a) = (*b) - (*a);
}

void swap(int& a, int& b) {
	a = a^b;
	b = a^b;
	a = a^b;
}

int main() {

	int num1 = 10, num2 = 20;
	cout << "\n-------------  Using swap() method  -------------\n" << endl;
	cout << "Before Swap, num1 = " << num1 << " , num2 = " << num2 << endl;  
	swap(num1, num2);
	cout << "After Swap, num1 = " << num1 << " , num2 = " << num2 << endl;  

	num1 = 50, num2 = 60;
	cout << "\n-------------  Using swap_alternate() method  -------------\n" << endl;
	cout << "Before Swap, num1 = " << num1 << " , num2 = " << num2 << endl;  
	swap(num1, num2);
	cout << "After Swap, num1 = " << num1 << " , num2 = " << num2 << endl; 



	return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_1.cpp -o Question17_1
./Question17_1

*/