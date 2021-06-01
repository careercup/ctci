#include <iostream>
#include <string>
using namespace std;


string compress(const string& toCompress){
	string result = "";

	int i = 0;
	while( i < toCompress.length()) {
		int counter = 1;
		while((counter+i) < toCompress.length() && toCompress[i] == toCompress[i+counter]){
			counter++;
		}
		result += toCompress[i] + to_string(counter);
		i += counter;
	}

	if(toCompress.length() <= result.length()) {
		result = toCompress;
	}

	return result;
}

int main() {
	string toCompress = "abccccaa";
	string result = compress(toCompress);

	cout << toCompress << endl;
	cout << result << endl;

	return 0;
};
