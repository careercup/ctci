import '../../utils/assorted_methods.dart';
import '../../utils/tree_node.dart';

bool containsTree(TreeNode t1, TreeNode t2) {
  if (t2 == null) {
    return true; // The empty tree is a subtree of every tree.
  } else {
    return subTree(t1, t2);
  }
}

/*
 * Checks if the binary tree rooted at r1 contains the binary
 * tree rooted at r2 as a subtree somewhere within it.
 */
bool subTree(TreeNode r1, TreeNode r2) {
  if (r1 == null) {
    return false; // big tree empty & subtree still not found.
  }

  if (r1.data == r2.data) {
    if (matchTree(r1, r2)) {
      return true;
    }
  }

  return (subTree(r1.left, r2) || subTree(r1.right, r2));
}

/*
 * Checks if the binary tree rooted at r1 contains the
 * binary tree rooted at r2 as a subtree starting at r1.
 */
bool matchTree(TreeNode r1, TreeNode r2) {
  if (r2 == null && r1 == null) {
    return true; // nothing left in the subtree
  }

  if (r1 == null || r2 == null) {
    return false; // big tree empty & subtree still not found
  }

  if (r1.data != r2.data) {
    return false; // data doesn't match
  }

  return (matchTree(r1.left, r2.left) && matchTree(r1.right, r2.right));
}

void main() {
  // t2 is a subtree of t1
  List<int> array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  List<int> array2 = [2, 4, 5, 8, 9, 10, 11];

  TreeNode t1 = createTreeFromArray(array1);
  TreeNode t2 = createTreeFromArray(array2);

  if (containsTree(t1, t2)) {
    print("t2 is a subtree of t1");
  } else {
    print("t2 is not a subtree of t1");
  }

  // t4 is not a subtree of t3
  List<int> array3 = [1, 2, 3];
  TreeNode t3 = createTreeFromArray(array1);
  TreeNode t4 = createTreeFromArray(array2);

  if (containsTree(t3, t4)) {
    print("t4 is a subtree of t3");
  } else {
    print("t4 is not a subtree of t3");
  }
}