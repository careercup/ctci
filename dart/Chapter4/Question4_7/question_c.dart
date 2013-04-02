import '../../utils/tree_node.dart';

class Result {
  TreeNode node;
  bool isAncestor;
  Result(this.node, this.isAncestor);
}

Result commonAncestorHelper(TreeNode root, TreeNode p, TreeNode q) {
  if (root == null) {
    return new Result(null, false);
  }

  if (root == p && root == q) {
    return new Result(root, true);
  }

  Result rx = commonAncestorHelper(root.left, p, q);
  if (rx.isAncestor) { // Found common ancestor
    return rx;
  }

   Result ry = commonAncestorHelper(root.right, p, q);
   if (ry.isAncestor) { // Found common ancestor
     return ry;
   }

   if (rx.node != null && ry.node != null) {
     return new Result(root, true); // This is the common ancestor
   } else if (root == p || root == q) {
     /* If we're currently at p or q, and we also found one of those
      * nodes in a subtree, then this is truly an ancestor and the
      * flag should be true.
      */
     bool isAncestor = rx.node != null || ry.node != null ? true : false;
     return new Result(root, isAncestor);
   } else {
     return new Result(rx.node != null ? rx.node : ry.node, false);
   }
}

TreeNode commonAncestor(TreeNode root, TreeNode p, TreeNode q) {
  Result r = commonAncestorHelper(root, p, q);
  if (r.isAncestor) {
    return r.node;
  }

  return null;
}

void main() {
  List<int> array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  TreeNode root = TreeNode.createMinimalBST(array);
  TreeNode n3 = root.find(1);
  TreeNode n7 = root.find(7);
  TreeNode ancestor = commonAncestor(root, n3, n7);
  if (ancestor != null) {
    ancestor.print();
    print(ancestor.data);
  } else {
    print("null");
  }
}