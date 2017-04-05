package Question1_4;

import CtCILibrary.AssortedMethods;

public class Question {
	// Assume string has sufficient free space at the end
	public static void replaceSpaces(char[] str, int length) {
		int spaceCount = 0, index, i = 0;
		for (i = 0; i < length; i++) {
			if (str[i] == ' ') {
				spaceCount++;
			}
		}
		index = length + spaceCount * 2;
		str[index] = '\0';
		for (i = length - 1; i >= 0; i--) {
			if (str[i] == ' ') {
				str[index - 1] = '0';
				str[index - 2] = '2';
				str[index - 3] = '%';
				index = index - 3;
			} else {
				str[index - 1] = str[i];
				index--;
			}
		}
	}
	
	public static void main(String[] args) {
		String str = "abc d e f";
		char[] arr = new char[str.length() + 3 * 2 + 1];
		for (int i = 0; i < str.length(); i++) {
			arr[i] = str.charAt(i);
		}
		replaceSpaces(arr, str.length());	
		System.out.println("\"" + AssortedMethods.charArrayToString(arr) + "\"");
	}
}

//SOLUTION #2: USE TWO POINTERS no need to pass chr array

public class replaceSpace {

    String replace(String s1, int len){
        char[] letters = new char[s1.length()];
        int j =0;
        for(int i=0; i< len; i++){
            char c = s1.charAt(i);
            if(c == ' '){
                letters[j] = '%';
                letters[j+1] = '2';
                letters[j+2] = '0';
                j = j + 3;
            }
            else {
                letters[j] = c;
                j++;
            }
        }

         String new_string =  new String(letters);

         return new_string;

    }

}
