
using ctci.Contracts;
using ctci.Library;
using System;

namespace Chapter04
{
    public class Q04_8 : IQuestion
    {
        public static bool ContainsTree(TreeNode t1, TreeNode t2)
        {
            if (t2 == null)
            {
                return true; // The empty tree is a subtree of every tree.
            }
            
            return SubTree(t1, t2);
        }

        /* Checks if the binary tree rooted at node1 contains the binary tree 
         * rooted at node2 as a subtree somewhere within it.
         */
        public static bool SubTree(TreeNode node1, TreeNode node2)
        {
            if (node1 == null)
            {
                // big tree empty & subtree still not found.
                return false; 
            }

            if (node1.Data == node2.Data)
            {
                if (MatchTree(node1, node2))
                {
                    return true;
                }
            }

            return (SubTree(node1.Left, node2) || SubTree(node1.Right, node2));
        }

        /* Checks if the binary tree rooted at node1 contains the 
         * binary tree rooted at node2 as a subtree starting at node1.
         */
        public static bool MatchTree(TreeNode node1, TreeNode node2)
        {
            if (node2 == null && node1 == null)
            {
                // nothing left in the subtree
                return true;
            }

            if (node1 == null || node2 == null)
            {
                //  big tree empty & subtree still not found
                return false;
            }

            if (node1.Data != node2.Data)
            {
                // data doesn’t match
                return false; 
            }

            return (MatchTree(node1.Left, node2.Left) && MatchTree(node1.Right, node2.Right));
        }

        public void Run()
        {
		    // t2 is a subtree of t1
		    int[] array1 = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
		    int[] array2 = {2, 4, 5, 8, 9, 10, 11};
		
		    var t1 = AssortedMethods.CreateTreeFromArray(array1);
		    var t2 = AssortedMethods.CreateTreeFromArray(array2);

            Console.WriteLine((ContainsTree(t1, t2) ? "t2 is a subtree of t1" : "t2 is not a subtree of t1"));

		    // t4 is not a subtree of t3
		    int[] array3 = {1, 2, 3};
		    var t3 = AssortedMethods.CreateTreeFromArray(array1);
		    var t4 = AssortedMethods.CreateTreeFromArray(array3);

            Console.WriteLine((ContainsTree(t3, t4)) ? "t4 is a subtree of t3" : "t4 is not a subtree of t3");
        }
    }
}