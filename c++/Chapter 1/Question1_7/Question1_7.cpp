#include <iostream>
#include "Question1_7.h"

using namespace std;

void Question1_7::setZeros(int* matrix, int m, int n) 
{
    // Assuming M,N <= 32, we'll use a bit vector to represent whether a row/col should be set with zeros.
    int m_rows = 0;
    int m_cols = 0;

    for (int i = 0; i < m; ++i) 
    {
        for (int j = 0; j < n; ++j) 
        {
            if (matrix[i * n + j] == 0) 
            {
                m_rows |= (1 << i);
                m_cols |= (1 << j);
            }
        }
    }

    for (int i = 0; i < m; ++i) 
    {
        for (int j = 0; j < n; ++j) 
        {
            if (((m_rows & (1 << i)) != 0) || ((m_cols & (1 << j)) != 0)) 
            {
                matrix[i * n + j] = 0;
            }
        }
    }
}

void Question1_7::printMatrix(int* matrix, int m, int n) 
{
    for (int i = 0; i < m; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            cout << matrix[i * n + j] << " ";
        }

        cout << endl;
    }
}


int Question1_7::run() 
{
    int matrix[4][5] ={{1, 2, 3, 4, 5},
                       {6, 7, 8, 9, 10},
                       {11, 12, 0, 14, 15},
                       {16, 17, 18, 0, 20}};
    int* matrixPtr = (int*)matrix;
    cout << "original matrix is :" << endl;
    printMatrix(matrixPtr, 4, 5);
    
    setZeros(matrixPtr, 4, 5);
    cout << "zeroed matrix is: " << endl;
    printMatrix(matrixPtr, 4, 5);
 
    return 0;
}