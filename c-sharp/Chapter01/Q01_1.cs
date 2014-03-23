
using System;

using ctci.Contracts;

namespace Chapter01
{
    public class Q01_1 : IQuestion
    {
        bool IsUniqueChars(string str)
        {
            if (str.Length > 256)
            {
                return false;
            }
            int checker = 0;
            for (int i = 0; i < str.Length; i++)
            {
                int val = str[i] - 'a';
                if ((checker & (1 << val)) > 0) return false;
                checker |= (1 << val);
            }
            return true;
        }

        bool IsUniqueChars2(String str)
        {
            if (str.Length > 256)
            {
                return false;
            }
            bool[] char_set = new bool[256];
            for (int i = 0; i < str.Length; i++)
            {
                int val = str[i];
                if (char_set[val]) return false;
                char_set[val] = true;
            }
            return true;
        }

        public void Run()
        {
            string[] words = {"abcde", "hello", "apple", "kite", "padle"};
            foreach (string word in words)
            {
                Console.WriteLine(word + ": " + IsUniqueChars(word) + " " + IsUniqueChars2(word));
    		}
        }
    }
}
