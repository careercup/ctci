#include<iostream>
using namespace std;

struct node{
	int val, preIndex;
};

class stack3{

public:
	stack3(int totalSize = 900){
		buf = new node[totalSize];
		stop[0]=stop[1]=stop[2]=-1;
		this->totalSize = totalSize;
		cur=0;
	}
	~stack3(){
		delete[] buf;
    }
    void push(int stackNum, int data){
    	if(cur>totalSize){
    		cout<<"Stack is full"<<'\n';
    	}
    	buf[cur].val = data;
    	buf[cur].preIndex = stop[stackNum];
    	stop[stackNum] = cur;
    	cur++;
    }
    void pop(int stackNum){
    	if(cur<=0){
    		cout<<"Stack is empty"<<'\n';
    	}
    	stop[stackNum] = buf[stop[stackNum]].preIndex;
    }
    int top(int stackNum){
    	return buf[stop[stackNum]].val;
    }
    bool empty(int stackNum){
    	return stop[stackNum]==-1;
    }
private:
	node *buf;
	int stop[3];
	int totalSize;
	int cur;
};

int main(){
	stack3 mystack;//stack3 mystack;
    for(int i=0; i<10; ++i)
        mystack.push(0, i);
    for(int i=10; i<20; ++i)
        mystack.push(1, i);
    for(int i=100; i<110; ++i)
        mystack.push(2, i);
    for(int i=0; i<3; ++i)
        cout<<mystack.top(i)<<" ";

    cout<<endl;
    for(int i=0; i<3; ++i){
        mystack.pop(i);
        cout<<mystack.top(i)<<" ";
    }
    mystack.push(0, 111);
    mystack.push(1, 222);
    mystack.push(2, 333);
    for(int i=0; i<3; ++i)
        cout<<mystack.top(i)<<" ";
    return 0;
}