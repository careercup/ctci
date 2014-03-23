using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter01
{
    public class Q01_6 : IQuestion
    {
        private void Rotate(int[][] matrix, int n)
        {
            for (int layer = 0; layer < n / 2; ++layer)
            {
                int first = layer;
                int last = n - 1 - layer;
                for (int i = first; i < last; ++i)
                {
                    int offset = i - first;
                    int top = matrix[first][i]; // save top

                    // left -> top
                    matrix[first][i] = matrix[last - offset][first];

                    // bottom -> left
                    matrix[last - offset][first] = matrix[last][last - offset];

                    // right -> bottom
                    matrix[last][last - offset] = matrix[i][last];

                    // top -> right
                    matrix[i][last] = top; // right <- saved top
                }
            }
        }

        public void Run()
        {
            const int size = 3;

            int[][] matrix = AssortedMethods.RandomMatrix(size, size, 0, 9);
            AssortedMethods.PrintMatrix(matrix);
            Rotate(matrix, size);
            Console.WriteLine();
            AssortedMethods.PrintMatrix(matrix);
        }
    }
}
