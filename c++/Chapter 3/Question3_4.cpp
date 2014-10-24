#include<iostream>
#include<stack>
using namespace std;

void towerOfHanoi(stack<int> *a, stack<int> *buff, stack<int> *dest, int n){
    if(n==0){
        return;
    }
    towerOfHanoi(a, dest, buff, n-1);
    (*dest).push((*a).top());
    (*a).pop();
    towerOfHanoi(buff, a, dest, n-1);
}

int main(){
    stack<int> primary, buffer, destination;
    int n = 10;
    for(int i=n; i>0; i--)
        primary.push(i);
    towerOfHanoi(&primary, &buffer, &destination, 10);
    while(!destination.empty()){
        cout<<destination.top()<<" ";
        destination.pop();
    }
}
