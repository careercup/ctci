package Question9_2;

import java.util.ArrayList;
import java.util.Hashtable;
import java.awt.*;

import CtCILibrary.AssortedMethods;

public class QuestionR {
	public static int[][] maze = new int[10][10];
	
	public static boolean isFree(int x, int y) {
		if (maze[x][y] == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	public static boolean getPath(int x, int y, ArrayList<Point> path) {
		Point p = new Point(x, y);
		if (x == 0 && y == 0) {
			return true; // found a path
		}
		boolean success = false;
		if (x >= 1 && isFree(x - 1, y)) { // Try left
			success = getPath(x - 1, y, path); // Free!  Go left
		}
		if (!success && y >= 1 && isFree(x, y - 1)) { // Try up
			success = getPath(x, y - 1, path); // Free!  Go up
		}
		if (success) {
			path.add(p); // Right way! Add to path.
		}
		return success;
	}
	
	public static void main(String[] args) {
		maze = AssortedMethods.randomMatrix(10, 10, 0, 4);
		
		AssortedMethods.printMatrix(maze);
		
		ArrayList<Point> path = new ArrayList<Point>();
		boolean success = getPath(9, 9, path);
		if (success) {
			String s = AssortedMethods.listOfPointsToString(path);
			System.out.println(s);
		} else {
			System.out.println("No path found.");
		}
	}

}
