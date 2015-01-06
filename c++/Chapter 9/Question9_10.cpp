#include <iostream>
#include <map>
#include <vector>
#include <cstdio>
using namespace std;

class box {
private:
	float h, w, d;	
public:
	box(float H, float W, float D){
		h = H;
		w = W;
		d =	D;
	}
	bool canBeAbove(box B);
	float getDepth();
};

bool box::canBeAbove(box B){
	if (h<B.h && w<B.w && d<B.d)
		return true;
	return false;
}

float box::getDepth(){
	return d;
}

typedef vector<box> vb;
typedef map<int, vb> mvb;

float stackHeight(vb Boxes){
	float height = 0;
	for (int i = 0; i < Boxes.size(); ++i) {
		height += Boxes[i].getDepth();
	}
	return height;
}

void print(){
	cout<<"@";
}

vb createStack(mvb &Map, vb Boxes, int bottom) {
	if (Map.count(bottom)!= 0 && bottom < Boxes.size()) {
		return Map[bottom];
	}
	int max_height = 0;
	vb max_stack;
	if (bottom >= Boxes.size()) {
		return max_stack;
	}
	for (int i = 0; i < Boxes.size(); ++i) {
		if (Boxes[i].canBeAbove(Boxes[bottom])) {
			vb tmpStack = createStack(Map, Boxes, i);
			int tmpHeight = stackHeight(tmpStack);
			if (tmpHeight > max_height) {
				print();
				max_stack = tmpStack;
				max_height = tmpHeight;
			}
		}
	}
	//Push Boxes[bottom] to font hee
	max_stack.push_back(Boxes[bottom]);
	
	Map[bottom] = max_stack;
	return max_stack;
}

int main(){
	freopen("Question9_10.in", "r", stdin);
	int n;
	cin>>n;
	mvb Map;
	vb Boxes, result;
	float H, W, D;
	for (int i = 0; i < n; ++i) {
		cin>>H>>W>>D;
		Boxes.push_back(box(H, W, D));
	}
	result = createStack(Map, Boxes, 0);
	for (int i = 0; i < result.size(); ++i) {
		cout<<result[i].getDepth()<<" ";
	}
	return 0;
}
