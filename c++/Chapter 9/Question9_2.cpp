#include <iostream>
#include <cstring>
#include <vector>
using namespace std;

int getPath(int x, int y, vector<vector<int> > &vec){
	if(vec[x][y])
		return vec[x][y];
	if(x==0 || y==0){
		if(x==0 && y==0)
			vec[x][y] = 1;
		else if(x==0)
			vec[x][y] = getPath(x, y-1, vec);
		else
			vec[x][y] = getPath(x-1, y, vec);
	}
	else
		vec[x][y] = getPath(x-1, y, vec) + getPath(x, y-1, vec);
	return vec[x][y];
}

void pint(){
	cout<<"@"<<'\n';
}

int getPath1(int x, int y, vector<vector<int> > &vec){
	if(vec[x][y]){
		if(vec[x][y] != -1)
			return vec[x][y];
		return 0;
	}
	if(x==0 || y==0){
		if(x==0 && y==0)
			vec[x][y] = 1;
		else if(x==0)
			vec[x][y] = getPath1(x, y-1, vec);
		else
			vec[x][y] = getPath1(x-1, y, vec);
	}
	else{
		vec[x][y] = getPath1(x-1, y, vec) + getPath1(x, y-1, vec);
	}
	return vec[x][y];
}

int main(){
	int X=3;
	int Y=3;
	vector<vector<int> > a;
	a.resize(X);
	for(int i=0; i<X; i++)
		a[i].resize(Y);
	cout<<getPath(X-1, Y-1, a)<<'\n';
	a[0][2] = -1;

	//Huddle represented as -1
	vector<vector<int> > b;
	b.resize(X);
	for(int i=0; i<X; i++)
		b[i].resize(Y);
	b[0][1] = -1;
	cout<<getPath1(X-1, Y-1, b)<<'\n';
	return 0;
}