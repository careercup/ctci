using ctci.Contracts;
using System;

namespace Introduction
{
    public class CompareBinaryToHex : IQuestion
    {
	    int DigitToValue(char c) {
		    if (c >= '0' && c <= '9') {
			    return c - '0';
		    } else if (c >= 'A' && c <= 'F') {
			    return 10 + c - 'A';
		    } else if (c >= 'a' && c <= 'f') {
			    return 10 + c - 'a';
		    }
		    return -1;
	    }
	
	    int ConvertToBase(string number, int bace) {
            if (bace < 2 || (bace > 10 && bace != 16)) return -1;
		    int value = 0;
		    for (int i = number.Length - 1; i >= 0; i--) {
			    int digit = DigitToValue(number[i]);
			    if (digit < 0 || digit >= bace) {
				    return -1;
			    }
			    int exp = number.Length - 1 - i;
                value += (int) (digit * Math.Pow(bace, exp));
		    }
		    return value;
	    }
	
	    bool CompareBinToHex(String binary, String hex) {
		    int n1 = ConvertToBase(binary, 2);
		    int n2 = ConvertToBase(hex, 16);
		    if (n1 < 0 || n2 < 0) {
			    return false;
		    } else {
			    return n1 == n2;
		    }
	    }

        public void Run()
        {
            Console.WriteLine(CompareBinToHex("111001011", "1CB"));
        }
    }
}
