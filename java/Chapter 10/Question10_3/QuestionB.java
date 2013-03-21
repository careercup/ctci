package Question10_3;

import java.io.*;
import java.util.*;

public class QuestionB {
	public static int bitsize = 1048576; // 2^20 bits (2^17 bytes)
	public static int blockNum = 4096; // 2^12
	public static byte[] bitfield = new byte[bitsize/8];
	public static int[] blocks = new int[blockNum];
		
	public static void findOpenNumber() throws FileNotFoundException {
		int starting = -1;
		Scanner in = new Scanner (new FileReader ("Chapter 10/Question10_3/input_file_q10_3.txt"));
		while (in.hasNextInt()) {
		    int n = in.nextInt();
		    blocks[n / (bitfield.length * 8)]++;
		}
		
		for (int i = 0; i < blocks.length; i++) {
			if (blocks[i] < bitfield.length * 8){
				/* if value < 2^20, then at least 1 number is missing in
				 * that section. */
				starting = i * bitfield.length * 8;
				break;
			}
		}

		in = new Scanner(new FileReader("Chapter 10/Question10_3/input_file_q10_3.txt"));
		while (in.hasNextInt()) {
			int n = in.nextInt();
			/* If the number is inside the block that’s missing 
			 * numbers, we record it */
			if (n >= starting && n < starting + bitfield.length * 8) {
				bitfield [(n-starting) / 8] |= 1 << ((n - starting) % 8);
			}
		}

		for (int i = 0 ; i < bitfield.length; i++) {
			for (int j = 0; j < 8; j++) {
				/* Retrieves the individual bits of each byte. When 0 bit 
				 * is found, finds the corresponding value. */
				if ((bitfield[i] & (1 << j)) == 0) {
					System.out.println(i * 8 + j + starting);
					return;
				}
			}
		}		
	}
	
	public static void main(String[] args) throws FileNotFoundException {
		findOpenNumber();
	}

}
