
using ctci.Contracts;
using System;

namespace Chapter05
{
    public class Q05_1: IQuestion
    {
        static int UpdateBits(int n, int m, int i, int j)
        {
            /* Create a mask to clear bits i  through j in n */
            /* Example i = 2, j = 4. Result should be 11100011.
             * For simplicity, we'll use just 8 bits for the example. */

            // Will equal sequence of all 1's
            const int allOnes = ~0;

            // 1's before position j, then 0s. left = 11100000
            var left = allOnes << (j + 1);

            // 1's after position i. right = 00000011
            var right = ((1 << i) - 1);

            // All 1's, except for 0's between i and i. mask 11100011
            var mask = left | right;

            /* Clear bits j through i then put m in there */
            var nCleared = n & mask; // Clear bits j thorugh i.
            var mShifted = m << i; // Move m into correct position.

            return nCleared | mShifted;// OR them, and we're done
        }

        public void Run()
        {
            Console.WriteLine(UpdateBits(100, 10, 2, 6));
        }
    }
}