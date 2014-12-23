using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter01
{
    public class Q01_7 : IQuestion
    {
        void NullifyRow(int[][] matrix, int row)
        {
            for (int j = 0; j < matrix[0].Length; j++)
            {
                matrix[row][j] = 0;
            }
        }

        void NullifyColumn(int[][] matrix, int col)
        {
            for (int i = 0; i < matrix.Length; i++)
            {
                matrix[i][col] = 0;
            }
        }

	    int[][] CloneMatrix(int[][] matrix) {
		    int[][] c = new int[matrix.Length][];
		    for (int i = 0; i < matrix.Length; i++) {
		        c[i] = new int[matrix[0].Length];
			    for (int j = 0; j < matrix[0].Length; j++) {
				    c[i][j] = matrix[i][j];
			    }
		    }
		    return c;
	    }

        bool MatricesAreEqual(int[][] m1, int[][] m2)
        {
            if (m1.Length != m2.Length || m1[0].Length != m2[0].Length)
            {
                return false;
            }

            for (int k = 0; k < m1.Length; k++)
            {
                for (int j = 0; j < m1[0].Length; j++)
                {
                    if (m1[k][j] != m2[k][j])
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        void SetZeros(int[][] matrix)
        {
            bool[] row = new bool[matrix.Length];
            bool[] column = new bool[matrix[0].Length];

            // Store the row and column index with value 0
            for (int i = 0; i < matrix.Length; i++)
            {
                for (int j = 0; j < matrix[0].Length; j++)
                {
                    if (matrix[i][j] == 0)
                    {
                        row[i] = true;
                        column[j] = true;
                    }
                }
            }

            // Nullify rows
            for (int i = 0; i < row.Length; i++)
            {
                if (row[i])
                {
                    NullifyRow(matrix, i);
                }
            }

            // Nullify columns
            for (int j = 0; j < column.Length; j++)
            {
                if (column[j])
                {
                    NullifyColumn(matrix, j);
                }
            }
        }

        void SetZeros2(int[][] matrix)
        {
            bool rowHasZero = false;
            bool colHasZero = false;

            // Check if first row has a zero
            for (int j = 0; j < matrix[0].Length; j++)
            {
                if (matrix[0][j] == 0)
                {
                    rowHasZero = true;
                    break;
                }
            }

            // Check if first column has a zero
            for (int i = 0; i < matrix.Length; i++)
            {
                if (matrix[i][0] == 0)
                {
                    colHasZero = true;
                    break;
                }
            }

            // Check for zeros in the rest of the array
            for (int i = 1; i < matrix.Length; i++)
            {
                for (int j = 1; j < matrix[0].Length; j++)
                {
                    if (matrix[i][j] == 0)
                    {
                        matrix[i][0] = 0;
                        matrix[0][j] = 0;
                    }
                }
            }

            // Nullify rows based on values in first column
            for (int i = 1; i < matrix.Length; i++)
            {
                if (matrix[i][0] == 0)
                {
                    NullifyRow(matrix, i);
                }
            }

            // Nullify columns based on values in first row
            for (int j = 1; j < matrix[0].Length; j++)
            {
                if (matrix[0][j] == 0)
                {
                    NullifyColumn(matrix, j);
                }
            }

            // Nullify first row
            if (rowHasZero)
            {
                NullifyRow(matrix, 0);
            }

            // Nullify first column
            if (colHasZero)
            {
                NullifyColumn(matrix, 0);
            }
        }

        public void Run()
        {
		    int nrows = 10;
		    int ncols = 15;
		    int[][] matrix1 = AssortedMethods.RandomMatrix(nrows, ncols, 0, 100);
            int[][] matrix2 = CloneMatrix(matrix1);

		    AssortedMethods.PrintMatrix(matrix1);

            SetZeros(matrix1);
            SetZeros2(matrix2);

            Console.WriteLine();
		
		    AssortedMethods.PrintMatrix(matrix1);
            Console.WriteLine();
		    AssortedMethods.PrintMatrix(matrix2);
		
		    if (MatricesAreEqual(matrix1, matrix2)) {
			    Console.WriteLine("Equal");
		    } else {
			    Console.WriteLine("Not Equal");
		    }            
        }
    }
}
