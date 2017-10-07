#ifndef __Question_1_5_h__
#define __Question_1_5_h__

#include <string>

using std::string;

class Question1_5 
{
public:
    int run();
    int stringToInt(const string& value);
    string intToString(int value);
    int countCompression(const string& str);

    /// C++ std::string is efficient and no need to use a "StringBuffer"-like structure.
    string compressBetter(const string& str);
}; 



#endif // __Question_1_5_h__