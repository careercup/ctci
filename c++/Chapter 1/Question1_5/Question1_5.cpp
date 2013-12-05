#include<iostream>
#include<string>
#include<sstream>
using namespace std;

//method to convert string to integer. C11 provides new methods to do the same.
int stringToInt(string value) {
    int temp;
    stringstream(value) >> temp;
    return temp;
}

//method to convert integer to string. C11 provides new method to do the same.
string intToString(int value) {
    string temp;
    stringstream convert;
    convert << value;
    temp = convert.str();
    return temp;
}

//method to convert single character to string. C11 provides new method to do the same.
string charToString(char value) {
    string temp;
    stringstream ss;
    ss << value;
    ss >> temp;
    return temp;
}

int countCompression(string str) {
    if (str.length() == 0)
        return 0;
    char last = str.at(0);
    int size = 0;
    int count = 1;

    for (int i = 1; i < str.length(); i++) {
        if (str.at(i) == last) {
            count++;
        } else {
            last = str.at(i);
            size = size + 1 + intToString(count).length();
            count = 1;
        }
    }
    size = size + 1 + intToString(count).length();
    return size;
}

string compressBetter(string str) {
    int size = countCompression(str);
    if (size >= str.length()) {
        return str;
    }
    string newstr;
    char last = str.at(0);
    int count = 1;
    for (int i = 1; i < str.length(); i++) {
        if (str.at(i) == last) {
            count++;
        } else {
            newstr.append(charToString(last));
            newstr.append(intToString(count));
            last = str.at(i);
            count = 1;
        }
    }
    newstr.append(charToString(last));
    newstr.append(intToString(count));
    return newstr;
}

int main() {
    string str = "abbccccccde";
    string newstr = compressBetter(str);
    cout << "Original string is " << str << endl;
    cout << "Compressed string is " << newstr << endl;
    return 0;
}
