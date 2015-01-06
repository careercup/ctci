#include <iostream>
#include <vector>
using namespace std;

typedef vector<string> vStr;

void generateParen(string str, int left, int right){
	if (left == 0 && right == 0) {
		//It can be stored into some variable here
		cout<<str<<'\n';
		return;
	}
	if (left == right) {
		generateParen(str + "(", left - 1, right);
		return;
	}
	else{
		if (left) {
			generateParen(str + "(", left - 1, right);
		}
		generateParen(str + ")", left, right - 1);
	}
}

int main(){
	int n = 3;	
	generateParen("", n, n);
	return 0;
}