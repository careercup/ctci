
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter17
{
    public class Q17_12 : IQuestion
    {
	    void printPairSums(int[] array, int sum)
        {
		    Array.Sort<int>(array);
		    int first = 0;
		    int last = array.Length - 1;
		    while (first < last) {
			    int s = array[first] + array[last];
			    if (s == sum) {
				    Console.WriteLine(array[first] + " " + array[last]);
				    ++first;
				    --last;
			    } else {
				    if (s < sum) {
					    ++first;
				    } else {
					    --last;
				    }
			    }
		    }
	    }

        public void Run()
        {
            int[] test = { 9, 3, 6, 5, 7, -1, 13, 14, -2, 12, 0 };
            printPairSums(test, 12);
        }
    }
}
