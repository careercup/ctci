import '../../utils/tree_node.dart';
import '../../utils/assorted_methods.dart';

List<List<TreeNode>> createLevelLinkedList(TreeNode root) {
  List<List<TreeNode>> result = new List<List<TreeNode>>();

  /* "Visit" the root */
  List<TreeNode> current = new List<TreeNode>();
  if (root != null) {
    current.add(root);
  }

  while (current.length > 0) {
    result.add(current); // Add previous level
    List<TreeNode> parents = current; // Go to next level
    current = new List<TreeNode>();
    for (TreeNode parent in parents) {
      /* Visit the children */
      if (parent.left != null) {
        current.add(parent.left);
      }
      if (parent.right != null) {
        current.add(parent.right);
      }
    }
  }

  return result;
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