package Question7_5;

public class Point {
	public double x;
	public double y;
	public Point(double x, double y) {
		this.x = x;
		this.y = y;
	}
	
	public boolean isEqual(Point p) {
		return (p.x == x && p.y == y);
	}
	
	public String toString() {
		return "(" + x + ", " + y + ")";
	}
}
