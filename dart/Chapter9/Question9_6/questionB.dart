
void addParen(List<String> list, int leftRem, int rightRem, List<String> str, int count) {
  if (leftRem < 0 || rightRem < leftRem) {
    return; // invalid state
  }

  if (leftRem == 0 && rightRem == 0) { /* all out of left and right parentheses */
    String s = str.join();
    list.add(s);
  } else {
    if (leftRem > 0) { // try a left paren, if there are some available
      str[count] = '(';
      addParen(list, leftRem - 1, rightRem, str, count + 1);
    }

    if (rightRem > leftRem) { // try a right paren, if there's a matching left
      str[count] = ')';
      addParen(list, leftRem, rightRem - 1, str, count + 1);
    }
  }
}

List<String> generateParens(int count) {
  List<String> str = new List<String>(count * 2);
  List<String> list = new List<String>();
  addParen(list, count, count, str, 0);
  return list;
}

void main() {
  List<String> list = generateParens(3);
  for (String s in list) {
    print(s);
  }
  print(list.length);
}