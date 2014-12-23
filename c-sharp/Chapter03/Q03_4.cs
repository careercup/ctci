using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using ctci.Contracts;

namespace Chapter03
{
    public class Q03_4 : IQuestion
    {
        [DebuggerDisplay("Label = {Label}")]
        public class Tower {

            public string Label {get; set;}

            readonly Stack<int> _disks;
            private int Index {get; set; }

            public Tower(int i) {
		        _disks = new Stack<int>();
		        Index = i;
	        }
	
	        public void Add(int d) {
		        if (_disks.Count != 0 && _disks.Peek() <= d) {
			        Console.WriteLine("Error placing disk " + d);
		        } else {
			        _disks.Push(d);
		        }
	        }
	
	        public void MoveTopTo(Tower t) {
		        int top = _disks.Pop();
		        t.Add(top);
	        }
	
	        public void Print() {
                StringBuilder sb = new StringBuilder();
                foreach (int v in _disks)
                {
                    sb.AppendFormat("{0},", v);
                }
	            if (sb.Length != 0)
	                sb.Remove(sb.Length - 1, 1);

		        Console.WriteLine("Contents of Tower " + Index + ": " + sb);
	        }
	
            public void MoveDisks(int n, Tower destination, Tower buffer){
		        if (n > 0) {
                    ////////////String tag = "move_" + n + "_disks_from_" + Index + "_to_" + destination.Index + "_with_buffer_" + buffer.Index; 
                    ////////////Console.WriteLine("<" + tag + ">");
			        MoveDisks(n - 1, buffer, destination);
                    ////////////Console.WriteLine("<move_top_from_" + Index + "_to_" + destination.Index + ">");
                    ////////////Console.WriteLine("<before>");
                    ////////////Console.WriteLine("<source_print>");
                    ////////////Print();
                    ////////////Console.WriteLine("</source_print>");
                    ////////////Console.WriteLine("<destination_print>");
                    ////////////destination.Print();
                    ////////////Console.WriteLine("</destination_print>");
                    ////////////Console.WriteLine("</before>");
			        MoveTopTo(destination);
                    ////////////Console.WriteLine("<after>");
                    ////////////Console.WriteLine("<source_print>");
                    ////////////Print();
                    ////////////Console.WriteLine("</source_print>");
                    ////////////Console.WriteLine("<destination_print>");
                    ////////////destination.Print();
                    ////////////Console.WriteLine("</destination_print>");
                    ////////////Console.WriteLine("</after>");
                    ////////////Console.WriteLine("</move_top_from_" + Index + "_to_" + destination.Index + ">");
			        buffer.MoveDisks(n - 1, destination, this);
                    ////////////Console.WriteLine("</" + tag + ">");
		        }
	        }
        }

        public void Run()
        {
            // Set up code.
            int n = 5;
            Tower[] towers = new Tower[3];
            for (int i = 0; i < 3; i++)
            {
                towers[i] = new Tower(i);
                towers[i].Label = string.Format("{0}", i); ;
            }
            for (int i = n - 1; i >= 0; i--)
            {
                towers[0].Add(i);
            }

            // Copy and paste output into a .XML file and open it with internet explorer.
            towers[0].Print();
            towers[1].Print();
            towers[2].Print();

            towers[0].MoveDisks(n, towers[2], towers[1]);

            towers[0].Print();
            towers[1].Print();
            towers[2].Print();
        }
    }
}
