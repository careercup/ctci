using System;
using ctci.Contracts;
using ctci.Library;

namespace Introduction
{
    public class SwapMinMax : IQuestion
    {
        int GetMinIndex(int[] array)
        {
            int minIndex = 0;
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] < array[minIndex])
                {
                    minIndex = i;
                }
            }
            return minIndex;
        }

        int GetMaxIndex(int[] array)
        {
            int maxIndex = 0;
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] > array[maxIndex])
                {
                    maxIndex = i;
                }
            }
            return maxIndex;
        }

        void Swap(int[] array, int m, int n)
        {
            int temp = array[m];
            array[m] = array[n];
            array[n] = temp;
        }

        void SwapMinMaxBetter(int[] array)
        {
            int minIndex = GetMinIndex(array);
            int maxIndex = GetMaxIndex(array);
            Swap(array, minIndex, maxIndex);
        }

        void DoSwapMinMax(int[] array)
        {
            int minIndex = 0;
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] < array[minIndex])
                {
                    minIndex = i;
                }
            }

            int maxIndex = 0;
            for (int i = 1; i < array.Length; i++)
            {
                if (array[i] > array[maxIndex])
                {
                    maxIndex = i;
                }
            }

            int temp = array[minIndex];
            array[minIndex] = array[maxIndex];
            array[maxIndex] = temp;
        }

        public void Run()
        {
		    int[] array = AssortedMethods.RandomArray(10, -10, 10);
		    Console.WriteLine(AssortedMethods.ArrayToString(array));
		    SwapMinMaxBetter(array);
            Console.WriteLine(AssortedMethods.ArrayToString(array));
        }
    }
}
