/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * 
 * Cracking the coding interview - Question 1.7
 * 
 * if an element is 0 in a matrix, replace entire row and column with 0, assuming there is only one 0 
 * in the matrix at any given instance
 */

import java.util.*;

public class Zero 
{
	public void replaceZeros()
	{
		Scanner scan = new Scanner(System.in);
		System.out.println("enter the value of N");
		int N = scan.nextInt();
		int[][] matrix = new int[N][N];
		int row = 0,column = 0;
		//ask the user for matrix elements
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.println("enter the element ["+i+"]["+j+"]");
				matrix[i][j] = scan.nextInt();
			}
		}
		//displaying values
		System.out.println("original matrix:");
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.print(matrix[i][j]+" ");
			}
			System.out.println();
		}
		//browse for a zero 
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				if(matrix[i][j] == 0)
				{
					row = i;
					column = j;
				}
			}
		}
		//replace the row and column with zeros
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				matrix[row][i] = 0;
				matrix[j][column] = 0;
			}
		}
		//displaying values
		System.out.println("changed matrix:");
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.print(matrix[i][j]+" ");
			}
			System.out.println();
		}
	}
	public static void main(String[] args) 
	{
		Zero obj = new Zero();
		obj.replaceZeros();
	}
}














