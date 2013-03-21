package Question7_3;


public class Line {
	static double epsilon = 0.000001;
	public double slope;
	public double yintercept;
	
	public Line(double s, double y) {
		slope = s;
		yintercept = y;
	}
	
	public void print() {
		System.out.print("y = " + slope + "x + " + yintercept);
	}
	
	public boolean intersect(Line line2) {
		return Math.abs(slope - line2.slope) > epsilon ||
			   Math.abs(yintercept - line2.yintercept) < epsilon;
	}
};