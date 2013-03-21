package Question17_14;

import java.util.Hashtable;

import CtCILibrary.AssortedMethods;
import CtCILibrary.Trie;

public class Question {
	
	public static String sentence;
	public static Trie dictionary;
	
	/* incomplete code */
	public static Result parse(int wordStart, int wordEnd, Hashtable<Integer, Result> cache) {
		if (wordEnd >= sentence.length()) {
			return new Result(wordEnd - wordStart, sentence.substring(wordStart).toUpperCase());
		}
		if (cache.containsKey(wordStart)) {
			return cache.get(wordStart).clone();
		}
		String currentWord = sentence.substring(wordStart, wordEnd + 1);
		boolean validPartial = dictionary.contains(currentWord, false);
		boolean validExact = validPartial && dictionary.contains(currentWord, true);
		
		/* break current word */
		Result bestExact = parse(wordEnd + 1, wordEnd + 1, cache);
		if (validExact) {
			bestExact.parsed = currentWord + " " + bestExact.parsed;
		} else {
			bestExact.invalid += currentWord.length();
			bestExact.parsed = currentWord.toUpperCase() + " " + bestExact.parsed;
		} 
		
		/* extend current word */
		Result bestExtend = null;
		if (validPartial) {
			bestExtend = parse(wordStart, wordEnd + 1, cache);
		}
		
		/* find best */
		Result best = Result.min(bestExact, bestExtend);
		cache.put(wordStart, best.clone());
		return best;
	}	
	
	public static int parseOptimized(int wordStart, int wordEnd, Hashtable<Integer, Integer> cache) {
		if (wordEnd >= sentence.length()) {
			return wordEnd - wordStart;
		}
		if (cache.containsKey(wordStart)) {
			return cache.get(wordStart);
		}		
		
		String currentWord = sentence.substring(wordStart, wordEnd + 1);
		boolean validPartial = dictionary.contains(currentWord, false);
		
		/* break current word */
		int bestExact = parseOptimized(wordEnd + 1, wordEnd + 1, cache);
		if (!validPartial || !dictionary.contains(currentWord, true)) {
			bestExact += currentWord.length();
		}
		
		/* extend current word */
		int bestExtend = Integer.MAX_VALUE;
		if (validPartial) {
			bestExtend = parseOptimized(wordStart, wordEnd + 1, cache);
		}
		
		/* find best */
		int min = Math.min(bestExact, bestExtend);
		cache.put(wordStart, min);
		return min;
	}
	
	public static int parseSimple(int wordStart, int wordEnd) {
		if (wordEnd >= sentence.length()) {
			return wordEnd - wordStart;
		}
		
		String word = sentence.substring(wordStart, wordEnd + 1);
		
		/* break current word */
		int bestExact = parseSimple(wordEnd + 1, wordEnd + 1);
		if (!dictionary.contains(word, true)) {
			bestExact += word.length();
		}
		
		/* extend current word */
		int bestExtend = parseSimple(wordStart, wordEnd + 1);
		
		/* find best */
		return Math.min(bestExact, bestExtend);
	}	
	
	public static String clean(String str) {
		char[] punctuation = {',', '"', '!', '.', '\'', '?', ','};
		for (char c : punctuation) {
			str = str.replace(c, ' ');
		}
		return str.replace(" ", "").toLowerCase();
	}
	
	public static void main(String[] args) {
		dictionary = AssortedMethods.getTrieDictionary();
		sentence = "As one of the top companies in the world, Google will surely attract the attention of computer gurus. This does not, however, mean the company is for everyone.";
		sentence = clean(sentence);
		System.out.println(sentence);
		//Result v = parse(0, 0, new Hashtable<Integer, Result>());
		//System.out.println(v.parsed);
		int v = parseOptimized(0, 0, new Hashtable<Integer, Integer>());
		System.out.println(v);
	}

}
