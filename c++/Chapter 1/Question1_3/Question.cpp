/*
 * 1.3 Given two strings, write a method to decide if one is a permutation of the other.
 *
 */

#include<iostream>
#include<string>
#include<algorithm>

using namespace std;

bool permutation(string a, string b) {
//check the length of both string and return false if they are not equal.
	if (a.length() != b.length())
		return false;
//sort both strings and compare character by character.
	sort(a.begin(), a.end());
	sort(b.begin(), b.end());
	for (int i = 0; i < a.length(); i++) {
		if (a[i] != b[i])
			return false;
	}
	return true;
}

/* Function to print true and false */
string result(bool value) {
	if (value)
		return "True";
	else
		return "False";
}

int main() {
	string a = "apple";
	string b = "papel";
	cout << "Result for " << a << " and " << b << " is "
			<< result(permutation(a, b)) << endl;
}
