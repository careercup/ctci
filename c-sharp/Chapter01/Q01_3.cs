
using ctci.Contracts;
using System;

namespace Chapter01
{
    public class Q01_3 : IQuestion
    {
        bool IsPermutation(string original, string valueToTest)
        {
            if (original.Length != valueToTest.Length)
            { 
                return false;
            }

            var originalAsArray = original.ToCharArray();
            Array.Sort(originalAsArray);
            original = new string(originalAsArray);

            var valueToTestAsArray = valueToTest.ToCharArray();
            Array.Sort(valueToTestAsArray);
            valueToTest = new string(valueToTestAsArray);

            return original.Equals(valueToTest);
        }

        bool IsPermutation2(string original, string valueToTest)
        {
            if (original.Length != valueToTest.Length) 
            { 
                return false;
            }

            var letters = new int[256];
            var originalAsArray = original.ToCharArray();

            foreach (var character in originalAsArray)
            {
                letters[character]++;
            }

            var valueToTestAsArray = valueToTest.ToCharArray();

            foreach (var character in valueToTestAsArray)
            {
                letters[character]--;
                if (letters[character] < 0) 
                {
                    return false;
                }
            }

            return true;
        }

        public void Run()
        {
		    string[][] pairs = 
            {
                new string[]{"apple", "papel"},
                new string[]{"carrot", "tarroc"}, 
                new string[]{"hello", "llloh"}
            };

            foreach (var pair in pairs)
            {
                var word1 = pair[0];
                var word2 = pair[1];
                var result1 = IsPermutation(word1, word2);
                var result2 = IsPermutation2(word1, word2);
                Console.WriteLine("{0}, {1}: {2} / {3}", word1, word2, result1, result2);
            }
        }
    }
}