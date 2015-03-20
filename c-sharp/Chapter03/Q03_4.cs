
using ctci.Contracts;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;

namespace Chapter03
{
    public class Q03_4 : IQuestion
    {
        [DebuggerDisplay("Label = {Label}")]
        public class Tower 
        {
            public string Label { get; set; }

            readonly Stack<int> _disks;
            private int Index { get; set; }

            public Tower(int index) 
            {
		        _disks = new Stack<int>();
		        Index = index;
	        }
	
	        public void Add(int disk) 
            {
		        if (_disks.Count != 0 && _disks.Peek() <= disk) 
                {
			        Console.WriteLine("Error placing disk " + disk);
		        } 
                else 
                {
			        _disks.Push(disk);
		        }
	        }
	
	        public void MoveTopTo(Tower tower) 
            {
		        var top = _disks.Pop();
		        tower.Add(top);
	        }
	
	        public void Print() 
            {
                var sb = new StringBuilder();

                foreach (var disk in _disks)
                {
                    sb.AppendFormat("{0},", disk);
                }

	            if (sb.Length != 0)
	            {
	                sb.Remove(sb.Length - 1, 1);
	            }

		        Console.WriteLine("Contents of Tower " + Index + ": " + sb);
	        }
	
            public void MoveDisks(int n, Tower destination, Tower buffer)
            {
		        if (n > 0) 
                {
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
            const int n = 5;
            var towers = new Tower[3];

            for (var i = 0; i < 3; i++)
            {
                towers[i] = new Tower(i);
                towers[i].Label = string.Format("{0}", i); ;
            }

            for (var i = n - 1; i >= 0; i--)
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