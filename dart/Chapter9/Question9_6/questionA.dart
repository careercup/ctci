
String insertInside(String str, int leftIndex) {
  String left = str.substring(0, leftIndex + 1);
  String right = str.substring(leftIndex + 1, str.length);
  return "${left}()${right}";
}

Set<String> generateParens(int remaining) {
  Set<String> set = new Set<String>();
  if (remaining == 0) {
    set.add("");
  } else {
    Set<String> prev = generateParens(remaining - 1);
    for (String str in prev) {
      for (int i = 0; i < str.length; i++) {
        if (str[i] == '(') {
          String s = insertInside(str, i);
          /*
           * Add s to set if it's not already in there. Note:
           * Set automatically checks for duplicates  before
           * adding, so an explicit check is not necessary.
           */
          set.add(s);
        }
      }
      if (!set.contains('()${str}')) {
        set.add("()${str}");
      }
    }
  }
  return set;
}

void main() {
  Set<String> list = generateParens(3);
  for (String s in list) {
    print(s);
  }

  print(list.length);
}