
using System;
using System.Collections;
using System.Collections.Generic;

using ctci.Contracts;
using ctci.Library;

namespace Chapter11
{
    public class Q11_2 : IQuestion
    {
        class AnagramComparator : IComparer
        {
            string SortChars(string s)
            {
                char[] content = s.ToCharArray();
                Array.Sort<char>(content);
                return new string(content);
            }

            int IComparer.Compare(Object x, Object y)
            {
                return SortChars((string)x).CompareTo(SortChars((string)y));
            }
        }

        string SortChars(string s)
        {
            char[] content = s.ToCharArray();
            Array.Sort<char>(content);
            return new string(content);
        }
	
	    void Sort(string[] array) 
        {
		    Dictionary<string, LinkedList<string>> hash = new Dictionary<string, LinkedList<string>>();
		
		    /* Group words by anagram */
		    foreach (string s in array) {
			    string key = SortChars(s); 
			    if (!hash.ContainsKey(key)) {
				    hash.Add(key, new LinkedList<string>());
			    }
			    LinkedList<string> anagrams = hash[key];
			    anagrams.AddLast(s);
		    }
		
		    /* Convert hash table to array */
		    int index = 0;
		    foreach (string key in hash.Keys) {
                LinkedList<string> list = hash[key];
			    foreach (string t in list) {
				    array[index] = t;
				    index++;
			    }
		    }
	    }


        public void Run()
        {
            string[] array = {"apple", "banana", "carrot", "ele", "duck", "papel", "tarroc", "cudk", "eel", "lee"};
            Console.WriteLine(AssortedMethods.StringArrayToString(array));
            Array.Sort(array, new AnagramComparator());
            Console.WriteLine(AssortedMethods.StringArrayToString(array));

		    string[] array2 = {"apple", "banana", "carrot", "ele", "duck", "papel", "tarroc", "cudk", "eel", "lee"};
		    Sort(array);
            Console.WriteLine(AssortedMethods.StringArrayToString(array));
        }
    }
}
