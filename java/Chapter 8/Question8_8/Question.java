package Question8_8;

import java.io.*;
import java.util.*;
import java.awt.Point;

public class Question {
	
	public static void main(String[] args) {
		Game game = Game.getInstance();
		game.getBoard().initialize();
		game.getBoard().printBoard();
		Automator automator = Automator.getInstance();
		while (!automator.isOver() && automator.playRandom()) {
		}
		automator.printScores();
	}
}
