
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter17
{
    public class Q17_11 : IQuestion
    {
        private static Random _random = new Random();

        int rand7()
        {
            while (true)
            {
                int num = 5 * rand5() + rand5();
                if (num < 21)
                {
                    return num % 7;
                }
            }
        }

        int rand5()
        {
            return _random.Next(0, 100) % 5;
        }

        public void Run()
        {
		    /* Test: call rand7 many times and inspect the results. */
		    int[] arr = new int[7];
		    int test_size = 1000000;
		    for(int k = 0; k < test_size; k++)
            {
                int index = rand7();
			    arr[index]++;
		    }

		    for (int i = 0; i < 7; i++)
            {
			    double percent = 100.0 * arr[i] / test_size;
			    Console.WriteLine(i + " appeared " + percent + "% of the time.");
		    }
        }
    }
}
