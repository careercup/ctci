import 'dart:math';

import '../../utils/assorted_methods.dart';
import '../../utils/tree_node.dart';

int getHeight(TreeNode root) {
  if (root == null) {
    return 0;
  }

  return max(getHeight(root.left), getHeight(root.right)) + 1;
}

bool isBalanced(TreeNode root) {
  if (root == null) {
    return true;
  }

  int heightDiff = getHeight(root.left) - getHeight(root.right);
  if (heightDiff.abs() > 1) {
    return false;
  } else {
    return isBalanced(root.left) && isBalanced(root.right);
  }
}

void main() {
  // Create balanced tree
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);
  print("Root? ${root.data}");
  print("Is balanced? ${isBalanced(root)}");
  root.print();

  // Could be balanced, actually, but it's very unlikely...
  TreeNode unbalanced = new TreeNode(10);
  for (int i = 0; i < 10; i++) {
    unbalanced.insertInOrder(randomIntInRange(0, 100));
  }

  print("Root? ${unbalanced.data}");
  print("Is balanced? ${isBalanced(unbalanced)}");
  unbalanced.print();
}