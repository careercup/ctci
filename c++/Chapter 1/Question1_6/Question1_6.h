#ifndef __Question_1_6_h__
#define __Question_1_6_h__

class Question1_6 
{
public:
    /**
     * Since we can't provide variable matrix size in C++, we will do it "the c way" and will provide a 1-dimensional
     * array
     */
    void rotate(int* matrix, int n);
    void printMatrix(int* matrix, int m, int n);
    int run();
};

#endif // __Question_1_6_h__