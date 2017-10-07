
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter05
{
    public class Q05_6 : IQuestion
    {
        public static int SwapOddEvenBits(int x)
        {
            return (int)(((x & 0xaaaaaaaa) >> 1) | ((x & 0x55555555) << 1));
        } 

        public void Run()
        {
		    var a = 103217;
		    Console.WriteLine(a + ": " + AssortedMethods.ToFullBinarystring(a));
            var b = SwapOddEvenBits(a);
            Console.WriteLine(b + ": " + AssortedMethods.ToFullBinarystring(b));
        }
    }
}