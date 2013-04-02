
class SuffixTreeNode {
  Map<String, SuffixTreeNode> children = new Map<String, SuffixTreeNode>();

  String value;
  List<int> indexes = new List<int>();

  void insertString(String s, int index) {
    indexes.add(index);

    if (s != null && s.length > 0) {
      value = s[0];
      SuffixTreeNode child = null;
      if (children.containsKey(value)) {
        child = children[value];
      } else {
        child = new SuffixTreeNode();
        children[value] = child;
      }

      String remainder = s.substring(1);
      child.insertString(remainder, index);
    }
  }

  List<int> search(String s) {
    if (s == null || s.length == 0) {
      return indexes;
    } else {
      String first = s[0];
      if (children.containsKey(first)) {
        String remainder = s.substring(1);
        return children[first].search(remainder);
      }
    }

    return null;
  }
}

class SuffixTree {
  SuffixTreeNode root = new SuffixTreeNode();

  SuffixTree(String s) {
    for (int i = 0; i < s.length; i++) {
      String suffix = s.substring(i);
      root.insertString(suffix, i);
    }
  }

  List<int> search(String s) {
    return root.search(s);
  }
}

void main() {
  String testString = "mississippi";
  List<String> stringList = ["is", "sip", "hi", "sis"];
  SuffixTree tree = new SuffixTree(testString);
  for (String s in stringList) {
    List<int> list = tree.search(s);
    if (list != null) {
      print("$s: ${list.toString()}");
    }
  }
}