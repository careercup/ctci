/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * 
 * Cracking the coding interview - Question 1.5
 * 
 * String compression
 */
import java.io.*;
import java.util.*;

public class StringCompression 
{
	public void Compress()
	{
		Scanner scan = new Scanner(System.in);
		System.out.println("enter the string");
		String originalStr = scan.nextLine();
		//System.out.println(originalStr);
		//System.out.println(originalStr.length());
		int count = 0;
		char prevChar = '\0';	
		char[] charArr = originalStr.toCharArray();
		StringBuffer newString = new StringBuffer();
		
		for(int i=0;i<charArr.length;i++)
		{
			if(i == 0)
			{
				prevChar =  charArr[i];
				count = 1;
			}
			else
			{
				if(charArr[i] == prevChar)
				{
					count++;
				}
				if(charArr[i] != prevChar)
				{
					newString.append(prevChar);
					newString.append(count);
					prevChar = charArr[i];
					count = 1;
				}
				if(i == charArr.length-1)
				{
					newString.append(prevChar);
					newString.append(count);
				}
			}
		}
		if(originalStr.length() < newString.length())
		{
			System.out.println(originalStr);
		}
		else
		{
			System.out.println(newString);
		}
	}
	public static void main(String[] args) 
	{
		StringCompression obj = new StringCompression();
		obj.Compress();
	}
}
