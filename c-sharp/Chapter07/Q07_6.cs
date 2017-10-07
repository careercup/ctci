
using System;
using System.Collections.Generic;
using ctci.Contracts;

namespace Chapter07
{
    public class Q07_6 : IQuestion
    {
        class GraphPoint
        {
            public double X { get; set; }
            public double Y { get; set; }

            public GraphPoint(double x1, double y1)
            {
                X = x1;
                Y = y1;
            }

            public override string ToString()
            {
                return "(" + X + ", " + Y + ")";
            }
        }

        class Line
        {
            public const double Epsilon = .0001;
            public readonly double Slope;
            private readonly double _intercept;
	        private readonly bool _infiniteSlope;
	
	        public Line(GraphPoint p, GraphPoint q)
	        {
	            _infiniteSlope = false;

		        if (Math.Abs(p.X - q.X) > Epsilon) 
                {   // if X’s are different
			        Slope = (p.Y - q.Y) / (p.X - q.X); // compute slope
			        _intercept = p.Y - Slope * p.X; // Y intercept from Y=mx+b
		        } 
                else 
                {
			        _infiniteSlope = true;
			        _intercept = p.X; // X-intercept, since slope is infinite
		        }
	        }
	
	        public bool IsEquivalent(double a, double b)
            {
		        return (Math.Abs(a - b) < Epsilon);
	        }
	
	        public void Print() 
            {
		        Console.WriteLine("Y = " + Slope + "X + " + _intercept);
	        }

            public static double FloorToNearestEpsilon(double d)
            {
		        var r = (int) (d / Epsilon);
		        return r * Epsilon;
	        }
    
	        public bool IsEquivalent(Object o) 
            {  
		        Line l = (Line) o;

    	        if (IsEquivalent(l.Slope, Slope) && IsEquivalent(l._intercept, _intercept) && (_infiniteSlope == l._infiniteSlope)) 
                {
    		        return true;
    	        }

                return false;
            }      
        }

	    // Count lines within an array of lines which are "equivalent" (slope and Y-intercept are within an epsilon value) to a given line
	    int CountEquivalentLines(List<Line> lines, Line line)
        {
		    if (lines == null) 
            {
			    return 0;
		    }
		
		    int count = 0;

		    foreach (var parallelLine in lines) 
            {
			    if (parallelLine.IsEquivalent(line)) 
                {
				    count++;
			    }
		    }

		    return count;		
	    }
	
        // Check hashmap for lines that are equivalent. Note that we need to check one epsilon above and below the actual slope
        // since we're defining two lines as equivalent if they're within an epsilon of each other.
	    int CountEquivalentLines(Dictionary<Double, List<Line>> linesBySlope, Line line)
        {
		    var key = Line.FloorToNearestEpsilon(line.Slope);
            var count = CountEquivalentLines(linesBySlope[key], line);

		    count += linesBySlope.ContainsKey(key - Line.Epsilon)
                ? CountEquivalentLines(linesBySlope[key - Line.Epsilon], line)
	            : 0;
	        count += linesBySlope.ContainsKey(key + Line.Epsilon)
	            ? CountEquivalentLines(linesBySlope[key + Line.Epsilon], line)
	            : 0;

		    return count;
	    }	
	
	    // Insert line into hashmap
        void InsertLine(Dictionary<Double, List<Line>> linesBySlope, Line line)
        {
            List<Line> lines;
		    var key = Line.FloorToNearestEpsilon(line.Slope);

		    if (!linesBySlope.ContainsKey(key))
            {
			    lines = new List<Line>();
			    linesBySlope.Add(key, lines);
		    }
            else 
            {
			    lines = linesBySlope[key];
		    }

		    lines.Add(line);
	    }
	
	    Line FindBestLine(GraphPoint[] points) 
        {
		    Line bestLine = null;
		    var bestCount = 0;
            var linesBySlope = new Dictionary<Double, List<Line>>();
		
		    for (var i = 0; i < points.Length; i++) 
            {
                for (var j = i + 1; j < points.Length; j++)
                {
                    var line = new Line(points[i], points[j]);
				    InsertLine(linesBySlope, line);
				
				    /* count lines that are equivalent to current line */
                    var count = CountEquivalentLines(linesBySlope, line);
				
				    /* if better than current line, replace it */
				    if (count > bestCount)
                    {
					    bestLine = line;
					    bestCount = count;
				    }
			    }
		    } 
		
		    return bestLine;
	    }	
	
	    GraphPoint[] CreatePoints() 
        {
            const int nPoints = 10;
		    Console.WriteLine("Points on Graph\n***************");

            var points = new GraphPoint[nPoints - 1];

            for (var i = 0; i < nPoints / 2; i++) 
            {
                var point = new GraphPoint(i, 2.3 * i + 20.0);
			    points[i] = point;
			    Console.WriteLine(point.ToString());
		    }

            for (var i = 0; i < nPoints / 2 - 1; i++) 
            {
                var point = new GraphPoint(i, 3.0 * i + 1.0);
			    points[nPoints / 2 + i] = point;
			    Console.WriteLine(point.ToString());
		    }
		    Console.WriteLine("****************\n");
		    
            return points;
	    }

        public void Run()
        {
            var points = CreatePoints();
            var line = FindBestLine(points);

            line.Print();            
        }
    }
}