/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * Date: 12.29.2015
 * 
 * Cracking the coding interview - Question 1.4
 * 
 * Replace whitespaces with "%20"
 */

import java.util.*;
import java.io.*;

public class Whitespaces 
{
	public void editWhitespaces()
	{
		System.out.println("Enter string:");
		Scanner scan = new Scanner(System.in);
		String sentence = scan.nextLine();
		String[] strArr = sentence.split(" ");
		String finalString = "";
		
		for(int i=0;i<strArr.length;i++)
		{
			if(i == 0)
			{
				finalString = strArr[i];
			}
			else
			{
				finalString = finalString +"%20"+strArr[i];
			}
		}
		System.out.println(finalString);
	}
	public static void main(String[] args) 
	{
		Whitespaces obj = new Whitespaces();
		obj.editWhitespaces();
	}
}
