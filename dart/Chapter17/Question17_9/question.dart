import '../../utils/assorted_methods.dart';

Map<String, int> setupDictionary(List<String> book) {
  Map<String, int> table = new Map<String, int>();
  for (String word in book) {
    word = word.toLowerCase();
    if (word.trim() != "") {
      if (!table.containsKey(word)) {
        table[word] = 0;
      }
      table[word]++;
    }
  }

  return table;
}

int getFrequency(Map<String, int> table, String word) {
  if (table == null || word == null) {
    return -1;
  }

  word = word.toLowerCase();
  if (table.containsKey(word)) {
    return table[word];
  }

  return 0;
}

void main() {
  var wordlist = getListOfWords();
  var dictionary = setupDictionary(wordlist);
  var words = ["the", "Lara", "and", "outcropping", "career", "it"];
  for (String word in words) {
    print("$word: ${getFrequency(dictionary, word)}");
  }

//  print(dictionary.values.where((v)=>v!=1).toList());
//  dictionary.keys
//  .where((k) => dictionary[k] != 1)
//  .forEach((v)=> print("$v ${dictionary[v]}"));

}
