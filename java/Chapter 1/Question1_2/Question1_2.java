/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package question1_2;

/**
 *
 * @author albertovega
 */
public class Question1_2 {
    
    public static String sort(String s) {
        char[] content = s.toCharArray();
        java.util.Arrays.sort(content);
        return new String(content);
    }
    
    public static boolean permutation(String s, String t) {
        if (s.length() != t.length()) {
            return false;
        }
        return sort(s).equals(sort(t));
    }
    public static boolean permutation2(String s, String t) {
        if (s.length() != t.length()) {
            return false;
        }
        int[] letters = new int[128]; // Asumption
        
        char[] s_array = s.toCharArray();
        for (char c : s_array) { // count  number of each char in s.
         letters[c]++;
        }
        
        for (int i = 0; i < t.length(); i++) {
            int c = (int) t.charAt(i);
            letters[c]--;
            if(letters[c] < 0) {
                return false;
            }
        }
        return true;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String string1 = "dog";
        String string2 = "god";
       
       boolean result; 
       result = permutation(string1, string2);
       System.out.println(result);
       boolean result2;
       result2 = permutation2(string1, string2);
       System.out.println(result2);
       
       
    }   
}
