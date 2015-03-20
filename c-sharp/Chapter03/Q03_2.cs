
using ctci.Contracts;
using ctci.Library;
using System;
using System.Collections.Generic;

namespace Chapter03
{
    public class Q03_2 : IQuestion
    {
        class NodeWithMin
        {
            public int Value {get; set;}
            public int Min {get; set;}
            
            public NodeWithMin(int value, int min)
            {
                Value = value;
                Min = min;
            }
        }

        class StackWithMin : Stack<NodeWithMin>
        {
            public void Push2(int value) 
            {
                var newMin = Math.Min(value, Min());
                Push(new NodeWithMin(value, newMin));
            }
    
            public int Min() 
            {
    	        if (Count == 0) 
                {
                    return int.MaxValue;
    	        } 
                else 
                {
    		        return Peek().Min;
    	        }
            }
        }

        public class StackWithMin2 : Stack<int>
        {
            readonly Stack<int> _s2;
	
	        public StackWithMin2() 
            {
		        _s2 = new Stack<int>();		
	        }
	
	        public void Push2(int value)
            {
		        if (value <= Min()) 
                {
			        _s2.Push(value);
		        }
		        
                Push(value);
	        }
	
	        public int Pop2() 
            {
		        var value = Pop();

		        if (value == Min()) {
			        _s2.Pop();			
		        }

		        return value;
	        }
	
	        public int Min() 
            {
		        if (_s2.Count == 0) 
                {
			        return int.MaxValue;
		        } 
                else 
                {
			        return _s2.Peek();
		        }
	        }
        }

        public void Run()
        {
		    var stack = new StackWithMin();
		    var stack2 = new StackWithMin2();

		    for (var i = 1; i <= 10; i++) 
            {
			    var value = AssortedMethods.RandomIntInRange(0, 100);
			    stack.Push2(value);
			    stack2.Push2(value);
			    Console.Write(value + ", ");
		    }

		    Console.WriteLine('\n');
            for (var i = 1; i <= 10; i++)
            {
			    Console.WriteLine("Popped " + stack.Pop().Value + ", " + stack2.Pop2());
			    Console.WriteLine("New min is " + stack.Min() + ", " + stack2.Min());
		    }
        }
    }
}