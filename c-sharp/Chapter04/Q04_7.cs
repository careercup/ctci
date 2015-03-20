
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter04
{
    public class Q04_7 : IQuestion
    {
        const int TwoNodesFound = 2;
        const int OneNodeFound = 1;
        const int NoNodesFound = 0;

        // Checks how many “special” nodes are located under this root
        public static int Covers(TreeNode root, TreeNode p, TreeNode q)
        {
            var nodesFound = NoNodesFound;

            if (root == null)
            {
                return nodesFound;
            }
            
            if (root == p || root == q)
            {
                nodesFound += 1;
            }

            nodesFound += Covers(root.Left, p, q);

            if (nodesFound == TwoNodesFound) // Found p and q 
            {
                return nodesFound;
            }

            return nodesFound + Covers(root.Right, p, q);
        }

        public static TreeNode CommonAncestor(TreeNode root, TreeNode p, TreeNode q)
        {
            if (q == p && (root.Left == q || root.Right == q))
            {
                return root;
            }

            // Check left side
            var nodesFromLeft = Covers(root.Left, p, q); 

            if (nodesFromLeft == TwoNodesFound)
            {
                if (root.Left == p || root.Left == q)
                {
                    return root.Left;
                }
                
                return CommonAncestor(root.Left, p, q);
            }
            else if (nodesFromLeft == OneNodeFound)
            {
                if (root == p)
                {
                    return p;
                }
                else if (root == q)
                {
                    return q;
                }
            }
            
            // Check right side
            var nodesFromRight = Covers(root.Right, p, q); 

            if (nodesFromRight == TwoNodesFound)
            {
                if (root.Right == p || root.Right == q)
                {
                    return root.Right;
                }
                
                return CommonAncestor(root.Right, p, q);
            }
            else if (nodesFromRight == OneNodeFound)
            {
                if (root == p)
                {
                    return p;
                }
                else if (root == q)
                {
                    return q;
                }
            }

            if (nodesFromLeft == OneNodeFound && nodesFromRight == OneNodeFound)
            {
                return root;
            }
            
            return null;
        }

        public void Run()
        {
            int[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		    var root = TreeNode.CreateMinimalBst(array);
            var n3 = root.Find(1);
            var n7 = root.Find(7);
            var ancestor = CommonAncestor(root, n3, n7);

		    Console.WriteLine(ancestor.Data);
        }
    }
}