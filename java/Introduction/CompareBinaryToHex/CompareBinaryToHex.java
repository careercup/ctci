package CompareBinaryToHex;

public class CompareBinaryToHex {

	public static int digitToValue(char c) {
		if (c >= '0' && c <= '9') {
			return c - '0';
		} else if (c >= 'A' && c <= 'F') {
			return 10 + c - 'A';
		} else if (c >= 'a' && c <= 'f') {
			return 10 + c - 'a';
		}
		return -1;
	}
	
	public static int convertToBase(String number, int base) {
		if (base < 2 || (base > 10 && base != 16)) return -1;
		int value = 0;
		for (int i = 0, n = number.length(); i < n; i++) {
			int digit = digitToValue(number.charAt(i));
			if (digit < 0 || digit >= base) {
				return -1;
			}
			value = value * base + digit;
		}
		return value;
	}
	
	public static boolean compareBinToHex(String binary, String hex) {
		int n1 = convertToBase(binary, 2);
		int n2 = convertToBase(hex, 16);
		if (n1 < 0 || n2 < 0) {
			return false;
		} else {
			return n1 == n2;
		}
	}
	
	public static void main(String[] args) {
		System.out.println(compareBinToHex("111001011", "1CB"));
	}

}
