import '../../utils/tree_node.dart';

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // We needed this code for other files, so check out the code in the library.
  TreeNode root = TreeNode.createMinimalBST(array);
  print("Root? ${root.data}");
  print("Created BST? ${root.isBST()}");
  print("Height: ${root.height()}");
}