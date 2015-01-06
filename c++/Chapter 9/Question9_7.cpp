#include <iostream>
#include <cstdio>
using namespace std;

enum Color {
	Bl, Wh, Gr, Bu, Or
};

void paintFill(Color **screen, int m, int n, int x, int y, Color oldColor, Color newColor) {
	//Here x is x-coordinate not no. of rows
	if (x<0 || x>=n || y<0 || y>=m) {
		return;
	}
	if (screen[y][x] == oldColor) {
		screen[y][x] = newColor;
		paintFill(screen, m, n, x-1, y, oldColor, newColor);
		paintFill(screen, m, n, x, y-1, oldColor, newColor);
		paintFill(screen, m, n, x+1, y, oldColor, newColor);
		paintFill(screen, m, n, x, y+1, oldColor, newColor);
	}
	return;
}

int main(){
	freopen("Question9_7.in", "r", stdin);
	int m, n;
	cin>>m>>n;
	Color **screen = new Color*[m];
	for (int i = 0; i < m; ++i) {
		screen[i] = new Color[n];
	}
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			int tmp;
			cin>>tmp;
			screen[i][j] =(Color)tmp;
		}
	}
	cout<<"Original Screen"<<'\n';
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			cout<<screen[i][j]<<" ";
		}
		cout<<'\n';
	}
	paintFill(screen, m, n, 3, 2, Bl, Or);
	cout<<"New Screen"<<'\n';
	for (int i = 0; i < m; ++i) {
		for (int j = 0; j < n; ++j) {
			cout<<screen[i][j]<<" ";
		}
		cout<<'\n';
	}
	return 0;
}
