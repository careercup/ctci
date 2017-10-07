
using ctci.Contracts;
using System;
using System.Text;

namespace Chapter01
{
    public class Q01_2 : IQuestion
    {
        string Reverse(string str)
        {
            var stringBuilder = new StringBuilder();

            for (int i = 0, j = str.Length-1; i < j; i++, j--)
            {
                stringBuilder.Insert(stringBuilder.Length - i, str[i]);
                stringBuilder.Insert(i, str[j]);
            }

            if (str.Length % 2 != 0)
            {
                stringBuilder.Insert(stringBuilder.Length / 2, str[str.Length/2]);
            }

            return stringBuilder.ToString();
        }

        /// <summary>
        /// For sake of principle
        /// </summary>
        string Reverse2(string str)
        {
            var i = 0;
            var j = str.Length - 1;

            var stringBuilder = new StringBuilder(str);

            while (i < j)
            {
                var temp = str[i];
                
                stringBuilder.Replace(str[i], str[j], i, 1);
                stringBuilder.Replace(str[j],   temp, j, 1);

                i++;
                j--;
            }

            return stringBuilder.ToString();
        }

        public void Run()
        {
            var input = new string[]{"vxyz", "abcde", "cat"};

            foreach (var str in input)
            {
                Console.WriteLine("reversing the string: {0} => {1} / {2}", str, Reverse(str), Reverse2(str));
            }
        }
    }
}