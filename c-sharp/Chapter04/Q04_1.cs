
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter04
{
    public class Q04_1 : IQuestion
    {
        #region Brute Force

        int GetHeight(TreeNode root)
        {
            if (root == null)
            {
                return 0;
            }

            return Math.Max(GetHeight(root.Left), GetHeight(root.Right)) + 1;
        }

        bool IsBalanced(TreeNode root)
        {
            if (root == null)
            {
                return true;
            }

            var heightDiff = GetHeight(root.Left) - GetHeight(root.Right);
            
            if (Math.Abs(heightDiff) > 1)
            {
                return false;
            }
            else
            {
                return IsBalanced(root.Left) && IsBalanced(root.Right);
            }
        }

        #endregion

        #region Improved

        int CheckHeight(TreeNode root)
        {
            if (root == null)
            {
                return 0;
            }

            var leftHeight = CheckHeight(root.Left);
            
            if (leftHeight == -1)
            {
                return -1;
            }
            
            var rightHeight = CheckHeight(root.Right);
            
            if (rightHeight == -1)
            {
                return -1;
            }

            var heightDiff = leftHeight - rightHeight;
            
            if (Math.Abs(heightDiff) > 1)
            {
                return -1;
            }
            else
            {
                return Math.Max(leftHeight, rightHeight) + 1;
            }
        }

        bool IsBalancedImproved(TreeNode root)
        {
            if (CheckHeight(root) == -1)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        #endregion

        public void Run()
        {
		    // Create balanced tree
		    int[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		    var root = TreeNode.CreateMinimalBst(array);
		    Console.WriteLine("Root? " + root.Data);
		    Console.WriteLine("Is balanced? " + IsBalanced(root));
            Console.WriteLine("Improved Is balanced? " + IsBalancedImproved(root));
		
		    // Could be balanced, actually, but it's very unlikely...
		    var unbalanced = new TreeNode(10);
		    for (var i = 0; i < 10; i++) 
            {
			    unbalanced.InsertInOrder(AssortedMethods.RandomIntInRange(0, 100));
		    }

		    Console.WriteLine("Root? " + unbalanced.Data);
            Console.WriteLine("Is balanced? " + IsBalanced(unbalanced));
            Console.WriteLine("Improved Is balanced? " + IsBalancedImproved(unbalanced));
        }
    }
}