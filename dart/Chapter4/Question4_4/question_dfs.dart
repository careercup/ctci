import '../../utils/tree_node.dart';
import '../../utils/assorted_methods.dart';

List<List<TreeNode>> createLevelLinkedList(TreeNode root, { List<List<TreeNode>> lists: null, int level: null}) {
  if (lists == null && level == null) {
    List<List<TreeNode>> _lists = new List<List<TreeNode>>();
    createLevelLinkedList(root, lists: _lists, level: 0);
    return _lists;
  }

  if (root == null) {
    return null;
  }

  List<TreeNode> list = null;
  if (lists.length == level) { // Level not contained in list
    list = new List<TreeNode>();
    /* Levels are always traversed in order. So, if this is the
     * first time we've visited level i, we must have seen
     * levels 0 through i - 1. We can therefore safely add the
     * level at the end.
     */
    lists.add(list);
  } else {
    list = lists[level];
  }

  list.add(root);
  createLevelLinkedList(root.left, lists: lists, level: level + 1);
  createLevelLinkedList(root.right, lists: lists, level: level + 1);
}

void printResult(List<List<TreeNode>> result) {
  int depth = 0;
  for (List<TreeNode> entry in result) {
    StringBuffer sb = new StringBuffer();
    sb.write("Link list at depth ${depth}:");
    for (TreeNode i in entry) {
      sb.write(" ${i.data}");
    }
    print(sb.toString());
    sb.clear();
    depth++;
  }
}

void main() {

  List<int> nodes_flattened = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = createTreeFromArray(nodes_flattened);
  List<List<TreeNode>> list = createLevelLinkedList(root);
  printResult(list);
}