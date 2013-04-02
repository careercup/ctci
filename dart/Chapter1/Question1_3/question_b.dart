/* Given two strings, write a method to decide
 * if one is a permutation of the other
 */

/* Solution 2: Check if the two strings have
 * identical character counts.
 */

/* We can also use the definition of an anagram
 * -- two words with the same character counts.
 * We simply iterate through this code, counting
 * how many times each character appears. Then,
 * afterwards, we compare the two arrays.
 */

bool permutation(String s, String t) {
  if (s.length != t.length) {
    return false;
  }

  // Size of char space ASCII, 256
  List<int> letters = new List(256); // Assumption

  List<String> s_array = s.split('');
  s_array.forEach((c) {
    // count number of each char in s.
    if (letters[c.codeUnitAt(0)] == null) {
      letters[c.codeUnitAt(0)] = 1;
    } else {
      letters[c.codeUnitAt(0)]++;
    }
  });

  for (int i = 0; i < t.length; i++) {
    int c = t[i].codeUnitAt(0);
    if (letters[c] == null) {
      letters[c] = -1;
    } else {
      --letters[c];
    }

    if (letters[c] < 0) {
      return false;
    }
  }

  return true;
}

void main() {
  List<List> pairs = [["apple", "papel"], ["carrot", "tarroc"], ["hello", "llloh"]];
  pairs.forEach((pair) {
    var word1 = pair[0];
    var word2 = pair[1];
    bool anagram = permutation(word1, word2);
    print("$word1 $word2 : $anagram");
  });
}