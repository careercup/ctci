
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter04
{
    public class Q04_6 : IQuestion
    {
        public static TreeNode LeftMostChild(TreeNode node)
        {
            if (node == null)
            {
                return null;
            }

            while (node.Left != null)
            {
                node = node.Left;
            }

            return node;
        }

        public static TreeNode InorderSucc(TreeNode node)
        {
            if (node == null)
            {
                return null;
            }

            // Found right children -> return left most node of right subtree
            if (node.Parent == null || node.Right != null)
            {
                return LeftMostChild(node.Right);
            }


            var q = node;
            var x = q.Parent;

            // Go up until we’re on left instead of right
            while (x != null && x.Left != q)
            {
                q = x;
                x = x.Parent;
            }

            return x;
        } 

        public void Run()
        {
            int[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		    var root = TreeNode.CreateMinimalBst(array);

		    for (var i = 0; i < array.Length; i++) 
            {
			    var node = root.Find(array[i]);
			    var next = InorderSucc(node);

			    if (next != null) 
                {
				    Console.WriteLine(node.Data + "->" + next.Data);
			    } 
                else 
                {
                    Console.WriteLine(node.Data + "->" + null);
			    }
		    }
        }
    }
}