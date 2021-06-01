/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 *  
 * Cracking the coding interview - Question 1.3
 * 
 * check for string permutation
 */

import java.util.*;
import java.io.*;

public class StringPermutation 
{
	
	public void CheckPermutation()
	{
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter string1:");
		String str1 = scan.next();
		System.out.println("Enter string2");
		String str2 = scan.next();
		
		char[] str1CharArr = str1.toCharArray();
		char[] str2CharArr = str2.toCharArray();
		
		//sorting str1CharArr
		int lengthStr1 = str1CharArr.length;
		char temp;
		for(int i=0;i<lengthStr1;i++)
		{
			for(int j=i+1;j<lengthStr1;j++)
			{
				if(str1CharArr[i] > str1CharArr[j])
				{
					temp = str1CharArr[i];
					str1CharArr[i] = str1CharArr[j];
					str1CharArr[j] = temp;
				}
			}
		}
		
		//sorting str2CharArr
		int lengthStr2 = str2CharArr.length;
		for(int i=0;i<lengthStr2;i++)
		{
			for(int j=i+1;j<lengthStr2;j++)
			{
				if(str2CharArr[i] > str2CharArr[j])
				{
					temp = str2CharArr[i];
					str2CharArr[i] = str2CharArr[j];
					str2CharArr[j] = temp;
				}
			}
		}
		
		//comparing
		int count = 0;
		for(int i=0;i<str1CharArr.length;i++)
		{
			if(str1CharArr[i] == str2CharArr[i])
			{
				continue;
			}
			else
			{
				count++;
				System.out.println("The strings are not permutation of each other");
				break;
			}
		}
		if(count == 0)
		{
			System.out.println("Strings are permutation of each other");
		}
	}
	public static void main(String[] args) 
	{
		StringPermutation obj = new StringPermutation();
		obj.CheckPermutation();
	}
}
