import 'dart:math';
import '../../utils/tree_node.dart';

int MIN_VALUE = -10000000;

void findSumWithPath(TreeNode node, int sum, List<int> path, int level) {
  if (node == null) {
    return;
  }

  /* Insert current node into path */
  path[level] = node.data;

  int t = 0;
  for (int i = level; i >= 0; i--) {
    t += path[i];
    if (t == sum) {
      print_path(path, i, level);
    }
  }

  findSumWithPath(node.left, sum, path, level + 1);
  findSumWithPath(node.right, sum, path, level + 1);

  /*
   * Remove current node from path. Not strictly necessary,
   * since we would ignore this value, but it's good practice.
   */
  path[level] = MIN_VALUE;
}

int depth(TreeNode node) {
  if (node == null) {
    return 0;
  } else {
    return 1 + max(depth(node.left), depth(node.right));
  }
}

void findSum(TreeNode node, int sum) {
  int _depth = depth(node);
  List<int> path = new List<int>(_depth);
  // clear out path of nulls
  for (int i = 0; i < path.length; i++) path[i] = 0;

  findSumWithPath(node, sum, path, 0);
}

void print_path(List<int> path, int start, int end) {
  StringBuffer sb = new StringBuffer();
  for (int i = start; i <= end; i++) {
    sb.write("${path[i]} ");
  }

  print(sb.toString());
}

void main() {
  TreeNode root = new TreeNode(5);
  root.left = new TreeNode(3);
  root.right = new TreeNode(1);
  root.left.left = new TreeNode(4);
  root.left.right = new TreeNode(8);
  root.right.left = new TreeNode(2);
  root.right.right = new TreeNode(6);
  findSum(root, 8);
}