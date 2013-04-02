part of tree_node;

class BTreePrinter {

  static void printNode(TreeNode root) {
    int maxLevel = BTreePrinter.maxLevel(root);
    BTreePrinter.printNodeInternal([root], 1, maxLevel);
  }

  static void printNodeInternal(List<TreeNode> nodes, int level, int maxLevel) {
    if (nodes.isEmpty || BTreePrinter.isAllElementsNull(nodes)) {
      return;
    }

    StringBuffer sb = new StringBuffer();
    int floor = maxLevel - level;
    int endgeLines = pow(2, max(floor - 1, 0)).toInt(); // prob not needed
    int firstSpaces = (pow(2, floor) - 1).toInt();  // prob not needed
    int betweenSpaces = (pow(2, (floor + 1)) - 1).toInt();

    BTreePrinter.printWhitespaces(firstSpaces, sb);

    List<TreeNode> newNodes = new List<TreeNode>();
    for (TreeNode node in nodes) {
      if (node != null) {
        sb.write(node.data);
        newNodes.add(node.left);
        newNodes.add(node.right);
      } else {
        newNodes.add(null);
        newNodes.add(null);
        sb.write(" ");
      }


      BTreePrinter.printWhitespaces(betweenSpaces, sb);
    }

    print(sb.toString());
    sb.clear();

    for (int i = 1; i <= endgeLines; i++) {
      for (int j = 0; j < nodes.length; j++) {
        BTreePrinter.printWhitespaces(firstSpaces - i, sb);
        if (nodes[j] == null) {
          BTreePrinter.printWhitespaces(endgeLines + endgeLines + i + 1, sb);
          continue;
        }

        if (nodes[j].left != null) {
          sb.write("/");
        } else {
          BTreePrinter.printWhitespaces(1, sb);
        }

        BTreePrinter.printWhitespaces(i + i - 1, sb);

        if (nodes[j].right != null) {
          sb.write("\\");
        } else {
          BTreePrinter.printWhitespaces(1, sb);
        }

        BTreePrinter.printWhitespaces(endgeLines + endgeLines - i, sb);
      }

      print(sb.toString());
      sb.clear();
    }

    BTreePrinter.printNodeInternal(newNodes, level + 1, maxLevel);
  }

  static void printWhitespaces(int count, StringBuffer sb) {
    for (int i = 0; i < count; i++) {
      sb.write(" ");
    }
  }

  static int maxLevel(TreeNode node) {
    if (node == null) {
      return 0;
    }

    return max(BTreePrinter.maxLevel(node.left), BTreePrinter.maxLevel(node.right)) + 1;
  }

  static bool isAllElementsNull(List list) {
    for (var i in list) {
      if (i != null) {
        return false;
      }
    }

    return true;
  }
}
