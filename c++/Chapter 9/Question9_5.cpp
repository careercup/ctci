#include <iostream>
#include <vector>
using namespace std;

typedef vector<string> vStr;

vStr printPermutation(string str){
	vStr v, vs;
	if(str.length()==0){
		vs.push_back("");
		return vs;
	}
	string a = str.substr(0, 1);
	string b;
	v = printPermutation(str.substr(1));
	for (int i= 0; i < v.size(); ++i){
		for (int j = 0; j <= v[i].length(); ++j) {
			b = v[i].substr(0, j) + a + v[i].substr(j);
			vs.push_back(b);
		}
	}
	return vs;
}


int main(){
	string str = "abcd";
	vStr res;
	res = printPermutation(str);
	for (int i = 0; i < res.size(); ++i) {
		cout<<res[i]<<'\n';
	}
	return 0;
}