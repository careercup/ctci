
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter04
{
    public class Q04_9 : IQuestion
    {
        public static void FindSum(TreeNode node, int sum, int[] path, int level)
        {
            if (node == null)
            {
                return;
            }

            /* Insert current node into path */
            path[level] = node.Data;

            var t = 0;

            for (var i = level; i >= 0; i--)
            {
                t += path[i];

                if (t == sum)
                {
                    Print(path, i, level);
                }
            }

            FindSum(node.Left, sum, path, level + 1);
            FindSum(node.Right, sum, path, level + 1);

            /* Remove current node from path. Not strictly necessary, since we would
             * ignore this value, but it's good practice.
             */
            path[level] = Int32.MinValue;
        }

        public static int Depth(TreeNode node)
        {
            if (node == null)
            {
                return 0;
            }

            return 1 + Math.Max(Depth(node.Left), Depth(node.Right));
        }

        public static void FindSum(TreeNode node, int sum)
        {
            var depth = Depth(node);
            var path = new int[depth];

            FindSum(node, sum, path, 0);
        }

        private static void Print(int[] path, int start, int end) 
        {
		    for (var i = start; i <= end; i++)
            {
                Console.WriteLine(path[i] + " ");
		    }

		    Console.WriteLine();
	    }
        
        public void Run()
        {
            var root = new TreeNode(5);
            root.Left = new TreeNode(3);
            root.Right = new TreeNode(1);
            root.Left.Left = new TreeNode(4);
            root.Left.Right = new TreeNode(8);
            root.Right.Left = new TreeNode(2);
            root.Right.Right = new TreeNode(6);

            FindSum(root, 8);
        }
    }
}