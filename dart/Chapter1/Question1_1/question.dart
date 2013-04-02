/*
 * Implement an algorithm to determine if a string has all
 * unique characters. What if you cannot use addtional
 * data structures?
 */

import 'dart:io';

// optimal
/* The time complexity for this code is O(n), where
 * n is the length of the string. The space complexity
 * is O(1)
 */
bool isUniqueChars(String str) {
  if (str.length > 256) {
    return false;
  }

  int checker = 0;
  for (int i = 0; i < str.length; i++) {
    int val = str.codeUnits[i] - 'a'.codeUnits[0];
    if ((checker & (1 << val)) > 0) {
      return false;
    } else {
      checker |= (1 << val);
    }
  }

  return true;
}

// optimal
/* We can reduce our space usage by a factor
 * of eight by using a bit vector.
 */
bool isUniqueChars2(String str) {
  if (str.length > 256) {
    return false;
  }

  List<bool> char_set = new List<bool>(256);
  for (int i = 0; i < str.length; i++) {
    int val = str.codeUnits[i];
    if (char_set[val] != null) {
      return false;
    } else {
      char_set[val] = true;
    }
  }

  return true;
}

// least optimal (entire string is iterated on)
bool isUniqueChars3(String str) {
  if (str.length > 256) {
    return false;
  }

  if (new Set.from(str.codeUnits).length == str.length) {
    return true;
  } else {
    return false;
  }
}

// least optimal  (entire string is iterated on)
bool isUniqueChars4(String str) {
  if (str.length > 256) {
    return false;
  }

  Map m = new Map();
  str.codeUnits.forEach((c) => m[c] = c);
  if (m.length == str.length) {
    return true;
  } else {
    return false;
  }
}

//
bool isUniqueChars5(String str) {
  if (str.length > 256) {
    return false;
  }

  Map m = new Map();
  for (int i = 0; i < str.length; i++) {
    if (m.containsKey(str[i])) {
      return false;
    }
    m[str[i]] = str[i];
  }

  return true;
}

void main() {
  List words = ["abcde", "hello", "apple", "kite", "padle"];
  words.forEach((word) {
    print("$word: ${isUniqueChars(word)} ${isUniqueChars2(word)} ${isUniqueChars3(word)} ${isUniqueChars4(word)} ${isUniqueChars5(word)}");
  });
}