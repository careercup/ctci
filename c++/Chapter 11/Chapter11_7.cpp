#include <iostream>
#include <vector>
using namespace std;

struct htWt {
	int height, weight;
};

void sortHeight(htWt arr[], int n) {
	for (int i=0; i<n; i++) {
		for (int j=0; j<n-1; j++){
			if (arr[j].height>arr[j+1].height) {
				htWt tmp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = tmp;
			}

		}
	}
}

int getIncreasingSequence(htWt arr[], int n) {
	sortHeight(arr, n);
	vector<vector<int> > wt;
	for (int i=0; i<n; i++) {
		bool flag = true;
		for (int j=0; j<wt.size(); j++) {
			if (arr[i].weight >= wt[j].back()) {
				flag = false;
				wt[j].push_back(arr[i].weight);
			}
		}
		if (flag) {
			vector<int> v;
			v.push_back(arr[i].weight);
			wt.push_back(v);
		}
	}
	int max = 0;
	for (int i=0; i<wt.size(); i++) {
		if (max < wt[i].size())
			max = wt[i].size();
	}
	return max;
}

int main(){
	htWt arr[] = {{12, 13}, {11, 15}, {9, 20}, {20, 20}, {40, 21}, {8, 42}};
	cout<<getIncreasingSequence(arr, 6);
	return 0;
}