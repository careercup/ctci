package Question1_4;

public class Question {
	// Assume string has sufficient free space at the end
	public static char[] replaceSpaces(char[] str, int length) {
		int spaceCount = 0;
		int index = 0;

		for (int i = 0; i < length; i++) {
			if (str[i] == ' ') {
				spaceCount++;
			}
		}
		index = length + spaceCount * 2;
		str[index] = '\0';
		for (int i = length - 1; i >= 0; i--) {
			if (str[i] == ' ') {
				str[index - 1] = '0';
				str[index - 2] = '2';
				str[index - 3] = '%';
				index = index - 3;
				
				if (--spaceCount == 0)
					break;
			} else {
				str[index - 1] = str[i];
				index--;
			}
		}
		return str;
	}
	
	public static void main(String[] args) {
		System.out.println(replaceSpaces("foo bar$ ".toCharArray(), 8));
	}
}
