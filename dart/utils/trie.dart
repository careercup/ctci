library trie;

/*
 * One node in the trie. Most of the logic of the trie is implemented
 * in this class.
 */
class TrieNode {
  // The children of this node in the trie.
  List<TrieNode> _children;
  bool _terminates = false;

  // The character stored in this node as data.
  String _character;

  /*
   * Constructs an empty trie node and initializes the list of its children to
   * an empty list. Used only to construct the root node of the trie.
   *
   * Using a List will take less space than an array, since we allocate no
   * more space than necessary. Another good option would be a hash table,
   * to map from character to the TrieNode. This is faster, but will require
   * more space.
   */
  TrieNode([this._character]) : _children = new List<TrieNode>() {}

  /*
   * Getter for the character data stored in this node.
   */
  String getChar() => _character;

  /*
   * Add the String passed in as argument to the trie, starting at a
   * child node of this node. If any prefix of this String is already
   * present in the trie starting from a child node of this node, only
   * add the remaining part of the String to the trie, at the appropriate
   * position in the trie.
   */
  void addWord(String word) {
    if (word == null || word.isEmpty) {
      return;
    }

    TrieNode child;
    String firstChar = word[0];

    TrieNode t = getChild(firstChar);

    if (t == null) {
      child = new TrieNode(firstChar);
      _children.add(child);
    } else {
      child = t;
    }

    if (word.length > 1) {
      child.addWord(word.substring(1));
    } else {
      child.setTerminates(true);
    }
  }

  /*
   * Find a child node of this node that has the char argument as its
   * data. Return null if no such child node is present in the trie.
   */
  TrieNode getChild(String c) {
    for (TrieNode t in _children) {
      if (t.getChar() == c) {
        return t;
      }
    }
    return null;
  }

  bool get terminates => _terminates;
  void setTerminates(bool t) {
    _terminates = t;
  }
}

/*
 * Implements a trie. We store the input list of words in
 * tries so we can efficiently find words with a given prefix.
 */
class Trie {
  // The root of this trie.
  TrieNode root;

  /*
   * Takes a list of strings as an argument, and constructs a trie that
   * stores these strings.
   */
  Trie(List<String> list) {
    root = new TrieNode();
    for (String word in list) {
      root.addWord(word);
    }
  }

  /*
   * Checks whether this trie contains a string with the prefix passed
   * in as argument.
   */
  bool containsExact(String prefix, bool exact) {
    TrieNode lastNode = root;
    int i = 0;
    for (i = 0; i < prefix.length; i++) {
      lastNode = lastNode.getChild(prefix[i]);
      if (lastNode == null) {
        return false;
      }
    }

    return !exact || lastNode.terminates;
  }

  bool contains(String prefix) {
    return containsExact(prefix, false);
  }
}

