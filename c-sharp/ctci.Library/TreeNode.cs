using System;
using System.Diagnostics;

namespace ctci.Library
{
    [DebuggerDisplay("{Data}")]
    public class TreeNode
    {
        public int Data {get; set;}
        public TreeNode Left {get; set;}
	    public TreeNode Right {get; set;}
	    public TreeNode Parent {get; set;}
	    public int Size {get; set;}

	    public TreeNode(int d) 
        {
		    Data = d;
		    Size = 1;
	    }
	
	    public void SetLeftChild(TreeNode left) 
        {
		    this.Left = left;
		    if (left != null) {
			    left.Parent = this;
		    }
	    }
	
	    public void SetRightChild(TreeNode right) 
        {
		    this.Right = right;
		    if (right != null) {
			    right.Parent = this;
		    }
	    }
	
	    public void InsertInOrder(int d) 
        {
		    if (d <= Data) {
			    if (Left == null) {
				    SetLeftChild(new TreeNode(d));
			    } else {
				    Left.InsertInOrder(d);
			    }
		    } else {
			    if (Right == null) {
				    SetRightChild(new TreeNode(d));
			    } else {
				    Right.InsertInOrder(d);
			    }
		    }
		    Size++;
	    }
	
	    public bool IsBst() 
        {
		    if (Left != null) {
			    if (Data < Left.Data || !Left.IsBst()) {
				    return false;
			    }
		    }
		
		    if (Right != null) {
			    if (Data >= Right.Data || !Right.IsBst()) {
				    return false;
			    }
		    }		
		
		    return true;
	    }
	
	    public int Height() 
        {
		    int leftHeight = Left != null ? Left.Height() : 0;
		    int rightHeight = Right != null ? Right.Height() : 0;
		    return 1 + Math.Max(leftHeight, rightHeight);
	    }
	
	    public TreeNode Find(int d) 
        {
		    if (d == Data) {
			    return this;
		    } else if (d <= Data) {
			    return Left != null ? Left.Find(d) : null;
		    } else if (d > Data) {
			    return Right != null ? Right.Find(d) : null;
		    }
		    return null;
	    }
	
	    private static TreeNode CreateMinimalBst(int[] arr, int start, int end)
        {
		    if (end < start) {
			    return null;
		    }
		    int mid = (start + end) / 2;
		    TreeNode n = new TreeNode(arr[mid]);
		    n.SetLeftChild(CreateMinimalBst(arr, start, mid - 1));
		    n.SetRightChild(CreateMinimalBst(arr, mid + 1, end));
		    return n;
	    }
	
	    public static TreeNode CreateMinimalBst(int[] array) 
        {
		    return CreateMinimalBst(array, 0, array.Length - 1);
	    }
	
	    public void Print() {
            BTreePrinter.PrintNode(this);
	    }
    }
}
