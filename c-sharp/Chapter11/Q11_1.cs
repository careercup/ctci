
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter11
{
    public class Q11_1 : IQuestion
    {
        /// <summary>
        /// Merges array
        /// </summary>
        /// <param name="a">first array</param>
        /// <param name="b">second array</param>
        /// <param name="lastA">number of "real" elements in a</param>
        /// <param name="lastB">number of "real" elements in b</param>
        void Merge(int[] a, int[] b, int lastA, int lastB)
        {
            int indexMerged = lastB + lastA - 1; /* Index of last location of merged array */
            int indexA = lastA - 1; /* Index of last element in array b */
            int indexB = lastB - 1; /* Index of last element in array a */

            /* Merge a and b, starting from the last element in each */
            while (indexB >= 0)
            {
                if (indexA >= 0 && a[indexA] > b[indexB])
                { /* end of a is bigger than end of b */
                    a[indexMerged] = a[indexA]; // copy element
                    indexA--;
                }
                else
                {
                    a[indexMerged] = b[indexB]; // copy element
                    indexB--;
                }
                indexMerged--; // move indices			
            }
        }

        public void Run()
        {
		    int[] a = new int[]{2, 3, 4, 5, 6, 8, 10, 100, 0, 0, 0, 0, 0, 0};
		    int[] b = new int[]{1, 4, 7, 6, 7, 7};
		    Merge(a, b, 8, 6);
		    Console.WriteLine(AssortedMethods.ArrayToString(a));
        }
    }
}
