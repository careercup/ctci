#include <iostream>
#include <unordered_map>
#include <string>
#include <algorithm>
#include <vector>

using namespace std;

unordered_map<string, int> set_up_dict(vector<string>&);
int get_frequency(unordered_map<string, int>&, string);

unordered_map<string, int> set_up_dict(vector<string>& book) {

	unordered_map<string, int> dict;

	for (int i=0; i<book.size(); i++) {

		string word = book[i];
		::transform(word.begin(), word.end(), word.begin(), ::tolower);
		auto search = dict.find(word);
		if (search == dict.end()) { // does not contain the string
			dict[word] = 1;
		}
		else {
			dict[word]++;
		}
	}
	return dict;
}

int get_frequency(unordered_map<string, int>& dict, string word) {

	if (dict.empty()) {
		return -1;
	}
	::transform(word.begin(), word.end(), word.begin(), ::tolower);

	auto search = dict.find(word);
	if (search == dict.end()) {
		return -1;
	}
	return search->second;
}

int main() {

	vector<string> book;
	book.push_back("iniesta");
	book.push_back("messi");
	book.push_back("messi");
	book.push_back("ronaldo");
	book.push_back("messi");
	book.push_back("ronaldo");
	book.push_back("neymar");
	book.push_back("iniesta");

	// setting up the dictionary
	unordered_map<string, int> dict = set_up_dict(book);
	string search_key1 = "messi", search_key2 = "iniesta", search_key3 = "maradona";

	cout << "Count of " << search_key1 << " is " << get_frequency(dict, search_key1) << endl;
	cout << "Count of " << search_key2 << " is " << get_frequency(dict, search_key2) << endl;
	cout << "Count of " << search_key3 << " is " << get_frequency(dict, search_key3) << endl;


	return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_9.cpp -o Question17_9
./Question17_9

*/