#include<iostream>
#include<string>
#include<algorithm>
#include "Question1_3_B.h"

using namespace std;

bool Question1_3_B::permutation(const string& a, const string& b) 
{
    if (a.length() != b.length()) 
    {
        return false;
    }

    int ascii_set[256] = {0};

    for (int i = 0; i < a.length(); i++) 
    {
        int val = static_cast<int>(a[i]);
        ascii_set[val]++;
    }

    for (int i = 0; i < b.length(); i++) 
    {
        int val = static_cast<int>(b[i]);

        if ((--ascii_set[val]) < 0) 
        {
            return false;
        }
    }

    return true;
}

string Question1_3_B::result(bool value) 
{
    if (value) 
    {
        return "True";
    }

    return "False";
}

int Question1_3_B::run() 
{
    string a = "apple";
    string b = "papel";

    cout << "Result for " << a << " and " << b << " is " << result(permutation(a, b)) << endl;
    
    return 0;
}