/*
 * Write a method to replace all spaces in a stirng with '%20'.
 * You may assume that the string has sufficient space at the end
 * of the string to hold the addtional characters, and that you
 * are given the "true" length of the string. (Note: if
 * implementing in java, please use a character array so that you can
 * perform this operation in place.)
 *
 * EXAMPLE
 * Input: "Mr John Smith"
 * Output: "Mr%20John%20Smith"
 */

replaceSpaces(List<String> str, int length) {
  int spaceCount = 0;
  int index;
  int i = 0;

  for (i = 0; i < length; i++) {
    if (str[i] == ' ') {
      spaceCount++;
    }
  }

  index = length + spaceCount * 2;

  for (i = length - 1; i >= 0; i--) {
    if (str[i] == ' ') {
      str[index - 1] = '0';
      str[index - 2] = '2';
      str[index - 3] = '%';
      index = index - 3;
    } else {
      str[index - 1] = str[i];
      index--;
    }
  }
}

void main() {
  String str = "abc d e f";
  // Removed +1 from [arr] since we dont need null terminating strings here.
  List<String> arr = new List<String>(str.length + 3 * 2);

  for (int i = 0; i < str.length; i++) {
    arr[i] = str[i];
  }

  replaceSpaces(arr, str.length);
  print('"${arr.join()}"');
}