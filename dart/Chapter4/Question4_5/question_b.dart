import '../../utils/tree_node.dart';
import '../../utils/assorted_methods.dart';

int MIN_VALUE = -1000;
int MAX_VALUE = 1000;

class IntWrapper {
  int data;
  IntWrapper(this.data);
}

bool checkBST(TreeNode n, {int min: null, int max: null}) {
  if (min == null && max == null) {
    return checkBST(n, min: MIN_VALUE, max: MAX_VALUE);
  }

  if (n == null) {
    return true;
  }

  if (n.data <= min || n.data > max) {
    return false;
  }

  if (!checkBST(n.left, min: min, max: n.data) || !checkBST(n.right, min: n.data, max: max)) {
    return false;
  }

  return true;
}

bool checkBSTAlternate(TreeNode n, {IntWrapper min: null, IntWrapper max: null}) {
  if (min == null && max == null) {
    return checkBSTAlternate(n, min: new IntWrapper(0), max: new IntWrapper(0));
  }

  /* An alternate, less clean approach. This is not provided in the book, but is used to test the other method */
  if (n.left == null) {
    min.data = n.data;
  } else {
    IntWrapper leftMin = new IntWrapper(0);
    IntWrapper leftMax = new IntWrapper(0);
    if (!checkBSTAlternate(n.left, min: leftMin, max: leftMax)) {
      return false;
    }

    if (leftMax.data > n.data) {
      return false;
    }

    min.data = leftMin.data;
  }

  if (n.right == null) {
    max.data = n.data;
  } else {
    IntWrapper rightMin = new IntWrapper(0);
    IntWrapper rightMax = new IntWrapper(0);
    if (!checkBSTAlternate(n.right, min: rightMin, max: rightMax)) {
      return false;
    }

    if (rightMin.data <= n.data) {
      return false;
    }

    max.data = rightMax.data;
  }

  return true;
}

/* Create a tree that may or may not be a BST */
TreeNode createTestTree() {
  /* Create a random BST */
  TreeNode head = randomBST(10, -10, 10);

  /* Insert an element into the BST and potentially ruin the BST property */
  TreeNode node = head;

  do {
    int n = randomIntInRange(-10, 10);
    int rand = randomIntInRange(0, 5);
    if (rand == 0) {
      node.data = n;
    } else if (rand == 1) {
      node = node.left;
    } else if (rand == 2) {
      node = node.right;
    } else if (rand == 3 || rand == 4) {
      break;
    }
  } while (node != null);

  return head;
}


void main() {
  /* Simple test -- create one */
  List<int> array = [3, 5, 6, 10, 13, 15];
  TreeNode node = TreeNode.createMinimalBST(array);

  //node.left.data = 6; // "ruin" the BST property by changing one of the elements
  node.print();

  bool isBst = checkBST(node);
  print(isBst);

  /* More elaborate test -- creates 100 trees (some BST, some not) and compares the outputs of various methods. */
  /*
  for (int i = 0; i < 100; i++) {
    TreeNode head = createTestTree();

    // Compare results
    bool isBst1 = checkBST(head);
    bool isBst2 = checkBSTAlternate(head);

    if (isBst1 != isBst2) {
      print("*********************** ERROR *******************");
      head.print();
      break;
    } else {
      print("$isBst1 | $isBst2");
      head.print();
    }
  }
  */

}