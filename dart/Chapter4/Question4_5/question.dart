import '../../utils/tree_node.dart';

int last_printed = 0; // minimum value our ints can have.

bool checkBST(TreeNode n) {
  if (n == null) {
    return true;
  }

  // Check / recurse left
  if (!checkBST(n.left)) {
    return false;
  }

  // Check current
  if (n.data < last_printed) {
    return false;
  }

  last_printed = n.data;

  // Check /recurse right
  if (!checkBST(n.right)) {
    return false;
  }

  return true;
}

void main() {
  List<int> array = [3, 5, 7, 10, 13, 15, 20];
  TreeNode node = TreeNode.createMinimalBST(array);
  //node.left.right.data = 3;
  print(checkBST(node));
}