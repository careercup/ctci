#include<iostream>
#include<queue>
#include<climits>
using namespace std;

class animal{
private:
    queue<int> dog, cat;
    int order;
public:
    animal(){
        order = 1;
    }
    void enque(string a){
        if(a=="dog"){
            dog.push(order);
            order++;
        }
        else if(a=="cat"){
            cat.push(order);
            order++;
        }
        return;
    }
    int dequeAny(){
        int tmp;
        if(dog.front()>cat.front()){
            tmp = cat.front();
            cat.pop();
        }
        else{
            tmp = dog.front();
            dog.pop();
        }
        return tmp;
    }
    int dequeDog(){
        if(dog.empty()){
            return INT_MIN;
        }
        int tmp = dog.front();
        dog.pop();
        return tmp;
    }
    int dequeCat(){
        if(cat.empty()){
            return INT_MIN;
        }
        int tmp = cat.front();
        cat.pop();
        return tmp;

    }
};

int main(){
    animal a;
    a.enque("dog");
    a.enque("cat");
    a.enque("dog");
    a.enque("dog");
    a.enque("cat");
    a.enque("dog");
    cout<<a.dequeAny()<<'\n';
    cout<<a.dequeDog()<<'\n';
}
