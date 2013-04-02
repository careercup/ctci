import 'dart:collection';

List<String> transform(String startWord, String stopWord, Set<String> dictionary) {
  startWord = startWord.toUpperCase();
  stopWord = stopWord.toUpperCase();

  Queue<String> actionQueue = new Queue<String>();
  Set<String> visitedSet = new Set<String>();
  Map<String, String> backtrackMap = new Map<String, String>();

  actionQueue.add(startWord);
  visitedSet.add(startWord);

  while(!actionQueue.isEmpty) {
    String word = actionQueue.removeFirst();

    // For each possible word v from w with one edit operation
    for (String visitWord in getOneEditWords(word)) {
      if (visitWord == stopWord) {
        // Found our word! Now, back track.
        Queue<String> list = new Queue<String>();

        // Append v to list
        list.add(visitWord);

        while(word != null) {
          list.addFirst(word);
          word = backtrackMap[word];
        }

        return list.toList();
      }

      // If v is a dictionary word
      if (dictionary.contains(visitWord)) {
        if (!visitedSet.contains(visitWord)) {
          actionQueue.add(visitWord);
          visitedSet.add(visitWord); // mark visited
          backtrackMap[visitWord] = word;
        }
      }
    }
  }

  return null;
}

Set<String> getOneEditWords(String word) {
  Set<String> words = new Set<String>();
  // for every letter
  for (int i = 0; i < word.length; i++) {
    List<String> wordArray = word.split("");
    // change that letter to something else.
    for (int c = 'A'.codeUnits[0]; c <= 'Z'.codeUnits[0]; c++) {
      var char = new String.fromCharCode(c);
      if (char != word[i]) {
        wordArray[i] = char;
        words.add(wordArray.join());
      }
    }
  }

  return words;
}

Set<String> setupDictionary(List<String> words) {
  Set<String> hash = new Set<String>();
  for (String word in words) {
    hash.add(word.toUpperCase());
  }

  return hash;
}

void main() {
  List<String> words = ["maps", "tan", "tree", "apple", "cans", "help", "aped", "free", "apes", "flat", "trap", "fret", "trip", "trie", "frat", "fril"];
  Set<String> dict = setupDictionary(words);
  List<String> list = transform("tree", "flat", dict);
  for (String word in list) {
    print(word);
  }
}