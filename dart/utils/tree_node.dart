library tree_node;
import 'dart:math';
part 'btree_printer.dart';

class TreeNode {
  int data;
  TreeNode left;
  TreeNode right;
  TreeNode parent;
  int _size = 0;

  TreeNode(this.data) : _size = 1;

  void setLeftChild(TreeNode left) {
    this.left = left;
    if (left != null) {
      left.parent = this;
    }
  }

  void setRightChild(TreeNode right) {
    this.right = right;
    if (right != null) {
      right.parent = this;
    }
  }

  void insertInOrder(int d) {
    if (d <= data) {
      if (left == null) {
        setLeftChild(new TreeNode(d));
      } else {
        left.insertInOrder(d);
      }
    } else {
      if (right == null) {
        setRightChild(new TreeNode(d));
      } else {
        right.insertInOrder(d);
      }
    }

    _size++;
  }

  int size() => _size;

  bool isBST() {
    if (left != null) {
      if (data < left.data || !left.isBST()) {
        return false;
      }
    }

    if (right != null) {
      if (data >= right.data || !right.isBST()) {
        return false;
      }
    }

    return true;
  }

  int height() {
    int leftHeight = left != null ? left.height() : 0;
    int rightHeight = right != null ? right.height() : 0;
    return 1 + max(leftHeight, rightHeight);
  }

  TreeNode find(int d) {
    if (d == data) {
      return this;
    } else if (d <= data) {
      return left != null ? left.find(d) : null;
    } else if (d > data) {
      return right != null ? right.find(d) : null;
    }

    return null;
  }

  static TreeNode createMinimalBST(List<int> arr, {int start: null, int end: null}) {
    if (start == null || end == null) {
      return createMinimalBST(arr, start: 0, end: arr.length -1);
    }

    if (end < start) {
      return null;
    }

    int mid = (start + end) ~/ 2;
    TreeNode n = new TreeNode(arr[mid]);
    n.setLeftChild(createMinimalBST(arr, start: start, end: mid - 1));
    n.setRightChild(createMinimalBST(arr, start: mid + 1, end: end));
    return n;
  }


  void print() {
    BTreePrinter.printNode(this);
  }

}