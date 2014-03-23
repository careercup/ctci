
using System;
using System.Text;
using ctci.Contracts;
using ctci.Library;

namespace Chapter05
{
    public class Q05_2 : IQuestion
    {
        string PrintBinary(double num)
        {
            if (num >= 1 || num <= 0)
            {
                return "ERROR";
            }

            StringBuilder binary = new StringBuilder();
            binary.Append(".");
            while (num > 0)
            {
                /* Setting a limit on length: 32 characters */
                if (binary.Length > 32)
                {
                    return "ERROR";
                }
                double r = num * 2;
                if (r >= 1)
                {
                    binary.Append(1);
                    num = r - 1;
                }
                else
                {
                    binary.Append(0);
                    num = r;
                }
            }
            return binary.ToString();
        }

        string PrintBinary2(double num)
        {
            if (num >= 1 || num <= 0)
            {
                return "ERROR";
            }

            StringBuilder binary = new StringBuilder();
            double frac = 0.5;
            binary.Append(".");
            while (num > 0)
            {
                /* Setting a limit on length: 32 characters */
                if (binary.Length >= 32)
                {
                    return "ERROR";
                }
                if (num >= frac)
                {
                    binary.Append(1);
                    num -= frac;
                }
                else
                {
                    binary.Append(0);
                }
                frac /= 2;
            }
            return binary.ToString();
        }

        public void Run()
        {
		    string bs = PrintBinary2(.125);
		    Console.WriteLine(bs);
		
		    for (int i = 0; i < 1000; i++)
            {
			    double num = i / 1000.0;
			    string binary = PrintBinary(num);
			    string binary2 = PrintBinary2(num);
			    if (!binary.Equals("ERROR") || !binary2.Equals("ERROR"))
                {
				    Console.WriteLine(num + " : " + binary + " " + binary2);
			    }
		    }            
        }
    }
}
