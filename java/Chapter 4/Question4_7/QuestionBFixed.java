
import CtCILibrary.TreeNode;

public class QuestionBFixed {
  public static boolean covers(TreeNode root, TreeNode p) {
    if (root == null) return false;
    if (root == p) return true;
    return covers(root.left, p) || covers(root.right, p);
  }

  public static TreeNode commonAncestorHelper(TreeNode root, TreeNode p, TreeNode q,
      boolean covered) {
    if (root == null) {
      return null;
    }
    boolean is_p_on_left = covers(root.left, p);
    boolean is_q_on_left = covers(root.left, q);
    if(covered && (is_p_on_left || is_q_on_left)) {
      return root;
    }
    if (is_p_on_left != is_q_on_left) { // Nodes are on different side
      return root;
    }
    TreeNode child_side = is_p_on_left ? root.left : root.right;
    return commonAncestorHelper(child_side, p, q, covered);
  }

  public static TreeNode commonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    if (!covers(root, p) || !covers(root, q)) { // Error check - one node is not in tree
      return null;
    }
    boolean covered = false;
    if(covers(p, q) || covers(p, q)) {
      covered = true;
    }
    return commonAncestorHelper(root, p, q, covered);
  }

  public static void main(String[] args) {
    int[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    TreeNode root = TreeNode.createMinimalBST(array);
    TreeNode n3 = root.find(6);
    TreeNode n7 = root.find(7);
    TreeNode ancestor = commonAncestor(root, n3, n7);
    System.out.println(ancestor.data);
  }

}
