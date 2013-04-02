/*
 * Implement a method to perform basic string compression
 * using the counts of repeated characters. For example,
 * the string aabcccccaaa would become a2b1c5a3.
 * If the "compressed" string would not become smaller
 * than the original string, your method should return the
 * original string.
 */

int countCompression(String str){
  String last = str[0];
  int size = 0;
  int count = 1;
  for (int i = 1; i < str.length; i++) {
    if (str[i] == last) {
      count++;
    } else {
      last = str[i];
      size += 1 + count.toString().length;
      count = 1;
    }
  }

  size += 1 + count.toString().length;
  return size;
}

int setChar(List<String> array, String c, int index, int count) {
  array[index] = c;
  index++;
  List<String> cnt = count.toString().split('');
  for (String x in cnt) {
    array[index] = x;
    index++;
  }
  return index;
}

String compressBad(String str) {
  int size = countCompression(str);
  if (size >= str.length) {
    return str;
  }

  String mystr = "";
  String last = str[0];
  int count = 1;
  for (int i = 1; i < str.length; i++) {
    if (str[i] == last) {
      count++;
    } else {
      mystr = "$mystr $last$count";
      last = str[i];
      count = 1;
    }
  }

  return "$mystr$last$count";
}

String compressBetter(String str) {
  int size = countCompression(str);
  if (size >= str.length) {
    return str;
  }

  StringBuffer mystr = new StringBuffer();
  String last = str[0];
  int count = 1;
  for (int i = 1; i < str.length; i++) {
    if (str[i] == last) {
      count++;
    } else {
      mystr.write(last);
      mystr.write(count);
      last = str[i];
      count = 1;
    }
  }

  mystr.write(last);
  mystr.write(count);
  return mystr.toString();
}

String compressAlternate(String str) {
  int size = countCompression(str);
  if (size >= str.length) {
    return str;
  }

  List<String> array = new List<String>(size);
  int index = 0;
  String last = str[0];
  int count = 1;
  for (int i = 1; i < str.length; i++) {
    if (str[i] == last) {
      count++;
    } else {
      index = setChar(array, last, index, count);
      last = str[i];
      count = 1;
    }
  }

  index = setChar(array, last, index, count);
  return array.join();
}

void main() {
  String str = "abbccccccde";
  int c = countCompression(str);
  String str2 = compressAlternate(str);
  print("Old String (len = ${str.length}): $str");
  print("New String (len = ${str2.length}): $str2");
  print("Potential Compression: $c");
}