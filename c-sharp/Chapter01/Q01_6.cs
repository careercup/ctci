using System;
using ctci.Contracts;
using ctci.Library;

namespace Chapter01
{
    public class Q01_6 : IQuestion
    {
        private void Rotate(int[][] matrix, int n)
        {
            for (var layer = 0; layer < n / 2; ++layer)
            {
                var first = layer;
                var last = n - 1 - layer;
                
                for (var i = first; i < last; ++i)
                {
                    var offset = i - first;
                    var top = matrix[first][i]; // save top

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

            var matrix = AssortedMethods.RandomMatrix(size, size, 0, 9);
            AssortedMethods.PrintMatrix(matrix);
            Rotate(matrix, size);
            Console.WriteLine();
            AssortedMethods.PrintMatrix(matrix);
        }
    }
}