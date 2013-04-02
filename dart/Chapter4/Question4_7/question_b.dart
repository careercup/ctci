import '../../utils/tree_node.dart';

bool covers(TreeNode root, TreeNode p) {
  if (root == null) {
    return false;
  }

  if (root == p) {
    return true;
  }

  return covers(root.left, p) || covers(root.right, p);
}

TreeNode commonAncestorHelper(TreeNode root, TreeNode p, TreeNode q) {
  if (root == null) {
    return null;
  }

  bool is_p_on_left = covers(root.left, p);
  bool is_q_on_left = covers(root.left, q);

  if (is_p_on_left != is_q_on_left) { // Nodes are on different side
    return root;
  }

  TreeNode child_side = is_p_on_left ? root.left : root.right;
  return commonAncestorHelper(child_side, p, q);
}

TreeNode commonAncestor(TreeNode root, TreeNode p, TreeNode q) {
  if (!covers(root, p) || !covers(root, q)) { // Error check - one node is not in tree
    return null;
  }

  return commonAncestorHelper(root, p, q);
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);
  TreeNode n3 = root.find(1);
  TreeNode n7 = root.find(7);
  TreeNode ancestor = commonAncestor(root, n3, n7);
  ancestor.print();
  print(ancestor.data);
}