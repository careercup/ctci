
using ctci.Contracts;
using System;
using ctci.Library;

namespace Chapter05
{
    public class Q05_3 : IQuestion
    {
        public static int CountOnes(int number)
        {
            var count = 0;

            while (number > 0)
            {
                if ((number & 1) == 1)
                {
                    count++;
                }

                number = number >> 1;
            }

            return count;
        }

        public static int CountZeros(int number)
        {
            return 32 - CountOnes(number);
        }

        public static bool HasValidNext(int number)
        {
            if (number == 0)
            {
                return false;
            }
            var count = 0;

            while ((number & 1) == 0)
            {
                number >>= 1;
                count++;
            }

            while ((number & 1) == 1)
            {
                number >>= 1;
                count++;
            }

            if (count == 31)
            {
                return false;
            }

            return true;
        }

        public static bool HasValidPrev(int number)
        {
            while ((number & 1) == 1)
            {
                number >>= 1;
            }

            if (number == 0)
            {
                return false;
            }

            return true;
        }

        public static int GetNextSlow(int number)
        {
            if (!HasValidNext(number))
            {
                return -1;
            }

            var numOnes = CountOnes(number);
            number++;

            while (CountOnes(number) != numOnes)
            {
                number++;
            }

            return number;
        }

        public static int GetPrevSlow(int number)
        {
            if (!HasValidPrev(number))
            {
                return -1;
            }

            var numOnes = CountOnes(number);
            number--;

            while (CountOnes(number) != numOnes)
            {
                number--;
            }

            return number;
        }

        public static int GetNext(int number)
        {
            var c = number;
            var c0 = 0;
            var c1 = 0;

            while (((c & 1) == 0) && (c != 0))
            {
                c0++;
                c >>= 1;
            }

            while ((c & 1) == 1)
            {
                c1++;
                c >>= 1;
            }

            /* If c is 0, then n is a sequence of 1s followed by a sequence of 0s. This is already the biggest
             * number with c1 ones. Return error.
             */
            if (c0 + c1 == 31 || c0 + c1 == 0)
            {
                return -1;
            }

            int pos = c0 + c1; // position of right-most non-trailing zero (where the right most bit is bit 0)

            /* Flip the right-most non-trailing zero (which will be at position pos) */
            number |= (1 << pos); // Flip right-most non-trailing zero

            /* Clear all bits to the right of pos.
             * Example with pos = 5 
             * (1) Shift 1 over by 5 to create 0..0100000           [ mask = 1 << pos ]
             * (2) Subtract 1 to get 0..0011111                     [ mask = mask - 1 ]
             * (3) Flip all the bits by using '~' to get 1..1100000 [ mask = ~mask    ]
             * (4) AND with n
             */
            number &= ~((1 << pos) - 1); // Clear all bits to the right of pos

            /* Put (ones-1) 1s on the right by doing the following:
             * (1) Shift 1 over by (ones-1) spots. If ones = 3, this gets you 0..0100
             * (2) Subtract one from that to get 0..0011
             * (3) OR with n
             */
            number |= (1 << (c1 - 1)) - 1;

            return number;
        }

        public static int GetNextArith(int number)
        {
            var c = number;
            var c0 = 0;
            var c1 = 0;

            while (((c & 1) == 0) && (c != 0))
            {
                c0++;
                c >>= 1;
            }

            while ((c & 1) == 1)
            {
                c1++;
                c >>= 1;
            }

            /* If c is 0, then n is a sequence of 1s followed by a sequence of 0s. This is already the biggest
             * number with c1 ones. Return error.
             */
            if (c0 + c1 == 31 || c0 + c1 == 0)
            {
                return -1;
            }

            /* Arithmetically:
             * 2^c0 = 1 << c0
             * 2^(c1-1) = 1 << (c0 - 1)
             * next = n + 2^c0 + 2^(c1-1) - 1;
             */

            return number + (1 << c0) + (1 << (c1 - 1)) - 1;
        }

        public static int GetPrev(int number)
        {
            var temp = number;
            var c0 = 0;
            var c1 = 0;

            while ((temp & 1) == 1)
            {
                c1++;
                temp >>= 1;
            }

            /* If temp is 0, then the number is a sequence of 0s followed by a sequence of 1s. This is already
             * the smallest number with c1 ones. Return -1 for an error.
             */
            if (temp == 0)
            {
                return -1;
            }

            while (((temp & 1) == 0) && (temp != 0))
            {
                c0++;
                temp >>= 1;
            }

            var p = c0 + c1; // position of right-most non-trailing one (where the right most bit is bit 0)

            /* Flip right-most non-trailing one. 
             * Example: n = 00011100011.
             * c1 = 2
             * c0 = 3
             * pos = 5
             * 
             * Build up a mask as follows:
             * (1) ~0 will be a sequence of 1s
             * (2) shifting left by p + 1 will give you 11.111000000 (six 0s) 
             * (3) ANDing with n will clear the last 6 bits
             * n is now 00011000000
             */
            number &= ((~0) << (p + 1)); // clears from bit p onwards (to the right)

            /* Create a sequence of (c1+1) 1s as follows
             * (1) Shift 1 to the left (c1+1) times. If c1 is 2, this will give you 0..001000
             * (2) Subtract one from that. This will give you 0..00111
             */
            var mask = (1 << (c1 + 1)) - 1; // Sequence of (c1+1) ones

            /* Move the ones to be right up next to bit p 
             * Since this is a sequence of (c1+1) ones, and p = c1 + c0, we just need to
             * shift this over by (c0-1) spots.
             * If c0 = 3 and c1 = 2, then this will look like 00...0011100
             * 
             * Then, finally, we OR this with n.
             */
            number |= mask << (c0 - 1);

            return number;
        }

        public static int GetPrevArith(int number)
        {
            var temp = number;
            var c0 = 0;
            var c1 = 0;

            while (((temp & 1) == 1) && (temp != 0))
            {
                c1++;
                temp >>= 1;
            }

            /* If temp is 0, then the number is a sequence of 0s followed by a sequence of 1s. This is already
             * the smallest number with c1 ones. Return -1 for an error.
             */
            if (temp == 0)
            {
                return -1;
            }

            while ((temp & 1) == 0 && (temp != 0))
            {
                c0++;
                temp >>= 1;
            }

            /* Arithmetic:
             * 2^c1 = 1 << c1
             * 2^(c0 - 1) = 1 << (c0 - 1)
             */
            return number - (1 << c1) - (1 << (c0 - 1)) + 1;
        }

        public static void BinPrint(int number) 
        {
            Console.WriteLine(number + ": " + AssortedMethods.ToFullBinarystring(number));		
	    }

        public void Run()
        {
            // TODO: Fix this (ported from Java but does not seem to function properly)
		    for (var i = 0; i < 200; i++) 
            {
                var p1 = GetPrevSlow(i);
                var p2 = GetPrev(i);
                var p3 = GetPrevArith(i);

                var n1 = GetNextSlow(i);
                var n2 = GetNext(i);
                var n3 = GetNextArith(i);
			
			    if (p1 != p2 || p2 != p3 || n1 != n2 || n2 != n3) 
                {
				    BinPrint(i);
				    BinPrint(p1);
				    BinPrint(p2);
				    BinPrint(p3);
				    BinPrint(n1);
				    BinPrint(n2);
				    BinPrint(n3);
				    Console.WriteLine("");
			    }			
		    }

            Console.WriteLine("Done!");
        }
    }
}