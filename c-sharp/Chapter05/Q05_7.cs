
using ctci.Contracts;
using ctci.Library;
using System;
using System.Collections.Generic;

namespace Chapter05
{
    public class Q05_7 : IQuestion
    {
        /* Create a random array of numbers from 0 to n, but skip 'missing' */
        public static List<BitInteger> Initialize(int n, int missing)
        {
            BitInteger.IntegerSize = AssortedMethods.ToFullBinarystring(n).Length;
            var array = new List<BitInteger>();

            for (var i = 1; i <= n; i++)
            {
                array.Add(new BitInteger(i == missing ? 0 : i));
            }

            var random = new Random();

            // Shuffle the array once.
            for (var i = 0; i < n; i++)
            {
                var rand = i + (int)(random.Next(1) * (n - i));
                array[i].SwapValues(array[rand]);
            }

            return array;
        }


        public static int FindMissing(List<BitInteger> array)
        {
            return FindMissing(array, BitInteger.IntegerSize - 1);
        }

        private static int FindMissing(List<BitInteger> input, int column)
        {
            // Base case and error condition
    	    if (column < 0) { 
    		    return 0;
    	    }

    	    var oneBits = new List<BitInteger>(input.Count / 2);
    	    var zeroBits = new List<BitInteger>(input.Count / 2);

            foreach (var bitInteger in input) 
            {
                if (bitInteger.Fetch(column) == 0) 
                {
                    zeroBits.Add(bitInteger);
                }
                else
                {
                    oneBits.Add(bitInteger);
                }
            }

            if (zeroBits.Count <= oneBits.Count)
            {
        	    var v = FindMissing(zeroBits, column - 1);
        	    Console.WriteLine("0");

                return (v << 1) | 0;
            } 
            else 
            {
        	    var v = FindMissing(oneBits, column - 1);
        	    Console.WriteLine("1");
                
                return (v << 1) | 1;
            }
        }

        public void Run()
        {
            var rand = new Random();
            var n = rand.Next(300000) + 1;
            var missing = rand.Next(n + 1);
            var array = Initialize(n, missing);
            Console.WriteLine("The array contains all numbers but one from 0 to " + n + ", except for " + missing);

            var result = FindMissing(array);

            if (result != missing) 
            {
                Console.WriteLine("Error in the algorithm!\n" + "The missing number is " + missing + ", but the algorithm reported " + result);
            } 
            else
            {
                Console.WriteLine("The missing number is " + result);
            }
        }
    }

    public class BitInteger
    {
        public static int IntegerSize;
        private bool[] bits;

        public BitInteger()
        {
            bits = new bool[IntegerSize];
        }

        /* Creates a number equal to given value. Takes time proportional 
         * to INTEGER_SIZE. */
        public BitInteger(int value)
        {
            bits = new bool[IntegerSize];

            for (var j = 0; j < IntegerSize; j++)
            {
                if (((value >> j) & 1) == 1)
                {
                    bits[IntegerSize - 1 - j] = true;
                }
                else
                {
                    bits[IntegerSize - 1 - j] = false;
                }
            }
        }

        /** Returns k-th most-significant bit. */
        public int Fetch(int k)
        {
            if (bits[k])
            {
                return 1;
            }
            
            return 0;
        }

        /** Sets k-th most-significant bit. */
        public void Set(int k, int bitValue)
        {
            if (bitValue == 0)
            {
                bits[k] = false;
            }
            else
            {
                bits[k] = true;
            }
        }

        /** Sets k-th most-significant bit. */
        public void Set(int k, char bitValue)
        {
            if (bitValue == '0')
            {
                bits[k] = false;
            }
            else
            {
                bits[k] = true;
            }
        }

        /** Sets k-th most-significant bit. */
        public void Set(int k, bool bitValue)
        {
            bits[k] = bitValue;
        }

        public void SwapValues(BitInteger number)
        {
            for (var i = 0; i < IntegerSize; i++)
            {
                var temp = number.Fetch(i);
                number.Set(i, Fetch(i));
                Set(i, temp);
            }
        }

        public int ToInt()
        {
            var number = 0;

            for (var j = IntegerSize - 1; j >= 0; j--)
            {
                number = number | Fetch(j);
                if (j > 0)
                {
                    number = number << 1;
                }
            }

            return number;
        }
    }
}