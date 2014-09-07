
using ctci.Contracts;
using System;

namespace Chapter01
{
    public class Q01_4 : IQuestion
    {
        void ReplaceSpaces(char[] input, int length) 
        {
            var spaceCount = 0;

            // count the number of spaces
            foreach (var character in input)
            {
                if (character == ' ')
                {
                    spaceCount++;
                }
            }

            // calculate new string size
            var index = length + spaceCount * 2;

            // copying the characters backwards and inserting %20
            for (var i = length - 1; i >= 0; i--)
            {
                if (input[i] == ' ')
                {
                    input[index - 1] = '0';
                    input[index - 2] = '2';
                    input[index - 3] = '%';
                    index -= 3;
                }
                else
                {
                    input[index - 1] = input[i];
                    index--;
                }
            }
        }

        public void Run()
        {
            const string input = "abc d e f";
		    var characterArray = new char[input.Length + 3 * 2 + 1];

		    for (var i = 0; i < input.Length; i++) 
            {
			    characterArray[i] = input[i];
		    }

		    ReplaceSpaces(characterArray, input.Length);	
		    Console.WriteLine("{0} -> {1}", input, new string(characterArray));
        }
    }
}