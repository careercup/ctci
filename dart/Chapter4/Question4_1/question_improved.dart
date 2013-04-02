import 'dart:math';

import '../../utils/tree_node.dart';

int checkHeight(TreeNode root) {
  if (root == null) {
    return 0;
  }

  int leftHeight = checkHeight(root.left);
  if (leftHeight == -1) {
    return -1;
  }

  int rightHeight = checkHeight(root.right);
  if (rightHeight == -1) {
    return -1;
  }

  int heightDiff = leftHeight - rightHeight;
  if (heightDiff.abs() > 1) {
    return -1;
  } else {
    return max(leftHeight, rightHeight) + 1;
  }
}

bool isBalanced(TreeNode root) {
  if (checkHeight(root) == -1) {
    return false;
  } else {
    return true;
  }
}

void main() {
  // Create balanced tree
  List<int> array = [0, 1, 2, 3, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);

  print("Is balanced? ${isBalanced(root)}");
  root.print();

  root.insertInOrder(-1); // Add 4 to make it unbalanced
  print("Is balanced? ${isBalanced(root)}");
  root.print();

  root.insertInOrder(-1 + 4); // Add 4 to make it unbalanced
  print("Is balanced? ${isBalanced(root)}");
  root.print();
}