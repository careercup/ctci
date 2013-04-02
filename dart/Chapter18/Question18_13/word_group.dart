library WordGroup;

class WordGroup {
  Map<String, bool> lookup = new Map<String, bool>();
  List<String> group = new List<String>();

  bool containsWord(String s) {
    return lookup.containsKey(s);
  }

  void addWord(String s) {
    group.add(s);
    lookup[s] = true;
  }

  int length() {
    return group.length;
  }

  String getWord(int i) {
    return group[i];
  }

  List<String> getWords() {
    return group;
  }

  static List<WordGroup> createWordGroups(List<String> list) {
    List<WordGroup> groupList;
    int maxWordLength = 0;
    // Find out the length of the longest word
    for (int i = 0; i < list.length; i++) {
      if (list[i].length > maxWordLength) {
        maxWordLength = list[i].length;
      }
    }

    /*
     * Group the words in the dictionary into lists of words of
     * same length.groupList[i] will contain a list of words, each
     * of length (i+1)
     */
    groupList = new List<WordGroup>(maxWordLength);
    for (int i = 0; i < list.length; i++) {
      /*
       * We do wordLength - 1 instead of just wordLength since
       * this is used as an index and no words are of length 0
       */
      int wordLength = list[i].length - 1;
      if (groupList[wordLength] == null) {
        groupList[wordLength] = new WordGroup();
      }

      groupList[wordLength].addWord(list[i]);
    }

    return groupList;
  }
}

