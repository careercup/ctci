
using System;

using ctci.Contracts;

namespace Chapter01
{
    public class Q01_3 : IQuestion
    {
        bool IsPermutation(string original, string valueToTest)
        {
            if (original.Length != valueToTest.Length)
                return false;

            char[] originalAsArray = original.ToCharArray();
            Array.Sort(originalAsArray);
            original = new string(originalAsArray);

            char[] valueToTestAsArray = valueToTest.ToCharArray();
            Array.Sort(valueToTestAsArray);
            valueToTest = new string(valueToTestAsArray);

            return original.Equals(valueToTest);
        }

        bool IsPermutation2(string original, string valueToTest)
        {
            if (original.Length != valueToTest.Length)
                return false;

            int[] letters = new int[256];

            char[] originalAsArray = original.ToCharArray();
            foreach (char c in originalAsArray)
            {
                letters[c]++;
            }

            char[] valueToTestAsArray = valueToTest.ToCharArray();
            foreach (char c in valueToTestAsArray)
            {
                letters[c]--;
                if (letters[c] < 0)
                    return false;
            }

            return true;
        }

        public void Run()
        {
		    string[][] pairs = new string[][]
            {
                new string[]{"apple", "papel"},
                new string[]{"carrot", "tarroc"}, 
                new string[]{"hello", "llloh"}
            };
            foreach (string[] pair in pairs)
            {
                String word1 = pair[0];
                String word2 = pair[1];
                bool res1 = IsPermutation(word1, word2);
                bool res2 = IsPermutation2(word1, word2);
                System.Console.WriteLine("{0}, {1}: {2} / {3}", word1, word2, res1, res2);
            }
        }
    }
}
