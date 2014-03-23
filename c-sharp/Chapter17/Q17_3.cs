
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter17
{
    public class Q17_3 : IQuestion
    {
        int factorsOf5(int i)
        {
            int count = 0;
            while (i % 5 == 0)
            {
                count++;
                i /= 5;
            }
            return count;
        }

        int countFactZeros(int num)
        {
            int count = 0;
            for (int i = 2; i <= num; i++)
            {
                count += factorsOf5(i);
            }
            return count;
        }

	    int countFactZerosMoreEfficient(int num)
        {
		    int count = 0;
		    if (num < 0) {
                Console.WriteLine("Factorial is not defined for negative numbers");
			    return 0;
		    }
		    for (int i = 5; num / i > 0; i *= 5) {
			    count += num / i;
		    }
		    return count;
	    }

        int factorial(int num)
        {
            if (num == 1)
            {
                return 1;
            }
            else if (num > 1)
            {
                return num * factorial(num - 1);
            }
            else
            {
                return -1; // Error
            }
        }

        public void Run()
        {
		    for (int i = 1; i < 12; i++)
            {
                Console.WriteLine(i + "! (or " + factorial(i) + ") has " + countFactZerosMoreEfficient(i) + " zeros");
		    }
        }
    }
}
