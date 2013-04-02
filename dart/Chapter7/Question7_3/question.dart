import 'dart:math';

class Line {
  static double epsilon = 0.000001;
  double slope;
  double yintercept;
  Line(this.slope, this.yintercept);
  String print_line() => "y = ${slope}x + $yintercept";
  bool intersect(Line line2) => (slope - line2.slope).abs() > epsilon || (yintercept - line2.yintercept).abs() < epsilon;
}

int randomInt(int n) => (new Random().nextDouble() * n).toInt();

void main() {
  for (int i = 0; i < 10; i++) {
    Line line1 = new Line(randomInt(5).toDouble(), randomInt(1).toDouble());
    Line line2 = new Line(randomInt(5).toDouble(), randomInt(2).toDouble());
    print("${line1.print_line()}, ${line2.print_line()}   ${line1.intersect(line2) ? 'YES' : 'NO' }");
  }
}