
using System;

using ctci.Contracts;
using System.Text;

namespace Chapter01
{
    public class Q01_5 : IQuestion
    {
        int CountCompression(string str)
        {
            if (string.IsNullOrEmpty(str))
                return 0;

            char last = str[0];
            int size = 0;
            int count = 0;

            for (int i = 1; i < str.Length; i++)
            {
                if (str[i] == last)
                    count++;
                else
                {
                    last = str[i];
                    size += 1 + string.Format("{0}",count).Length;
                    count = 1;
                }
            }

            size += 1 + string.Format("{0}", count).Length;
            return size;
        }

        string CompressBetter(string str)
        {
            int size = CountCompression(str);
            if (size >= str.Length)
            {
                return str;
            }
            StringBuilder mystr = new StringBuilder();
            char last = str[0];
            int count = 1;
            for (int i = 1; i < str.Length; i++)
            {
                if (str[i] == last)
                {
                    count++;
                }
                else
                {
                    mystr.Append(last);
                    mystr.Append(count);
                    last = str[i];
                    count = 1;
                }
            }
            mystr.Append(last);
            mystr.Append(count);
            return mystr.ToString();
        }

        public void Run()
        {
		    string original = "abbccccccde";
            string compressed = CompressBetter(original);
            Console.WriteLine("Original  : {0}", original);
            Console.WriteLine("Compressed: {0}", compressed);
        }
    }
}
