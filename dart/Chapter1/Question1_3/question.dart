/* Given two strings, write a method to decide
 * if one is a permutation of the other
 */

/* Solution by sorting the strings.
 * If two strings are anagrams, then we know
 * they have the same characters, but in different
 * orders. If we put the strings in the same order
 * we just need to compare they are the same.
 *
 * This may not be the most optimal solution.
 */

String sort(String s) {
  var r = s.codeUnits;
  r.sort((a, b) => a.compareTo(b));
  return r.toString();
//  return (s.splitChars()..sort((a,b)=>a.compareTo(b))).toString();
}
bool permutation(String s, String t) {
  return sort(s).compareTo(sort(t)) == 0;
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