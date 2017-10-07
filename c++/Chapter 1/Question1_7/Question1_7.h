#ifndef __Question_1_7_h__
#define __Question_1_7_h__

class Question1_7 
{
public:
    /**
    * Since we can't provide variable matrix size in C++, we will do it "the c way" and will provide a 1-dimensional
    * array
    */
    void setZeros(int* matrix, int m, int n);
    void printMatrix(int* matrix, int m, int n);
    int run();
};

#endif // __Question_1_7_h__