/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * 
 * Cracking the coding interview - Question 1.1
 * 
 * finding if there are duplicate occurrences of characters in string
 */

import java.io.Console;
import java.util.*;

public class DuplicateCharacters1 
{
	//brute force approach i.e. looking through all characters one by one without using another data structure
	public void Method1()
	{
		int count = 0;
		System.out.println("Enter the string");
		Scanner scan = new Scanner(System.in);
		String inputString = scan.next();
		char[] charArr = inputString.toCharArray();
		for(int i=0;i<charArr.length;i++)
		{
			for(int j=i+1;j<charArr.length;j++)
			{
				if(charArr[i] != charArr[j])
				{
					continue;
				}
				else
				{
					count++;
					System.out.println("repetitions exist");
					break;
				}
			}
		}
		if(count == 0)
		{
			System.out.println("repetitions don't exist");
		}
	}
	
	//using HashSet or TreeSet data structure i.e. using another data structure
	public void Method2()
	{
		HashSet<Character> hset = new HashSet<Character>();
		Scanner scan = new Scanner(System.in);
		System.out.println("enter the string");
		String inputString = scan.next();
		char[] charArr = inputString.toCharArray();
		int count = 0;
		for(int i=0;i<charArr.length;i++)
		{
			if(hset.add(charArr[i]))
			{
				continue;
			}
			else
			{
				count++;
				System.out.println("repetitions exist");
				break;
			}
		}
		if(count == 0)
		{
			System.out.println("repetitions don't exist");
		}
	}
	
	public static void main(String[] args) 
	{
		DuplicateCharacters1 obj = new DuplicateCharacters1();
		obj.Method1();
		obj.Method2();
	}
}
