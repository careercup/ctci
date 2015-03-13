

using ctci.Contracts;
using System;
using System.Text;

namespace Chapter01
{
    public class Q01_5 : IQuestion
    {
        int CountCompression(string str)
        {
            if (string.IsNullOrEmpty(str)) 
            { 
                return 0;
            }

            var last = str[0];
            var size = 0;
            var count = 0;

            for (var i = 1; i < str.Length; i++)
            {
                if (str[i] == last) 
                {
                    count++;
                }
                else
                {
                    last = str[i];
                    size += 1 + string.Format("{0}", count).Length;
                    count = 1;
                }
            }

            size += 1 + string.Format("{0}", count).Length;

            return size;
        }

        string CompressBetter(string str)
        {
            var size = CountCompression(str);
            
            if (size >= str.Length)
            {
                return str;
            }

            var sb = new StringBuilder();
            var last = str[0];
            var count = 1;

            for (var i = 1; i < str.Length; i++)
            {
                if (str[i] == last)
                {
                    count++;
                }
                else
                {
                    sb.Append(last);
                    sb.Append(count);
                    last = str[i];
                    count = 1;
                }
            }
            sb.Append(last);
            sb.Append(count);

            return sb.ToString();
        }

        public void Run()
        {
		    const string original = "abbccccccde";
            var compressed = CompressBetter(original);
            Console.WriteLine("Original  : {0}", original);
            Console.WriteLine("Compressed: {0}", compressed);
        }
    }
}