#include <iostream>
#include <vector>
using namespace std;

void printSubset(vector<vector<int> > &subset, int arr[], int n){
	if(n<0)
		return;
	printSubset(subset, arr, n-1);
	int m = subset.size();
	for (int i=0; i < m; i++){
		vector<int> v;
		for (int j = 0; j < subset[i].size(); j++){
			v.push_back(subset[i][j]);
		}
		v.push_back(arr[n]);
		subset.push_back(v);
	}
	vector<int> v;
	v.push_back(arr[n]);
	subset.push_back(v);
}
int main(){
	int arr[] = {1, 2, 3, 6};
	vector<vector<int> > subset;
	printSubset(subset, arr, 3);
	for (int i=0; i < subset.size(); i++){
		for (int j = 0; j < subset[i].size(); j++){
			cout<<subset[i][j]<<" ";
		}
		cout<<'\n';
	}
}