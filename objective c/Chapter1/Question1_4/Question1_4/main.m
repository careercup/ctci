//
//  main.m
//  Question1_4
//
//  Created by Ryan Moniz on 11/28/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//
//  Write a method to replace all spaces in a string with '%20'. You may assume
//  that the string has sufficient space at the end of the string to hold the
//  additional characters, and that you are given the "true" length of the
//  string. (Note: if implementing in Java, please use a character array so
//  that you can perform this operation in place.)
//  EXAMPLE
//  Input: "Mr John Smith    "
//  Output: "Mr%20John%20Smith"

#import <Foundation/Foundation.h>
#import "AssortedMethods.h"

int numberOfSpacesIn(NSString * string) {
   //determine number of spaces in string
   int numSpaces = 0;
   NSString *spaceString = @" ";
   unichar space = [spaceString characterAtIndex:0];
   
   for(int i=0; i<[string length]; i++) {
      unichar character = [string characterAtIndex:i];
      if (character == space) {
         numSpaces++;
      }
   }
   return numSpaces;
}

void replaceSpacesIn(unichar *array, NSUInteger stringLength, int capacity) {
   //replace in place spaces with %20
   
   //charArray = {a,b,c, ,d, ,e, ,f,,,,,,,,,}
   //charArray = {a,b,c,%,2,0,d, ,e, ,f,,,,,,}
   //charArray = {a,b,c,%,2,0,d,%,2,0,e, ,f,,,}
   //charArray = {a,b,c,%,2,0,d,%,2,0,e,%,2,0,f}
   
   int index = (capacity - 1);
   for(int i=(int)(stringLength-1); i>=0; i--) {
      NSLog(@"array[%d] =%c",i,(char)array[i]);
      if (array[i] != ' ') {
         //found character, move it to index
         array[index] = array[i];
         index--;
      }
      else if (array[i] == ' ') {
         //found space
         array[index] = '0';
         array[index-1] = '2';
         array[index-2] = '%';
         index -= 3;
      }
   } //end of for loop
}

int main(int argc, const char * argv[])
{
   @autoreleasepool {
      NSString *str = @"abc d e f";
      
      int numSpaces = numberOfSpacesIn(str);
      int capacity = (int)([str length] + (numSpaces *2));
      
      unichar array[capacity];
      unichar *arrayPtr = array;
      
      [str getCharacters:array range:NSMakeRange(0, [str length])];
      
//      for(int i=0;i<capacity;i++) {
//         NSLog(@"array[%d] = %c",i,array[i]);
//      }
      
      replaceSpacesIn(arrayPtr, [str length],capacity);
      NSLog(@"Input: %@\n",str);
      NSLog(@"Output:");
      for(int i=0;i<capacity;i++) {
         NSLog(@"array[%d] = %c",i,array[i]);
      }
      
      //    replaceSpaces(charArray, [str length]);
   }
    return 0;
}

