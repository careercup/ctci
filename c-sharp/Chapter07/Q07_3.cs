
using ctci.Contracts;
using System;

namespace Chapter07
{
    public class Q07_3 : IQuestion
    {
        public static int RandomInt(int n)
        {
            var random = new Random(DateTime.Now.Millisecond);

            return (int)(random.Next(2) * n);
        }

        public void Run()
        {
		    for (var i = 0; i < 10; i++) 
            {
                var line1 = new Line(RandomInt(5), RandomInt(1));
                var line2 = new Line(RandomInt(5), RandomInt(2));

			    line1.Print();
			    Console.Write(", ");
			    line2.Print();

                if (line1.Intersect(line2)) 
                {
				    Console.WriteLine("  YES");
			    } 
                else 
                {
                    Console.WriteLine("  NO");
			    }
		    }
        }
    }

    public class Line
    {
        const double Epsilon = 0.000001;
        public double Slope;
        public double Yintercept;

        public Line(double s, double y)
        {
            Slope = s;
            Yintercept = y;
        }

        public void Print() 
        {
		    Console.Write("y = " + Slope + "x + " + Yintercept);
	    }

        public bool Intersect(Line line2)
        {
            return Math.Abs(Slope - line2.Slope) > Epsilon || Math.Abs(Yintercept - line2.Yintercept) < Epsilon;
        }
    };
}