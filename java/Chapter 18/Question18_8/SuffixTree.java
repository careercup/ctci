package Question18_8;

import java.util.ArrayList;

public class SuffixTree {
	SuffixTreeNode root = new SuffixTreeNode();
	
	public SuffixTree(String s) {
		for (int i = 0; i < s.length(); i++) {
	    	String suffix = s.substring(i);
	    	root.insertString(suffix, i);
		}
	}
	
	public ArrayList<Integer> search(String s) {
		return root.search(s);
	}
}
