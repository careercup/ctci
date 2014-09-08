
using ctci.Contracts;
using System;
using System.Collections.Generic;

namespace Chapter07
{
    public class Q07_7 : IQuestion
    {
        // Note: using List instead of Queue since .NET Queue does not have remove
        public static int RemoveMin(List<Int32> list)
        {
            var index = 0;
            var min = list[0];

		    for (var loopCounter = 0; loopCounter < list.Count; loopCounter++)
            {
                if (min > list[loopCounter])
                {
                    min = list[loopCounter];
                    index = loopCounter;
                }
		    }

            list.Remove(index);
           
		    return min;
	    }

        public static void AddProducts(List<Int32> q, int v)
        {
            q.Add(v * 3);
            q.Add(v * 5);
            q.Add(v * 7);
        }

        public static int GetKthMagicNumber(int k)
        {
            if (k < 0)
            {
                return 0;
            }

            var val = 1;
            var q = new List<Int32>();
            AddProducts(q, 1);

            for (var i = 0; i < k; i++)
            { 
                // Start at 1 since we've already done one iteration
                val = RemoveMin(q);
                AddProducts(q, val);
            }
            
            return val;
        }

        public void Run()
        {
		    for (var i = 0; i < 14; i++) 
            {
			    Console.WriteLine(i + " : " + GetKthMagicNumber(i));
		    }
        }
    }
}