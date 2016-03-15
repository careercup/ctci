package Question1_2;

class Question {

	public static String reverse(String str) {
		int length = str.length();
		StringBuilder output = new StringBuilder(length);
		for(int i = length-1; i >= 0; --i)
			output.append(str.charAt(i));
		return output.toString();
	}

	public static String reverse2(String str) {
		StringBuilder output = new StringBuilder(str);
		return output.reverse().toString();
	}
	
	public static void main(String[] args) {
		String[] words = {"abcde", "cat"};
		for (String word : words) {
			System.out.println("Reversing the string: "+word);
			System.out.println("reverse of input string is: " + reverse2(word));
		}
	}

}