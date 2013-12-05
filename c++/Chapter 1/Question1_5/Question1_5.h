#ifndef __Question_1_5_h__
#define __Question_1_5_h__

#include <string>

using std::string;

class Question1_5 {
public:
    int run();
    int stringToInt(string value);
    string intToString(int value);
    string charToString(char value);
    int countCompression(string str);
    string compressBetter(string str);
}; 



#endif // __Question_1_5_h__