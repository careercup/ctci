
using ctci.Contracts;
using ctci.Library;
using System;
using System.Collections.Generic;

namespace Chapter04
{
    public class Q04_4 : IQuestion
    {
        public static List<LinkedList<TreeNode>> CreateLevelLinkedList(TreeNode root) 
        {
		    var result = new List<LinkedList<TreeNode>>();
		
		    /* "Visit" the root */
		    var current = new LinkedList<TreeNode>();
		    if (root != null) 
            {
			    current.AddFirst(root);
		    }
		
		    while (current.Count > 0) 
            {
                // Add previous level
			    result.Add(current);

                // Go to next level
			    var parents = current; 
			    current = new LinkedList<TreeNode>(); 

			    foreach (var parent in parents) 
                {
				    /* Visit the children */
				    if (parent.Left != null) 
                    {
					    current.AddLast(parent.Left);
				    }

				    if (parent.Right != null) 
                    {
					    current.AddLast(parent.Right);
				    }
			    }
		    }

		    return result;
	    }

        public static void PrintResult(List<LinkedList<TreeNode>> result)
        {
		    var depth = 0;

		    foreach (var entry in result)
            {
			    var enumerator = entry.GetEnumerator();
                Console.WriteLine("Link list at depth " + depth + ":");

			    while(enumerator.MoveNext())
                {
                    if (enumerator.Current != null)
                    {
                        Console.WriteLine(" " + (enumerator.Current.Data));
                    }
			    }
			    Console.WriteLine();

			    depth++;
		    }
	    }

        public void Run()
        {
            int[] nodesFlattened = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            var root = AssortedMethods.CreateTreeFromArray(nodesFlattened);
            var list = CreateLevelLinkedList(root);

            PrintResult(list);
        }
    }
}