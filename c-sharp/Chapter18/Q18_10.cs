
using System;
using System.Collections.Generic;
using System.Text;

using ctci.Contracts;
using ctci.Library;

namespace Chapter18
{
    public class Q18_10 : IQuestion
    {
	    public static LinkedList<String> transform(String startWord, String stopWord, Set<String> dictionary) {
		    startWord = startWord.ToUpper();
		    stopWord = stopWord.ToUpper();
		    Queue<String> actionQueue = new Queue<String>();
		    Set<String> visitedSet = new Set<String>();
		    Dictionary<String, String> backtrackMap = new Dictionary<String, String>();

		    actionQueue.Enqueue(startWord);
		    visitedSet.Add(startWord);

		    while (actionQueue.Count != 0) {
			    String w = actionQueue.Dequeue();
			    // For each possible word v from w with one edit operation
			    foreach (String v in getOneEditWords(w)) {
				    if (v.Equals(stopWord)) {
					    // Found our word!  Now, back track.
					    LinkedList<String> list = new LinkedList<String>();
					    // Append v to list
					    list.AddLast(v);
					    while (true) {
						    list.AddFirst(w);
                            if (backtrackMap.ContainsKey(w))
                                w = backtrackMap[w];
                            else
                                break;
					    }
					    return list;
				    }

				    // If v is a dictionary word
				    if (dictionary.Contains(v)) {
					    if (!visitedSet.Contains(v)) {
						    actionQueue.Enqueue(v);
						    visitedSet.Add(v); // mark visited
						    backtrackMap.Add(v, w);
					    }
				    }
			    }
		    }
		    return null;
	    }

	    private static Set<String> getOneEditWords(String word) {
		    Set<String> words = new Set<String>();
		    // for every letter
		    for (int i = 0; i < word.Length; i++) {
			    char[] wordArray = word.ToCharArray();
			    // change that letter to something else
			    for (char c = 'A'; c <= 'Z'; c++) {
				    if (c != word[i]) {
					    wordArray[i] = c;
					    words.Add(new String(wordArray));
				    }
			    }
		    }
		    return words;
	    }
	
	    public static Set<String> setupDictionary(String[] words) {
		    Set<String> hash = new Set<String>();
		    foreach (String word in words) {
			    hash.Add(word.ToUpper());
		    }
		    return hash;
	    }

        public void Run()
        {
		    string[] words = {"maps", "tan", "tree", "apple", "cans", "help", "aped", "free", "apes", "flat", "trap", "fret", "trip", "trie", "frat", "fril"};
		    Set<string> dict = setupDictionary(words);
		    LinkedList<String> list = transform("tree", "flat", dict);
		    foreach (string word in list) {
			    System.Console.WriteLine(word);
		    }
        }
    }
}
