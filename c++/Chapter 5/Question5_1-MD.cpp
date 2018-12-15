
#include <iostream>
#include <string>
#include <utility>
#include <algorithm>
#include <cmath>
#include <cstdio>
#include <cctype>
#include <cstdint>
#include <unordered_map>

using namespace std;

string toBinary(int n){
	int bits = static_cast<int>(floor(log2(n)))+1;
	string str(bits, '0');
	for (int i = bits-1, j = 0; j < bits; --i, ++j){
		str[i] = (n & (1 << j)) == 0 ? '0' : '1' ;
	}
	return str;
}

int main(){
	std::ios::sync_with_stdio(false); // http://en.cppreference.com/w/cpp/io/ios_base/sync_with_stdio
	cin.tie(NULL);
	
	int N, M, i, j; // good examples: N = 1024 or 1041, M = 19, i = 2, j = 6.
	cin >> N >> M >> i >> j;

	cout << "N = " << toBinary(N) <<".\tM = " << toBinary(M) << endl; 

	M <<= i;
	int mask = (~0 << j+1) | (1 << i)-1; // clear space for M
	N &= mask;
	N |= M;

	cout << N << " = " << toBinary(N) << endl;

	return 0;
}