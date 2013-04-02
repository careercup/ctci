import '../../utils/tree_node.dart';

TreeNode inorderSucc(TreeNode n) {
  if (n == null) {
    return null;
  }

  // Found right children -> return left most node of right subtree
  if (n.parent == null || n.right != null) {
    return leftMostChild(n.right);
  } else {
    TreeNode q = n;
    TreeNode x = q.parent;
    // Go up until we're on left instead of right
    while (x != null && x.left != q) {
      q = x;
      x = x.parent;
    }
    return x;
  }
}

TreeNode leftMostChild(TreeNode n) {
  if (n == null) {
    return null;
  }

  while (n.left != null) {
    n = n.left;
  }

  return n;
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);
  root.print();
  for (int i = 0; i < array.length; i++) {
    TreeNode node = root.find(array[i]);
    TreeNode next = inorderSucc(node);
    if (next != null) {
      print("${node.data} -> ${next.data}");
    } else {
      print("${node.data} -> null");
    }
  }
}