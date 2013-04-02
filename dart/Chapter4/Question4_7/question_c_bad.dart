import '../../utils/tree_node.dart';

TreeNode commonAncestorBad(TreeNode root, TreeNode p, TreeNode q) {
  if (root == null) {
    return null;
  }

  if (root == p && root == q) {
    return root;
  }

  TreeNode x = commonAncestorBad(root.left, p, q);
  if (x != null && x != p && x != q) { // Found common ancestor
    return x;
  }

  TreeNode y = commonAncestorBad(root.right, p, q);
  if (y != null && y != p && y != q) {
    return y;
  }

  if (x != null && y != null) {
    return root; // This is the common ancestor
  } else if (root == p || root == q) {
    return root;
  } else {
    return x == null ? y : x;
  }
}
void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);
  TreeNode n3 = root.find(1);
  TreeNode n7 = root.find(7);
  TreeNode ancestor = commonAncestorBad(root, n3, n7);
  if (ancestor != null) {
    ancestor.print();
    print(ancestor.data);
  } else {
    print("null");
  }
}