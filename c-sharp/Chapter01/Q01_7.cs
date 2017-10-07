
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter01
{
    public class Q01_7 : IQuestion
    {
        void NullifyRow(int[][] matrix, int row)
        {
            for (var j = 0; j < matrix[0].Length; j++)
            {
                matrix[row][j] = 0;
            }
        }

        void NullifyColumn(int[][] matrix, int col)
        {
            for (var i = 0; i < matrix.Length; i++)
            {
                matrix[i][col] = 0;
            }
        }

	    int[][] CloneMatrix(int[][] matrix) 
        {
		    var clone = new int[matrix.Length][];

		    for (var i = 0; i < matrix.Length; i++) 
            {
		        clone[i] = new int[matrix[0].Length];
			
                for (var j = 0; j < matrix[0].Length; j++) 
                {
				    clone[i][j] = matrix[i][j];
			    }
		    }

		    return clone;
	    }

        bool MatricesAreEqual(int[][] matrix1, int[][] matrix2)
        {
            if (matrix1.Length != matrix2.Length || matrix1[0].Length != matrix2[0].Length)
            {
                return false;
            }

            for (var k = 0; k < matrix1.Length; k++)
            {
                for (var j = 0; j < matrix1[0].Length; j++)
                {
                    if (matrix1[k][j] != matrix2[k][j])
                    {
                        return false;
                    }
                }
            }

            return true;
        }

        void SetZeros(int[][] matrix)
        {
            var row = new bool[matrix.Length];
            var column = new bool[matrix[0].Length];

            // Store the row and column index with value 0
            for (var i = 0; i < matrix.Length; i++)
            {
                for (var j = 0; j < matrix[0].Length; j++)
                {
                    if (matrix[i][j] == 0)
                    {
                        row[i] = true;
                        column[j] = true;
                    }
                }
            }

            // Nullify rows
            for (var i = 0; i < row.Length; i++)
            {
                if (row[i])
                {
                    NullifyRow(matrix, i);
                }
            }

            // Nullify columns
            for (var j = 0; j < column.Length; j++)
            {
                if (column[j])
                {
                    NullifyColumn(matrix, j);
                }
            }
        }

        void SetZeros2(int[][] matrix)
        {
            var rowHasZero = false;
            var colHasZero = false;

            // Check if first row has a zero
            for (var j = 0; j < matrix[0].Length; j++)
            {
                if (matrix[0][j] == 0)
                {
                    rowHasZero = true;
                    break;
                }
            }

            // Check if first column has a zero
            for (var i = 0; i < matrix.Length; i++)
            {
                if (matrix[i][0] == 0)
                {
                    colHasZero = true;
                    break;
                }
            }

            // Check for zeros in the rest of the array
            for (var i = 1; i < matrix.Length; i++)
            {
                for (var j = 1; j < matrix[0].Length; j++)
                {
                    if (matrix[i][j] == 0)
                    {
                        matrix[i][0] = 0;
                        matrix[0][j] = 0;
                    }
                }
            }

            // Nullify rows based on values in first column
            for (var i = 1; i < matrix.Length; i++)
            {
                if (matrix[i][0] == 0)
                {
                    NullifyRow(matrix, i);
                }
            }

            // Nullify columns based on values in first row
            for (var j = 1; j < matrix[0].Length; j++)
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
		    const int numberOfRows = 10;
		    const int numberOfColumns = 15;
		    var matrix1 = AssortedMethods.RandomMatrix(numberOfRows, numberOfColumns, 0, 100);
            var matrix2 = CloneMatrix(matrix1);

		    AssortedMethods.PrintMatrix(matrix1);

            SetZeros(matrix1);
            SetZeros2(matrix2);

            Console.WriteLine();
		
		    AssortedMethods.PrintMatrix(matrix1);
            Console.WriteLine();
		    AssortedMethods.PrintMatrix(matrix2);
		
            Console.WriteLine(MatricesAreEqual(matrix1, matrix2) ? "Equal" : "Not Equal");
        }
    }
}