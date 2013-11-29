//
//  main.m
//  SwapMinMax
//
//  Created by Ryan Moniz on 11/27/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//
//Write code to swap the minimum and maximum element in an integer array.
//Modular style by separating the relatively isolated chunks of code into their
//own methods.

#import <Foundation/Foundation.h>
#import "AssortedMethods.h"

void swapMinMaxBetter(int *array, int arraySize) {
   int minIndex = 0;
   for(int i=1; i<arraySize; i++) {
      if (array[i] < array[minIndex]) {
         minIndex = i;
      }
   }
   
   NSLog(@"found min:%d at array[%d]",array[minIndex], minIndex);
   
   int maxIndex = 0;
   for(int i=1; i<arraySize; i++) {
      if (array[i] > array[maxIndex]) {
         maxIndex = i;
      }
   }
   
   NSLog(@"found max:%d at array[%d]",array[maxIndex], maxIndex);
   
   int temp = array[minIndex];
   array[minIndex] = array[maxIndex];
   array[maxIndex] = temp;
}

int main(int argc, const char * argv[])
{

   @autoreleasepool {
      int array[10];
      memset(array, 0, sizeof(array));
      int *randomArray = array;
      [[AssortedMethods sharedInstance] randomArray:randomArray sizeOf:10 min:-10 max:20];
      
      NSLog(@"Assorted random array:%@",[[AssortedMethods sharedInstance] arrayToString:randomArray size:10]);
      
      swapMinMaxBetter(randomArray, 10);
      
      NSLog(@"Assorted random array:%@",[[AssortedMethods sharedInstance] arrayToString:randomArray size:10]);
   }
    return 0;
}

