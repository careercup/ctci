#include<iostream>
#include "Question1_2.h"

using std::cout;
using std::endl;

void Question1_2::reverse(char* str) 
{
    char *ptrEnd = str;
    char temp;

    if (str) 
    {
        size_t length = sizeof(str) / sizeof(char);
        ptrEnd = &str[length-1];
        
        while (str < ptrEnd) 
        {
            temp = *str;
            *str++ = *ptrEnd;
            *ptrEnd-- = temp;
        }
    }
}

int Question1_2::run() 
{
    char input[][10] = { "abcde", "cat" };

    for (int i = 0; i < 2; i++) 
    {
        cout << "reversing the string: " << input[i] << endl;
        reverse(input[i]);
        cout << "reverse of input string is " << input[i] << endl;
    }

    return 0;
}
