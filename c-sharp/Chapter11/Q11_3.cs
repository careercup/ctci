using ctci.Contracts;
using System;
using System.Collections.Generic;
using System.Text;

namespace Chapter11
{
    public class Q11_3 : IQuestion
    {
        /// <summary>
        /// As in the book, returns the correct index (tested)
        /// It's a real kludge though... good initial answer
        /// The code runs in O(logn) time - assuming that all elements are unique. However, with many duplicates, the algorithm is O(n)
        /// </summary>
        /// <param name="a"></param>
        /// <param name="low"></param>
        /// <param name="high"></param>
        /// <param name="x"></param>
        /// <returns></returns>
        public int Search(int[] a, int low, int high, int x)
        {
            while (low <= high)
            {
                int mid = (low + high) / 2;

                if (x == a[mid]) return mid;//Found.....

                else if (a[low] <= a[mid])//We have a sorted array between low and middle indices.
                {
                    if (x > a[mid]) low = mid + 1;//Second half of array
                    else if (x >= a[low]) high = mid - 1;//First half of array
                    else low = mid + 1;//normal case - Second half
                }
                else if (x < a[mid]) high = mid - 1;//First half of array
                else if (x <= a[high]) low = mid + 1;//Second half of array
                else high = mid - 1;//normal case - First half
            }
            return -1;
        }

        /* Another way is to do a pivoted binary search, where you first identify the problematic area, basically start of the originally
         * sorted array. */



        public void Run()
        {
            int[] a = new int[] { 5, 6, 7, 8, 9, 1, 2, 3, 4 };

            Console.WriteLine(Search(a, 0, a.Length, 8));
        }
    }
}
