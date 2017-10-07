#ifndef __Question_1_4_h__
#define __Question_1_4_h__
#include <memory>

class Question1_4 
{
public:
    int run();
    void replaceSpaces(std::unique_ptr<char[]>&, int length);
}; 

#endif // __Question_1_4_h__