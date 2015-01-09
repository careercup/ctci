#include <iostream>
#include <cstring>
using namespace std;

int makeChange(int n, int prev){
	if (n == 0)
		return 1;
	int ways = 0;
	if(n > 0) {
		if (prev >= 25)
			ways += makeChange(n-25, 25);
		if(prev >= 10)
			ways += makeChange(n-10, 10);
		if(prev >= 5)
			ways += makeChange(n-5, 5);
		if(prev >= 1)
			ways += 1;
	}
	return ways;
}

int makeChange1(int n, int denom){
    int next_denom = 0;
    switch(denom){
    case 25:
        next_denom = 10;
        break;
    case 10:
        next_denom = 5;
        break;
    case 5:
        next_denom = 1;
        break;
    case 1:
        return 1;
    }
    int ways = 0;
    for(int i=0; i*denom<=n; ++i)
        ways += makeChange1(n-i*denom, next_denom);
    return ways;
}

int main(){
	int n = 100;
	int count = 0;
	cout<<makeChange(n, 25)<<'\n';
	cout<<makeChange1(n, 25);
	return 0;
}