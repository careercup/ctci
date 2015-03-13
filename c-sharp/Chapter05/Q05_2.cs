
using ctci.Contracts;
using System;
using System.Text;

namespace Chapter05
{
    public class Q05_2 : IQuestion
    {
        string PrintBinary(double number)
        {
            if (number >= 1 || number <= 0)
            {
                return "ERROR";
            }

            var binary = new StringBuilder();
            binary.Append(".");

            while (number > 0)
            {
                /* Setting a limit on length: 32 characters */
                if (binary.Length > 32)
                {
                    return "ERROR";
                }

                var r = number * 2;

                if (r >= 1)
                {
                    binary.Append(1);
                    number = r - 1;
                }
                else
                {
                    binary.Append(0);
                    number = r;
                }
            }

            return binary.ToString();
        }

        string PrintBinary2(double number)
        {
            if (number >= 1 || number <= 0)
            {
                return "ERROR";
            }

            var binary = new StringBuilder();
            var frac = 0.5;
            binary.Append(".");

            while (number > 0)
            {
                /* Setting a limit on length: 32 characters */
                if (binary.Length >= 32)
                {
                    return "ERROR";
                }
                if (number >= frac)
                {
                    binary.Append(1);
                    number -= frac;
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
		    var binaryString = PrintBinary2(.125);
		    Console.WriteLine(binaryString);
		
		    for (var i = 0; i < 1000; i++)
            {
                var num = i / 1000.0;
                var binary = PrintBinary(num);
                var binary2 = PrintBinary2(num);

			    if (!binary.Equals("ERROR") || !binary2.Equals("ERROR"))
                {
				    Console.WriteLine(num + " : " + binary + " " + binary2);
			    }
		    }            
        }
    }
}