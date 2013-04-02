/*
 * Assume you have a method isSubstring which checks if one word is a
 * substring of another. Given two strings, s1 and s2, write code to check
 * if s2 is a rotation of s1 using only one call to isSubstring
 * (e.g., "waterbottle" is a rotation of "erbottlewat").
 */

bool isSubstring(String big, String small) {
  if (big.indexOf(small) >= 0) {
    return true;
  } else {
    return false;
  }
}

bool isRotation(String s1, String s2) {
  int len = s1.length;
  /* check that s1 and s2 are equal length and not empty */
  if (len == s2.length && len > 0) {
    /* concatenate s1 and s1 within new buffer */
    String s1s1 = "$s1$s1";
    return isSubstring(s1s1, s2);
  }

  return false;
}

void main() {
  List<List<String>> pairs = [["apple", "pleap"],
                              ["waterbottle", "erbottlewat"],
                              ["camera", "macera"]];
  for (List<String> pair in pairs) {
    String word1 = pair[0];
    String word2 = pair[1];
    bool is_rotation = isRotation(word1, word2);
    print("$word1, $word2: $is_rotation");
  }
}