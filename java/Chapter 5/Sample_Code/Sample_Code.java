package Sample_Code;

import CtCILibrary.AssortedMethods;

public class Sample_Code {

	public static boolean getBit(int num, int i) {
		return ((num & (1 << i)) != 0);
	}
	
	public static int setBit(int num, int i) {
		return num | (1 << i);
	}
	
	public static int clearBit(int num, int i) {
		int mask = ~(1 << i);
		return num & mask;
	}
	
	public static int updateBit(int num, int i, int value) {
		int mask = ~(1 << i);
		return (num & mask) | (value << i);
	}
	
	public static int clearBitsMSBthroughI(int num, int i) {
		int mask = (1 << i) - 1;
		return num & mask;
	}
	
	public static int clearBitsIthrough0(int num, int i) {
		int mask = ~(-1 >>> (31 - i));
		return (num & mask);
	}
	
	public static void main(String[] args) {
		
		int number = 59;
		System.out.println("Testing with number: " + number);
		
		// Get Bit
		System.out.println("Get Bit");
		System.out.println(AssortedMethods.toFullBinaryString(number));
		for (int i = 31; i >= 0; i--) {
			int res = getBit(number, i) ? 1 : 0;
			System.out.print(res);
		}
		
		// Update Bit
		System.out.println("\n\nUpdate Bit");		
		int num1 = 1578; // arbitrary number
		for (int i = 31; i >= 0; i--) {
			int res = getBit(number, i) ? 1 : 0;
			num1 = updateBit(num1, i, res);
		}	
		System.out.println(num1);
		
		// Set and Clear Bit
		System.out.println("\nSet and Clear Bit");		
		int num2 = 1578; // arbitrary number
		for (int i = 31; i >= 0; i--) {
			if (getBit(number, i)) {
				num2 = setBit(num2, i);
			} else {
				num2 = clearBit(num2, i);
			}
		}	
		System.out.println(num2);
	
		// Clear Bits MSB through i
		number = 13242352;
		System.out.println("\nClear bits MSB through 4");	
		System.out.println(AssortedMethods.toFullBinaryString(number));
		int num3 = clearBitsMSBthroughI(number, 4);
		System.out.println(AssortedMethods.toFullBinaryString(num3));
		
		// Clear Bits i through 0
		System.out.println("\nClear bits 6 through 0");	
		number = -1;
		System.out.println(AssortedMethods.toFullBinaryString(number));
		int num4 = clearBitsIthrough0(number, 2);
		System.out.println(AssortedMethods.toFullBinaryString(num4));
	}

}
