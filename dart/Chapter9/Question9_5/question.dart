
List<String> getPerms(String str) {
  if (str == null) {
    return null;
  }

  List<String> permutations = new List<String>();
  if (str.length == 0) { // base case
    permutations.add("");
    return permutations;
  }

  String first = str[0]; // get the first character
  String remainder = str.substring(1);
  List<String> words = getPerms(remainder);
  for (String word in words) {
    for (int j = 0; j <= word.length; j++) {
      String s = insertCharAt(word, first, j);
      permutations.add(s);
    }
  }
  return permutations;
}

String insertCharAt(String word, String c, int i) {
  String start = word.substring(0, i);
  String end = word.substring(i);
  return "${start}${c}${end}";
}

void main() {
  List<String> list = getPerms("abc");
  print("There are ${list.length} permutations.");
  for (String s in list) {
    print(s);
  }
}