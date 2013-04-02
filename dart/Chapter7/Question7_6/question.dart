
class GraphPoint {
  double x;
  double y;
  GraphPoint(this.x, this.y);
  String toString() => "($x, $y)";
}

class Line {
  static double epsilon = 0.0001;
  double slope = 0.0;
  double intercept = 0.0;
  bool infinite_slope = false;

  Line(GraphPoint p, GraphPoint q) {
    if ((p.x - q.x).abs() > epsilon) { // if x's are different
      slope = (p.y - q.y) / (p.x - q.x); // compute slope
      intercept = p.y - slope * p.x; // y intercept from y = mx + b
    } else {
      infinite_slope = true;
      intercept = p.x; // x-intercept, since slope is infinite
    }
  }

  bool isEquivalent(double a, double b) {
    return (a - b).abs() < epsilon;
  }

  void Print() {
    print("y = ${slope}x + $intercept");
  }

  static double floorToNearestEpsilon(double d) {
    int r = (d / epsilon).toInt();
    return r * epsilon;
  }

  bool isEquivalentSelf(l) {
    if (isEquivalent(l.slope, slope) && isEquivalent(l.intercept, intercept) && (infinite_slope == l.infinite_slope)) {
      return true;
    }

    return false;
  }
}

/* Count lines within an array of lines which are "equivalent" (slope and y-intercept are within an epsilon value) to a given line */
int countEquivalentLinesAsList(List<Line> lines, Line line) {
  if (lines == null) {
    return 0;
  }

  int count = 0;
  for (Line parallelLine in lines) {
    if (parallelLine.isEquivalentSelf(line)) {
      count++;
    }
  }

  return count;
}

/*
 * Check hashmap for lines that are equivalent. Note that we need to check one epsilon
 * above and below the actual slope since we're defining two lines as equivalent if
 * they're within an epsilon of each other.
 */
int countEquivalentLines(Map<double, List<Line>> linesBySlope, Line line) {
  double key = Line.floorToNearestEpsilon(line.slope);
  int count = countEquivalentLinesAsList(linesBySlope[key], line);
  count += countEquivalentLinesAsList(linesBySlope[key - Line.epsilon], line);
  count += countEquivalentLinesAsList(linesBySlope[key - Line.epsilon], line);
  return count;
}

/* insert line into hashmap */
void insertLine(Map<double, List<Line>> linesBySlope, Line line) {
  List<Line> lines = null;
  double key = Line.floorToNearestEpsilon(line.slope);
  if (!linesBySlope.containsKey(key)) {
    lines = new List<Line>();
    linesBySlope[key] = lines;
  } else {
    lines = linesBySlope[key];
  }

  lines.add(line);
}

Line findBestLine(List<GraphPoint> points) {
  Line bestLine = null;
  int bestCount = 0;
  Map<double, List<Line>> linesBySlope = new Map<double, List<Line>>();

  for (int i = 0; i < points.length; i++) {
    for (int j = i + 1; j < points.length; j++) {
      Line line = new Line(points[i], points[j]);
      insertLine(linesBySlope, line);

      /* count lines that are equivalent to current line */
      int count = countEquivalentLines(linesBySlope, line);

      /* if better than current line, replace it */
      if (count > bestCount) {
        bestLine = line;
        bestCount = count;
      }
    }
  }

  return bestLine;
}

List<GraphPoint> createPoints() {
  int n_points = 100;
  print("Points on Graph\n**************");
  List<GraphPoint> points = new List<GraphPoint>(n_points - 1);
  for (int i = 0; i < n_points ~/ 2; i++) {
    GraphPoint p = new GraphPoint(i.toDouble(), 2.3 * i + 20.0);
    points[i] = p;
    print(p.toString());
  }

  for (int i = 0; i < n_points ~/ 2 - 1; i++) {
    GraphPoint p = new GraphPoint(i.toDouble(), 3.0 * i + 1.0);
    points[n_points ~/ 2 + i] = p;
    print(p.toString());
  }

  print("**************");
  return points;
}


void main() {
  List<GraphPoint> points = createPoints();
  Line line = findBestLine(points);
  line.Print();
}