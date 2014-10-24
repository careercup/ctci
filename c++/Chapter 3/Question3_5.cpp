#include<iostream>
#include <stack>
#include<climits>
using namespace std;

class Queue{
private:
    stack<int> pri, buff;
public:
    void EnQueue(int data){
        while(!buff.empty()){
            pri.push(buff.top());
            buff.pop();
        }
        pri.push(data);
    }
    int DeQueue(){
        if(pri.empty() && buff.empty()){
            return INT_MIN;
        }
        while(!pri.empty()){
            buff.push(pri.top());
            pri.pop();
        }
        int tmp = buff.top();
        buff.pop();
        return tmp;
    }
    int size(){
        return pri.size() + buff.size();
    }

};

int main(){
    Queue q;
    for(int i=0; i<10; i++)
        q.EnQueue(i);
    cout<<q.DeQueue()<<'\n';
    cout<<q.DeQueue()<<'\n';
    for(int i=10; i<20; i++){
        q.EnQueue(i);
    }
    cout<<q.DeQueue()<<" ";
    cout<<q.DeQueue()<<'\n';

}
