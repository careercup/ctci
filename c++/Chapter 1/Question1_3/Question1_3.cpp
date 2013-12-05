#include<iostream>
#include<string>
#include<algorithm>
#include "Question1_3.h"

using namespace std;

bool Question1_3::permutation(string a, string b) {
    //check the length of both string and return false if they are not equal.
    if(a.length() != b.length()) {
        return false;
    }
    //sort both strings and compare character by character.
    sort(a.begin(), a.end());
    sort(b.begin(), b.end());
    for(int i = 0; i < a.length(); i++) {
        if(a[i] != b[i]) {
            return false;
        }
    }
    return true;
}

/* Function to print true and false */
string Question1_3::result(bool value) {
    if(value) {
        return "True";
    } else {
        return "False";
    }
}

int Question1_3::run() {
    string a = "apple";
    string b = "papel";
    cout << "Result for " << a << " and " << b << " is "
         << result(permutation(a, b)) << endl;
    return 0;
}
