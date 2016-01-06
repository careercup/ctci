/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * 
 * Cracking the coding interview - Question 1.8
 * 
 * checking if a string is part of actual string
 */
public class Substring 
{
	public void isSubstring(String str1, String str2)
	{
		String modifiedStr = "";
		modifiedStr = modifiedStr + str1 + str1;
		if(modifiedStr.contains(str2))
		{
			System.out.println("rotated string is contained in the original string");
		}
		else
		{
			System.out.println("rotated string is not contained in the original string");
		}
	}
	public static void main(String[] args) 
	{
		Substring obj = new Substring();
		String originalStr = "waterbottle";
		String rotatedStr = "erbottlewat";
		obj.isSubstring(originalStr, rotatedStr);
	}
}
