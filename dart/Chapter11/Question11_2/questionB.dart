
String sortChars(String s) {
  List<String> content = s.split('');
  content.sort();
  return content.join();
}

void sort(List<String> array) {
  Map<String, List<String>> hash = new Map<String, List<String>>();

  /* Group words by anagram */
  for (String s in array) {
    String key = sortChars(s);
    if (!hash.containsKey(key)) {
      hash[key] = new List<String>();
    }
    List<String> anagrams = hash[key];
    anagrams.add(s);
  }

  /* Convert hash table to array */
  int index = 0;
  for (String key in hash.keys) {
    List<String> list = hash[key];
    for (String t in list) {
      array[index] = t;
      index++;
    }
  }
}

void main() {
  List<String> array = ["apple", "banana", "carrot", "ele", "duck", "papel", "tarroc", "cudk", "eel", "lee"];
  print(array);
  sort(array);
  print(array);
}