
using System;

using ctci.Contracts;

namespace Chapter01
{
    public class Q01_8 : IQuestion
    {
        public static bool IsSubstring(String big, String small)
        {
            return big.IndexOf(small) >= 0;
        }

        public static bool IsRotation(String s1, String s2)
        {
            int len = s1.Length;
            /* check that s1 and s2 are equal length and not empty */
            if (len == s2.Length && len > 0)
            {
                /* concatenate s1 and s1 within new buffer */
                String s1s1 = s1 + s1;
                return IsSubstring(s1s1, s2);
            }
            return false;
        }

        public void Run()
        {
		    string[][] pairs = new string[][]
		    {
		        new string[]{"apple", "pleap"},
                new string[]{"waterbottle", "erbottlewat"},
                new string[]{"camera", "macera"}
		    };
		    foreach (string[] pair in pairs) {
			    String word1 = pair[0];
			    String word2 = pair[1];
                bool isRotation = IsRotation(word1, word2);
                System.Console.WriteLine("{0}, {1}: {2}", word1, word2, isRotation);
		    }
        }
    }
}
