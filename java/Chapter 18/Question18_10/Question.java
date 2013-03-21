package Question18_10;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

public class Question {

	public static LinkedList<String> transform(String startWord, String stopWord, Set<String> dictionary) {
		startWord = startWord.toUpperCase();
		stopWord = stopWord.toUpperCase();
		Queue<String> actionQueue = new LinkedList<String>();
		Set<String> visitedSet = new HashSet<String>();
		Map<String, String> backtrackMap = new TreeMap<String, String>();

		actionQueue.add(startWord);
		visitedSet.add(startWord);

		while (!actionQueue.isEmpty()) {
			String w = actionQueue.poll();
			// For each possible word v from w with one edit operation
			for (String v : getOneEditWords(w)) {
				if (v.equals(stopWord)) {
					// Found our word!  Now, back track.
					LinkedList<String> list = new LinkedList<String>();
					// Append v to list
					list.add(v);
					while (w != null) {
						list.add(0, w);
						w = backtrackMap.get(w);
					}
					return list;
				}

				// If v is a dictionary word
				if (dictionary.contains(v)) {
					if (!visitedSet.contains(v)) {
						actionQueue.add(v);
						visitedSet.add(v); // mark visited
						backtrackMap.put(v, w);
					}
				}
			}
		}
		return null;
	}

	private static Set<String> getOneEditWords(String word) {
		Set<String> words = new TreeSet<String>();
		// for every letter
		for (int i = 0; i < word.length(); i++) {
			char[] wordArray = word.toCharArray();
			// change that letter to something else
			for (char c = 'A'; c <= 'Z'; c++) {
				if (c != word.charAt(i)) {
					wordArray[i] = c;
					words.add(new String(wordArray));
				}
			}
		}
		return words;
	}
	
	public static HashSet<String> setupDictionary(String[] words) {
		HashSet<String> hash = new HashSet<String>();
		for (String word : words) {
			hash.add(word.toUpperCase());
		}
		return hash;
	}

	public static void main(String[] args) {
		String[] words = {"maps", "tan", "tree", "apple", "cans", "help", "aped", "free", "apes", "flat", "trap", "fret", "trip", "trie", "frat", "fril"};
		HashSet<String> dict = setupDictionary(words);
		LinkedList<String> list = transform("tree", "flat", dict);
		for (String word : list) {
			System.out.println(word);
		}
	}

}
