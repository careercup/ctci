#include<iostream>
#include<string>
using namespace std;

string decimalToBinary(double a){
    if(a<0 || a>= 1)
        return "ERROR!";
    string res="";
    res = res + "0.";
    while(a>0){
        if(res.length()>32){
            return "ERROR!";
        }
        a *=2;
        if(a>=1){
            res =res+"1";
            a -=1.0;
        }
        else{
            res = res+"0";
        }
    }
    return res;
}

int main(){

    double a = 0.125;
    cout<<decimalToBinary(a)<<'\n';
    return 0;
}
