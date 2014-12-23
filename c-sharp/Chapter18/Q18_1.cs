
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter18
{
    public class Q18_1 : IQuestion
    {
        static Random _random = new Random();

        int add(int a, int b)
        {
            if (b == 0) return a;
            int sum = a ^ b; // add without carrying
            int carry = (a & b) << 1; // carry, but don’t add
            return add(sum, carry); // recurse
        }

        int randomInt(int n)
        {
            return (int)(_random.Next() * n);
        }

        public void Run()
        {
		    for (int i = 0; i < 100; i++)
            {
			    int a = randomInt(10);
			    int b = randomInt(10);
			    int sum = add(a, b);
			    Console.WriteLine(a + " + " + b + " = " + sum);
		    }
        }
    }
}
