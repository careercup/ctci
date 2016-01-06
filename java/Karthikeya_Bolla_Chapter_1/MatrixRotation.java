/*
 * Version: 1.0
 * Author: Karthikeya Bolla
 * 
 * Cracking the coding interview - Question 1.6
 * 
 * NxN Matrix rotation by 90 degrees and 270 degrees
 */

import java.io.*;
import java.util.*;

public class MatrixRotation 
{
	//rotation by 90 degrees
	public void Rotation()
	{
		System.out.println("Enter the value of N");
		Scanner scan = new Scanner(System.in);
		int N = scan.nextInt();
		int[][] originalMatrix = new int[N][N];
		int[][] rotatedMatrix90 = new int[N][N];
		int[][] rotatedMatrix270 = new int[N][N];
		
		//generating some random matrix
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				originalMatrix[i][j] = 2*i+j;
			}			
		}
		//90 degrees rotated matrix 
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				rotatedMatrix90[j][N - 1 - i] = originalMatrix[i][j];
			}
		}
		//270 degrees rotated matrix (just out of interest) 
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				rotatedMatrix270[N - 1 - j][i] = originalMatrix[i][j];
			}
		}
		//displaying values
		System.out.println("original matrix:");
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.print(originalMatrix[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println("90 degrees rotated matrix");
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.print(rotatedMatrix90[i][j]+" ");
			}
			System.out.println();
		}
		System.out.println("270 degrees rotated matrix");
		for(int i=0;i<N;i++)
		{
			for(int j=0;j<N;j++)
			{
				System.out.print(rotatedMatrix270[i][j]+" ");
			}
			System.out.println();
		}
	}
	public static void main(String[] args) 
	{
		MatrixRotation obj = new MatrixRotation();
		obj.Rotation();
	}
}


