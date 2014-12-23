using System;
using System.Collections.Generic;

namespace ctci.Library
{
    public class Trie
    {
        // The root of this trie.
        private readonly TrieNode _root;

        /* Takes a list of strings as an argument, and constructs a trie that stores these strings. */
        public Trie(List<string> list)
        {
            _root = new TrieNode();
            foreach (string word in list) {
                _root.AddWord(word);
            }
        }


        /* Takes a list of strings as an argument, and constructs a trie that stores these strings. */
        public Trie(string[] list)
        {
            _root = new TrieNode();
            foreach (string word in list) {
                _root.AddWord(word);
            }
        }

        /* Checks whether this trie contains a string with the prefix passed
         * in as argument.
         */
        public bool Contains(string prefix, bool exact)
        {
            TrieNode lastNode = _root;
            int i = 0;
            for (i = 0; i < prefix.Length; i++)
            {
                lastNode = lastNode.GetChild(prefix[i]);
                if (lastNode == null)
                {
                    return false;
                }
            }
            return !exact || lastNode.Terminates;
        }

        public bool Contains(String prefix)
        {
            return Contains(prefix, false);
        }
    }
}
