using System.Collections.Generic;

namespace ctci.Library
{
    public class TrieNode
    {
        // The children of this node in the trie.
        private readonly LinkedList<TrieNode> _children;
        public bool Terminates { get; set; }

        // The character stored in this node as data.
        public char Character { get; set; }

        /// Constructs an empty trie node and initializes the list of its children to an empty list. Used
        /// only to construct the root node of the trie. 
        /// 
        /// Using a LinkedList will take less space than an array, since we allocate no more space than
        /// necessary. Another good option would be a hash table, to map from character to the TrieNode.
        /// This is faster, but will require more space.
        public TrieNode()
        {
            _children = new LinkedList<TrieNode>();
            Terminates = false;
        }

        /// Constructs a trie node and stores in the node the char passed in
        /// as the argument. Initializes the list of child nodes of this
        /// node to an empty list.
        public TrieNode(char character) :
            this()
        {
            Character = character;
        }

        /// Add the String passed in as argument to the trie, starting at a
        /// child node of this node. If any prefix of this String is already
        /// present in the trie starting from a child node of this node, only
        /// add the remaining part of the String to the trie, at the
        /// appropriate position in the trie.
        public void AddWord(string word)
        {
            if (string.IsNullOrEmpty(word))
            {
                return;
            }

            TrieNode child;
            char firstChar = word[0];

            TrieNode t = GetChild(firstChar);

            if (t == null)
            {
                child = new TrieNode(firstChar);
                _children.AddLast(child);
            }
            else
            {
                child = t;
            }

            if (word.Length > 1)
            {
                child.AddWord(word.Substring(1));
            }
            else
            {
                child.Terminates = true;
            }
        }

        /// Find a child node of this node that has the char argument as its
        /// data. Return null if no such child node is present in the trie.
        public TrieNode GetChild(char c)
        {
            foreach (TrieNode t in _children) {
                if (t.Character == c) {
                    return t;
                }
            }
            return null;
        }
    }
}
