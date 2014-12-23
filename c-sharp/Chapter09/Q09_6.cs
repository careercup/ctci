
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter09
{
    public class Q09_6 : IQuestion
    {
        void AddParen(List<string> list, int leftRem, int rightRem, char[] str, int count)
        {
            if (leftRem < 0 || rightRem < leftRem) 
                return; // invalid state

            if (leftRem == 0 && rightRem == 0)
            { /* all out of left and right parentheses */
                list.Add(new string(str));
            }
            else
            {
                if (leftRem > 0)
                { // try a left paren, if there are some available
                    str[count] = '(';
                    AddParen(list, leftRem - 1, rightRem, str, count + 1);
                }
                if (rightRem > leftRem)
                { // try a right paren, if there’s a matching left
                    str[count] = ')';
                    AddParen(list, leftRem, rightRem - 1, str, count + 1);
                }
            }
        }

        List<string> GenerateParens(int count)
        {
            char[] str = new char[count * 2];
            List<string> list = new List<string>();
            AddParen(list, count, count, str, 0);
            return list;
        }

        string InsertInside(string str, int leftIndex)
        {
            string left = str.Substring(0, leftIndex + 1);
            string right = str.Substring(leftIndex + 1, str.Length - (leftIndex + 1));
            return left + "()" + right;
        }

        Set<string> GenerateParens2(int remaining)
        {
		    Set<string> set = new Set<string>();
		    if (remaining == 0)
            {
			    set.Add("");
		    }
            else
            {
                Set<string> prev = GenerateParens2(remaining - 1); 
			    foreach (string str in prev)
                {
				    for (int i = 0; i < str.Length; i++)
                    {
					    if (str[i] == '(')
                        {
						    string s = InsertInside(str, i);
						    /* Add s to set if it is not already in there. Note: 	
						     * Set automatically checks for duplicates before
						     * adding, so an explicit check is not necessary. */
						    set.Add(s);			
					    }
				    }
				    set.Add("()" + str);
			    }
		    }
		    return set;
	    }


        public void Run()
        {
            List<string> list = GenerateParens(3);
		    foreach (string s in list)
            {
			   Console.WriteLine(s);
		    }
            Console.WriteLine(list.Count);

            Set<string> set = GenerateParens2(3);
            foreach (string s in set)
            {
                Console.WriteLine(s);
            }
            Console.WriteLine(list.Count);		
        }
    }
}
