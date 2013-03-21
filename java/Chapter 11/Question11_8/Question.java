package Question11_8;

import java.util.ArrayList;
import java.util.Collections;

import CtCILibrary.AssortedMethods;

public class Question {
	private static RankNode root = null;
	
	public static void track(int number) {
		if (root == null) {
			root = new RankNode(number);
		} else {
			root.insert(number);
		}
	}
	
	public static int getRankOfNumber(int number) {
		return root.getRank(number);
	}
	
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(5);
		for (int i = 0; i < 100; i++) {
			int x = AssortedMethods.randomIntInRange(0, 100);
			track(x);	
		}
		
		for (int i = 0; i < 100; i++) {
			int rank1 = root.getRank(i);
			System.out.println(i + " has rank " + rank1);
		}
	}

}
