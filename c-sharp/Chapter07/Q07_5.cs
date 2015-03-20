
using ctci.Contracts;
using System;

namespace Chapter07
{
    public class Q07_5 : IQuestion
    {
        public static int RandomInt(int number)
        {
            var random = new Random();

            return (int)(random.Next(2) * number);
        }

        public static void PrintLine(Line75 line)
        {
		    Console.WriteLine(line.Start.X + "\t" + line.Start.Y);
            Console.WriteLine(line.End.X + "\t" + line.End.Y);
	    }

        public static void PrintSquare(Square square)
        {
            Console.WriteLine(square.Left + "\t" + square.Top + "\t" + square.Size);
	    }

        public static bool IsApproxEqual(double d1, double d2)
        {
            const double epsilon = .001;
            
            if (Math.Abs(d1 - d2) < epsilon)
            {
                return true;
            }

            return false;
        }

        public static bool IsApproxEqual(Point p1, Point p2)
        {
            return IsApproxEqual(p1.X, p2.X) && IsApproxEqual(p1.Y, p2.Y);
        }

        public static bool DoTest(Square square1, Square square2, Point start, Point end)
        {
		    var line = square1.cut(square2);
		    var r = (IsApproxEqual(line.Start, start) && IsApproxEqual(line.End, end)) || (IsApproxEqual(line.Start, end) && IsApproxEqual(line.End, start));

		    if (!r) 
            {
			    PrintSquare(square1);
			    PrintSquare(square2);
			    PrintLine(line);
                Console.WriteLine(start.ToString());
			    Console.WriteLine(end.ToString());
			    Console.WriteLine();
                //return r;
		    }

		    return r;
	    }

        public static bool DoTestFull(Square s1, Square s2, Point start, Point end)
        {
            return DoTest(s1, s2, start, end) && DoTest(s2, s1, start, end);
        }

        public static void DoTests()
        {
            // Equal
            DoTestFull(new Square(1, 1, 5), new Square(1, 1, 5), new Point(3.5, 1), new Point(3.5, 6));

            // Concentric
            DoTestFull(new Square(1, 1, 5), new Square(2, 2, 3), new Point(3.5, 1), new Point(3.5, 6));

            // Partially overlapping -- side by side
            DoTestFull(new Square(10, 10, 10), new Square(8, 10, 10), new Point(8, 15), new Point(20, 15));

            // Partially overlapping -- corners
            DoTestFull(new Square(10, 10, 10), new Square(8, 7, 7), new Point(8.777777, 7), new Point(18.8888888, 20));

            // Partially overlapping -- on top of each other
            DoTestFull(new Square(10, 10, 10), new Square(8, 7, 15), new Point(8, 22), new Point(23, 7));

            // Not overlapping -- side by side
            DoTestFull(new Square(10, 10, 10), new Square(19, 25, 4), new Point(12.5, 10), new Point(22, 29));

            // Not overlapping -- on top of each other
            DoTestFull(new Square(10, 10, 10), new Square(4, 4, 3), new Point(4, 4), new Point(20, 20));

            // Contained
            DoTestFull(new Square(10, 10, 10), new Square(12, 14, 3), new Point(10, 16.66666), new Point(20, 13.333));
        }

        public void Run()
        {
            /* For an easy way to test these, open up Square Cut Tester.xlsx
             * in the Chapter 7, Problem 5 folder. Copy and paste the exact 
             * output from below into the file (including all tabs).
             */
            DoTests();
        }
    }

    public class Point
    {
	    public double X;
	    public double Y;

	    public Point(double x, double y) 
        {
		    X = x;
		    Y = y;
	    }
	
	    public bool IsEqual(Point p) 
        {
		    return (p.X == X && p.Y == Y);
	    }
	
	    public override String ToString()
        {
		    return "(" + X + ", " + Y + ")";
	    }
    }


    public class Line75
    {
        public Point Start;
        public Point End;

        public Line75(Point start, Point end)
        {
            Start = start;
            End = end;
        }

        public override String ToString()
        {
            return "Line from " + Start + " to " + End;
        }
    }

    public class Square
    {
        public double Left;
        public double Top;
        public double Bottom;
        public double Right;
        public double Size;

        public Square(double left, double top, double size)
        {
            Left = left;
            Top = top;
            Bottom = top + size;
            Right = left + size;
            Size = size;
        }

        public Point Middle()
        {
            return new Point((Left + Right) / 2.0, (Top + Bottom) / 2.0);
        }

        public bool Contains(Square other)
        {
            if (Left <= other.Left && Right >= other.Right && Top <= other.Top && Bottom >= other.Bottom)
            {
                return true;
            }

            return false;
        }

        /* Return the point where the line segment connecting mid1 and
         * mid2 intercepts the edge of square 1. That is, draw a line 
         * from mid2 to mid1, and continue it out until the edge of
         * the square. */
        public Point Extend(Point mid1, Point mid2, double size)
        {
            /* Find what direction the line mid2 -> mid1 goes */
            double xdir = mid1.X < mid2.X ? -1 : 1;
            double ydir = mid1.Y < mid2.Y ? -1 : 1;

            /* If mid1 and mid2 have the same x value, then the slope
             * calculation will throw a divide by 0 exception. So, we
             * compute this specially. */
            if (mid1.X == mid2.X)
            {
                return new Point(mid1.X, mid1.Y + ydir * size / 2.0);
            }

            var slope = (mid1.Y - mid2.Y) / (mid1.X - mid2.X);
            double x1 = 0;
            double y1 = 0;

            /* Calculate slope using the equation (y1 - y2) / (x1 - x2).
             * Note: if the slope is “steep” (>1) then the end of the
             * line segment will hit size / 2 units away from the middle
             * on the y axis. If the slope is “shallow” (<1) the end of
             * the line segment will hit size / 2 units away from the
             * middle on the x axis. */
            if (Math.Abs(slope) == 1)
            {
                x1 = mid1.X + xdir * size / 2.0;
                y1 = mid1.Y + ydir * size / 2.0;
            }
            else if (Math.Abs(slope) < 1)
            {
                x1 = mid1.X + xdir * size / 2.0;
                y1 = slope * (x1 - mid1.X) + mid1.Y;
            }
            else
            {
                y1 = mid1.Y + ydir * size / 2.0;
                x1 = (y1 - mid1.Y) / slope + mid1.X;
            }

            return new Point(x1, y1);
        }

        public Line75 cut(Square other)
        {
            /* Calculate where a line between each middle would collide with the edges of the squares */
            var p1 = Extend(Middle(), other.Middle(), Size);
            var p2 = Extend(Middle(), other.Middle(), -1 * Size);
            var p3 = Extend(other.Middle(), Middle(), other.Size);
            var p4 = Extend(other.Middle(), Middle(), -1 * other.Size);

            /* Of above points, find start and end of lines. Start is farthest left (with top most as a tie breaker)
             * and end is farthest right (with bottom most as a tie breaker */
            var start = p1;
            var end = p1;
            Point[] points = { p2, p3, p4 };

            for (var i = 0; i < points.Length; i++)
            {
                if (points[i].X < start.X || (points[i].X == start.X && points[i].Y < start.Y))
                {
                    start = points[i];
                }
                else if (points[i].X > end.X || (points[i].X == end.X && points[i].Y > end.Y))
                {
                    end = points[i];
                }
            }

            return new Line75(start, end);
        }

        public override String ToString()
        {
            return "(" + Left + ", " + Top + ")|(" + Right + "," + Bottom + ")";
        }
    }
}