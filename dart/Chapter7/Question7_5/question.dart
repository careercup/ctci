import 'dart:math';

class Point {
  double x;
  double y;
  Point(this.x, this.y);
  bool isEqual(Point p) => p.x == x && p.y == y;
  String toString() => "($x, $y)";
}

class Line {
  Point start;
  Point end;
  Line(this.start, this.end);

  String toString() => "Line from ${start.toString()} to ${end.toString()}";
}

class Square {
  double left;
  double top;
  double bottom;
  double right;
  double size;
  Square(this.left, this.top, this.size) {
    bottom = top + size;
    right = left + size;
  }

  Point middle() => new Point((left + right)/2, (top + bottom)/2);

  bool contains(Square other) {
    if (left <= other.left && right >= other.right && top <= other.top && bottom >= other.bottom) {
      return true;
    }

    return false;
  }

  /**
   * Return the point where the line segment connecting mid1 and
   * mid2 intercepts the edge of square 1. That is, draw a line
   * from mid2 to mid1, and continue it out until the edge of
   * the square.
   */
  Point extend(Point mid1, Point mid2, double size) {
    /* Find what direction the line mid2 -> mid1 goes */
    double xdir = mid1.x < mid2.x ? -1.0 : 1.0;
    double ydir = mid1.y < mid2.y ? -1.0 : 1.0;

    /* If mid1 and mid2 have the same x value, then the slope
     * calculation will throw a divide by 0 exception. So, we
     * compute this specially.
     */
    if (mid1.x == mid2.x) {
      return new Point(mid1.x, mid1.y + ydir * size / 2.0);
    }

    double slope = (mid1.y - mid2.y) / (mid1.x - mid2.x);
    double x1 = 0.0;
    double y1 = 0.0;

    /* Calculate slope using the equation (y1 - y2) / (x1 - x2).
     * Note: if the slope is "steep" (>1) then the end of the line
     * segment will hit size / 2 units away from the middle on
     * the y axis. If the slope is "shallow" (<1) the end of the
     * line segment will hit size / 2 units away from the middle
     * on the x axis.
     */
    if (slope.abs() == 1.0) {
      x1 = mid1.x + xdir * size / 2.0;
      y1 = mid1.y + ydir * size / 2.0;
    } else if (slope.abs() < 1.0) {
      x1 = mid1.x + xdir * size / 2.0;
      y1 = slope * (x1 - mid1.x) + mid1.y;
    } else {
      y1 = mid1.y + ydir * size / 2.0;
      x1 = (y1 - mid1.y) / slope + mid1.x;
    }

    return new Point(x1, y1);
  }

  Line cut(Square other) {
    /* Calculate where a line between each middle would collide with the edges
     * of the squares
     */
    Point p1 = extend(middle(), other.middle(), size);
    Point p2 = extend(middle(), other.middle(), -1 * size);
    Point p3 = extend(other.middle(), middle(), other.size);
    Point p4 = extend(other.middle(), middle(), -1 * other.size);

    /* Of above points, find start and end of lines. Start is farthest left
     * (with top most as a tie breaker) and end is farthest right
     * (with bottom most as a tie breaker
     */
    Point start = p1;
    Point end = p1;
    List<Point> points = [p2, p3, p4];
    for (int i = 0; i < points.length; i++) {
      if (points[i].x < start.x || (points[i].x == start.x && points[i].y < start.y)) {
        start = points[i];
      } else if (points[i].x > end.x || (points[i].x == end.x && points[i].y > end.y)) {
        end = points[i];
      }
    }

    return new Line(start, end);
  }

  String toString() => "($left, $top)|($right, $bottom)";
}

int randomInt(int n) => (new Random().nextDouble() * n).toInt();

void printLine(Line l) {
  print("${l.start.x}\t${l.start.y}");
  print("${l.end.x}\t${l.end.y}");
}

void printSquare(Square s) => print("${s.left}\t${s.top}\t${s.size}");

bool isApproxEqualAsDouble(double d1, double d2) {
  double epsilon = 0.001;
  if ((d1 - d2).abs() < epsilon) {
    return true;
  }

  return false;
}

bool isApproxEqualAsPoint(Point p1, Point p2) => isApproxEqualAsDouble(p1.x, p2.x) && isApproxEqualAsDouble(p1.y, p2.y);

bool doTest(Square s1, Square s2, Point start, Point end) {
  Line line = s1.cut(s2);
  bool r = (isApproxEqualAsPoint(line.start, start) && isApproxEqualAsPoint(line.end, end) || (isApproxEqualAsPoint(line.start, end) && isApproxEqualAsPoint(line.end, start)));
  if (!r) {
    printSquare(s1);
    printSquare(s2);
    printLine(line);
    print(start.toString());
    print(end.toString());
    print("");
    return r;
  }

  return r;
}

bool doTestFull(Square s1, Square s2, Point start, Point end) {
  return doTest(s1, s2, start, end) && doTest(s2, s1, start, end);
}

void doTests() {
  // Equal
  doTestFull(new Square(1.0, 1.0, 5.0), new Square(1.0, 1.0, 5.0), new Point(3.5, 1.0), new Point(3.5, 6.0));

  // Concentric
  doTestFull(new Square(1.0, 1.0, 5.0), new Square(2.0, 2.0, 3.0), new Point(3.5, 1.0), new Point(3.5, 6.0));

  // Partially overlapping -- side by side
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(8.0, 10.0, 10.0), new Point(8.0, 15.0), new Point(20.0, 15.0));

  // Partially overlapping -- corners
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(8.0, 7.0, 7.0), new Point(8.777777, 7.0), new Point(18.8888888, 20.0));

  // Partially overlapping -- on top of each other
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(8.0, 7.0, 15.0), new Point(8.0, 22.0), new Point(23.0, 7.0));

  // Not overlapping -- side by side
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(19.0, 25.0, 4.0), new Point(12.5, 10.0), new Point(22.0, 29.0));

  // Not overlapping -- on top of each other
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(4.0, 4.0, 3.0), new Point(4.0, 4.0), new Point(20.0, 20.0));

  // Contained
  doTestFull(new Square(10.0, 10.0, 10.0), new Square(12.0, 14.0, 3.0), new Point(10.0, 16.66666), new Point(20.0, 13.333));

}

void main() {
  /* For an easy way to test these, open up Square Cut Tester.xlsx
   * in the Chapter 7, Problem 5 folder. Copy and paste the exact
   * output from below into the file (including all tabs).
   */
  doTests();
}