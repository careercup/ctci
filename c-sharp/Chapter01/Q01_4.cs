
using System;

using ctci.Contracts;

namespace Chapter01
{
    public class Q01_4 : IQuestion
    {
        void ReplaceSpaces(char[] str, int length) 
        {
            int spaceCount = 0;

            // count the number of spaces
            foreach (char c in str)
            {
                if (c == ' ')
                {
                    spaceCount++;
                }
            }

            // calculate new string size
            int index = length + spaceCount * 2;

            // copying the characters backwards and inserting %20
            for (int i = length - 1; i >= 0; i--)
            {
                if (str[i] == ' ')
                {
                    str[index - 1] = '0';
                    str[index - 2] = '2';
                    str[index - 3] = '%';
                    index -= 3;
                }
                else
                {
                    str[index - 1] = str[i];
                    index--;
                }
            }
        }

        public void Run()
        {
            String str = "abc d e f";
		    char[] arr = new char[str.Length + 3 * 2 + 1];
		    for (int i = 0; i < str.Length; i++) {
			    arr[i] = str[i];
		    }
		    ReplaceSpaces(arr, str.Length);	
		    Console.WriteLine("{0} -> {1}", str, new string(arr));
        }
    }
}
