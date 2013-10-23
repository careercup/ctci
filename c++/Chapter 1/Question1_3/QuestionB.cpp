#include<iostream>
#include<string>
#include<algorithm>

using namespace std;

bool permutation(string a, string b) {
//check the length of both string and return false if they are not equal.
	if (a.length() != b.length())
		return false;
	int ascii_set[256] = { 0 };
	for (int i = 0; i < a.length(); i++) {
		int val = (int) a[i];
		ascii_set[val]++;
	}
	for (int i = 0; i < b.length(); i++) {
		int val = (int) b[i];
		if ((--ascii_set[val]) < 0)
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
