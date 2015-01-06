#include <iostream>
#include "Chapter11.h"
#include <map>
#include <vector>
using namespace std;

typedef map<string, vector<string> > mvs;

void sortAnagramWise(string arr[], int n){
	mvs Map;
	for(int i=0; i<n; i++) {
		string tmp = arr[i];
		bubbleSort(arr[i], 0, arr[i].length()-1);
		Map[arr[i]].push_back(tmp);
	}
		mvs::iterator iter = Map.begin();
	int ind=0;
	for (; iter != Map.end(); ++iter) {
		vector<string> tmp = iter->second;
		for (int i = 0; i < tmp.size(); ++i) {
			arr[ind]=tmp[i];
			ind++;
		}
	}
}

int main(){
	string arr[] = {"abc", "bca", "aaaa", "abccde", "edbcac", "cbed", "cdeb"};
	sortAnagramWise(arr, 7);
	for (int i = 0; i < 7; ++i)
		cout<<arr[i]<<'\n';
	return 0;
}
