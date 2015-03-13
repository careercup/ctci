#include<iostream>
#include<string>
#include "Question1_8.h"

using namespace std;

bool Question1_8::isRotation(const string& s1, const string& s2)
{
    int len = s1.length();

    if(len == s2.length() && len > 0) 
    {
        string s1s1 = s1 + s1;
        return s1s1.find(s2) != string::npos;
    }

    return false;
}

string Question1_8::result(bool value)
{
    if (value) 
    {
        return "True";
    }

    return "False";
}

int Question1_8::run() 
{
    string a = "apple";
    string b = "leapp";
    cout << "Checking if string: " << a << " is a rotation of string: " << b << ": "
         << result(isRotation(a, b)) << endl;

    a = "james";
    b = "mesje";
    cout << "Checking if string: " << a << " is a rotation of string: " << b << ": "
        << result(isRotation(a, b)) << endl;

    return 0;
}