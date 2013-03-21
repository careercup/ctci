package CtCILibrary;

import java.util.LinkedList;

/* One node in the trie. Most of the logic of the trie is implemented
 * in this class.
 */
public class TrieNode
{
    // The children of this node in the trie.
    private LinkedList<TrieNode> children;
    private boolean terminates = false;

    // The character stored in this node as data.
    private char character;	

    /* Constructs an empty trie node and initializes the list of its children to an empty list. Used
     * only to construct the root node of the trie. 
     * 
     * Using a LinkedList will take less space than an array, since we allocate no more space than
     * necessary. Another good option would be a hash table, to map from character to the TrieNode.
     * This is faster, but will require more space.
     */
    public TrieNode() {
    	children = new LinkedList<TrieNode>();
    }

    /* Constructs a trie node and stores in the node the char passed in
     * as the argument. Initializes the list of child nodes of this
     * node to an empty list.
     */
    public TrieNode(char character) {
        this();
        this.character = character;
    }

    /* Getter for the character data stored in this node.
     */
    public char getChar() {
        return character;
    }

    /* Add the String passed in as argument to the trie, starting at a
     * child node of this node. If any prefix of this String is already
     * present in the trie starting from a child node of this node, only
     * add the remaining part of the String to the trie, at the
     * appropriate position in the trie.
     */
    public void addWord(String word) {
    	if (word == null || word.isEmpty()) {
    		return;
    	}
    	
        TrieNode child;
        char firstChar = word.charAt(0);

        TrieNode t = getChild(firstChar);

        if (t == null) {
            child = new TrieNode(firstChar);
            children.add(child);
        } else {
            child = t;
        }

        if (word.length() > 1) {
            child.addWord(word.substring(1));
        } else {
        	child.setTerminates(true);
        }
    }

    /* Find a child node of this node that has the char argument as its
     * data. Return null if no such child node is present in the trie.
     */
    TrieNode getChild(char c) {
        for (TrieNode t : children) {
            if (t.getChar() == c) {
                return t;
            }
        }
        return null;
    }

    public boolean terminates() {
    	return terminates;
    }
    
    public void setTerminates(boolean t) {
    	terminates = t;
    }
}
