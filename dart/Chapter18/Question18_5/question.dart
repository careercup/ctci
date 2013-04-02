import '../../utils/assorted_methods.dart';

int shortest(List<String> words, String word1, String word2) {
  int min = 0xfffffffffffffffff; // Sential value;
  int lastPosWord1 = -1;
  int lastPosWord2 = -1;
  for (int i = 0; i < words.length; i++) {
    String currentWord = words[i];
    if (currentWord == word1) {
      lastPosWord1 = i;
      // Comment following 3 lines if word order matters
      int distance = lastPosWord1 - lastPosWord2;
      if (lastPosWord2 >= 0 && min > distance) {
        min = distance;
      }
    } else if (currentWord == word2) {
      lastPosWord2 = i;
      int distance = lastPosWord2 - lastPosWord1;
      if (lastPosWord1 >= 0 && min > distance) {
        min = distance;
      }
    }
  }

  return min;
}

String wordAtLocation(List<String> words, int loc) {
  if (loc < 0 || loc >= words.length) {
    return null;
  }

  return words[loc];
}

// Method to confirm other result
bool searchConfirm(List<String> words, String word1, String word2, int distance) {
  bool found_at_distance = false;
  for (int i = 0; i < words.length; i++) {
    if (words[i] == word1) {
      for (int j = 1; j < distance; j++) {
        String loc2a = wordAtLocation(words, i - j);
        String loc2b = wordAtLocation(words, i + j);
        if (word2 == loc2a || word2 == loc2b) {
          return false;
        }
      }

      String loc2a = wordAtLocation(words, i - distance);
      String loc2b = wordAtLocation(words, i + distance);
      if (word2 == loc2a || word2 == loc2b) {
        found_at_distance = true;
      }
    }
  }

  return found_at_distance;
}

void main() {
  List<String> wordlist = getLongTextBlobAsStringList();
  List<List<String>> pairs = [["Lara", "the"], ["river", "life"], ["path", "their"], ["life", "a"]];

  for (List<String> pair in pairs) {
    String word1 = pair[0];
    String word2 = pair[1];
    int distance = shortest(wordlist, word1, word2);
    bool confirm = searchConfirm(wordlist, word1, word2, distance);
    print("Distance between <$word1> and <$word2>: $distance ($confirm)");
  }
}