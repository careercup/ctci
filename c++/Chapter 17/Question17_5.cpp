#include <iostream>
#include <string>

using namespace std;

#define MAX_COL 4

// creating a structure  for returning the results
struct Result {
	int hits;
	int pseudohits;
};

// declarations

void print(Result*);
Result* estimate(string, string);
int code(char);

// Function Def

int code(char ch) {
	switch(ch) {
		case 'B' : return 0;
		case 'G' : return 1;
		case 'R' : return 2;
		case 'Y' : return 3;
		default : return -1;
	}
}

Result* estimate(string guess, string solution) {

	if (guess.size() != solution.size()) return nullptr;

	Result* res = new Result();
	int* freq = new int[MAX_COL];

	int i;
	for (i=0; i<guess.size(); i++) {
		if (guess[i] == solution[i]) {
			res->hits++; // calculating hits
		}
		else {
			int dig = code(solution[i]);
			if (dig >= 0) {
				freq[dig]++; // incrementing frequency table if it is not a hit. this i used for pseudo hits
			}
		}
	}

	// calculating psuedohits
	for(i=0; i<guess.size(); i++) {
		int dig = code(guess[i]);
		if (dig >= 0 && freq[dig] > 0 && (guess[i] != solution[i]) ) {
			res->pseudohits++;
			freq[dig]--;
		}
	}

	return res;
}

void print(Result* res) {	
	cout << "(h = " << res->hits << ", ph = " << res->pseudohits << ")" << endl; 
}

int main() {

	string guess = "GRBY", solution = "BBRY";
	cout << "Solution = " << solution << " Guess = " << guess << endl;
	Result* res = estimate(guess, solution);
	print(res);

	guess = "RGBY", solution = "GGRR";
	cout << "Solution = " << solution << " Guess = " << guess << endl;
	res = estimate(guess, solution);
	print(res);

	return 0;
}

/*

Commands to run
----------------

g++ -std=c++11 Question17_5.cpp -o Question17_5
./Question17_5

*/



