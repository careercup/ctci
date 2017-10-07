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

	    public TreeNode(int data) 
        {
		    Data = data;
		    Size = 1;
	    }
	
	    public void SetLeftChild(TreeNode left) 
        {
		    Left = left;

		    if (left != null) 
            {
			    left.Parent = this;
		    }
	    }
	
	    public void SetRightChild(TreeNode right) 
        {
		    Right = right;
            
		    if (right != null) 
            {
			    right.Parent = this;
		    }
	    }
	
	    public void InsertInOrder(int data) 
        {
		    if (data <= Data) 
            {
			    if (Left == null) 
                {
				    SetLeftChild(new TreeNode(data));
			    } 
                else 
                {
				    Left.InsertInOrder(data);
			    }
		    } 
            else 
            {
			    if (Right == null) 
                {
				    SetRightChild(new TreeNode(data));
			    }
                else 
                {
				    Right.InsertInOrder(data);
			    }
		    }

		    Size++;
	    }
	
	    public bool IsBst() 
        {
		    if (Left != null)
            {
			    if (Data < Left.Data || !Left.IsBst()) 
                {
				    return false;
			    }
		    }
		
		    if (Right != null) 
            {
			    if (Data >= Right.Data || !Right.IsBst()) 
                {
				    return false;
			    }
		    }		
		
		    return true;
	    }
	
	    public int Height() 
        {
		    var leftHeight = Left != null ? Left.Height() : 0;
		    var rightHeight = Right != null ? Right.Height() : 0;

		    return 1 + Math.Max(leftHeight, rightHeight);
	    }
	
	    public TreeNode Find(int data) 
        {
		    if (data == Data) 
            {
			    return this;
		    } 
            else if (data <= Data) 
            {
			    return Left != null ? Left.Find(data) : null;
		    } 
            else if (data > Data) 
            {
			    return Right != null ? Right.Find(data) : null;
		    }

		    return null;
	    }
	
	    private static TreeNode CreateMinimalBst(int[] array, int start, int end)
        {
		    if (end < start) 
            {
			    return null;
		    }

		    var mid = (start + end) / 2;
		    var treeNode = new TreeNode(array[mid]);
		    treeNode.SetLeftChild(CreateMinimalBst(array, start, mid - 1));
		    treeNode.SetRightChild(CreateMinimalBst(array, mid + 1, end));

		    return treeNode;
	    }
	
	    public static TreeNode CreateMinimalBst(int[] array) 
        {
		    return CreateMinimalBst(array, 0, array.Length - 1);
	    }
	
	    public void Print() 
        {
            BTreePrinter.PrintNode(this);
	    }
    }
}