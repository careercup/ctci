
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter05
{
    public class Q05_5 : IQuestion
    {
        public static int BitSwapRequired(int number1, int number2)
        {
            var count = 0;

            for (var c = number1 ^ number2; c != 0; c = c >> 1)
            {
                count += c & 1;
            }

            return count;
        }

        public static int BitSwapRequired2(int number1, int number2)
        {
            var count = 0;

            for (var c = number1 ^ number2; c != 0; c = c & (c - 1))
            {
                count++;
            }

            return count;
        }

        public void Run()
        {
            var a = 23432;
            var b = 512132;
            Console.WriteLine(a + ": " + AssortedMethods.ToFullBinarystring(a));
            Console.WriteLine(b + ": " + AssortedMethods.ToFullBinarystring(b));

            var nbits = BitSwapRequired(a, b);
            var nbits2 = BitSwapRequired2(a, b);

            Console.WriteLine("Required number of bits: " + nbits + " " + nbits2);
        }
    }
}