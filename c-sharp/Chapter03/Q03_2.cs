using System;
using System.Collections.Generic;
using ctci.Contracts;
using ctci.Library;

namespace Chapter03
{
    public class Q03_2 : IQuestion
    {
        class NodeWithMin
        {
            public int Value {get; set;}
            public int Min {get; set;}
            public NodeWithMin(int v, int min)
            {
                Value = v;
                this.Min = min;
            }
        }

        class StackWithMin : Stack<NodeWithMin>
        {
            public void Push2(int value) {
                int newMin = Math.Min(value, Min());
                base.Push(new NodeWithMin(value, newMin));
            }
    
            public int Min() {
    	        if (this.Count == 0) {
                    return int.MaxValue;
    	        } else {
    		        return Peek().Min;
    	        }
            }
        }

        public class StackWithMin2 : Stack<int>
        {
            readonly Stack<int> _s2;
	
	        public StackWithMin2() {
		        _s2 = new Stack<int>();		
	        }
	
	        public void Push2(int value){
		        if (value <= Min()) {
			        _s2.Push(value);
		        }
		        base.Push(value);
	        }
	
	        public int Pop2() {
		        int value = base.Pop();
		        if (value == Min()) {
			        _s2.Pop();			
		        }
		        return value;
	        }
	
	        public int Min() {
		        if (_s2.Count == 0) {
			        return int.MaxValue;
		        } else {
			        return _s2.Peek();
		        }
	        }
        }

        public void Run()
        {
		    StackWithMin stack = new StackWithMin();
		    StackWithMin2 stack2 = new StackWithMin2();
		    for (int i = 1; i <= 10; i++) 
            {
			    int value = AssortedMethods.RandomIntInRange(0, 100);
			    stack.Push2(value);
			    stack2.Push2(value);
			    Console.Write(value + ", ");
		    }
		    Console.WriteLine('\n');
            for (int i = 1; i <= 10; i++)
            {
			    Console.WriteLine("Popped " + stack.Pop().Value + ", " + stack2.Pop2());
			    Console.WriteLine("New min is " + stack.Min() + ", " + stack2.Min());
		    }
        }
    }
}
