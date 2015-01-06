#include <iostream>
#include <string>
#include <map>
using namespace std;

typedef map<int, int> mi;

int placeParen(string exp, int result, int start, int end, mi &Map){
	int key = result*200 + start*7 + end*3;
	if (Map.count(key))
		return Map[key];
	if (start == end) {
		if (exp[start] == '1' && result == 1)
			return 1;
		else if (exp[start] == '0' && result == 0)
			return 1;
		return 0;
	}
	int c=0;
	if (result) {
		for (int i = start + 1; i < end; i+=2) {
			char op = exp[i];
			if (op == '&')
				c += placeParen(exp, 1, start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
			else if (op == '|') {
				c += placeParen(exp, 1, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
				c += placeParen(exp, 1,start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
			}
			else if (op == '^' ) {
				c += placeParen(exp, 1, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
			}
		}
	}
	else{
		for (int i = start + 1; i < end; i+=2) {
			char op = exp[i];
			if (op == '&') {
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
				c += placeParen(exp, 1, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
			}
			else if (op == '|')
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
			else if (op == '^' ) {
				c += placeParen(exp, 1, start, i-1, Map) * placeParen(exp, 1, i+1, end, Map);
				c += placeParen(exp, 0, start, i-1, Map) * placeParen(exp, 0, i+1, end, Map);
			}
		}
	}
	Map[key] = c;
	return c;
}

int main(){
	mi Map;
	string s = "1&0&1|1";
	cout<<placeParen(s, 1, 0, s.length()-1, Map);
	return 0;
}