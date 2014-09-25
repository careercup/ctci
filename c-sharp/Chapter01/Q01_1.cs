
using ctci.Contracts;
using System;

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

            var checker = 0;
            for (var i = 0; i < str.Length; i++)
            {
                var val = str[i] - 'a';

                if ((checker & (1 << val)) > 0)
                {
                    return false;
                }
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

            var charSet = new bool[256];

            for (var i = 0; i < str.Length; i++)
            {
                int val = str[i];

                if (charSet[val])
                {
                    return false;
                }
                charSet[val] = true;
            }
            
            return true;
        }

        public void Run()
        {
            string[] words = {"abcde", "hello", "apple", "kite", "padle"};
            
            foreach (var word in words)
            {
                Console.WriteLine(word + ": " + IsUniqueChars(word) + " " + IsUniqueChars2(word));
    		}
        }
    }
}