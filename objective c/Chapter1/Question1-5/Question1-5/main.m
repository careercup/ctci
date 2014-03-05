//
//  main.m
//  Question1-5
//
//  Created by Ryan Moniz on 11/29/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//
//Implement a method to perform basic string compression using the counts of
//repeated characters. For example, the string aabcccccaaa would become a2blc5a3.
//If the "compressed" string would not become smaller than the original string,
//your method should return the original string.

#import <Foundation/Foundation.h>

NSString *compressedString(NSString *string) {
   //aabcccccaaa
   //aa = a2
   //b = b1
   //ccccc = c5
   //aaa = a3
   NSMutableString *compressedStr = [[NSMutableString alloc] init];
   
   unichar letter = [string characterAtIndex:0];
   int letterCount = 1;
   for(int i=1; i<[string length]; i++) {
      unichar nextLetter = [string characterAtIndex:i];
      if (nextLetter == letter) {
         letterCount++;
      } else {
         //new letter
         [compressedStr appendFormat:@"%c%d",letter,letterCount];
         letter = nextLetter;
         letterCount = 1;
      }
   }
   
   //need to print out the last letter
   [compressedStr appendFormat:@"%c%d",letter,letterCount];
   
   //check if string is smaller than original string
   if ([compressedStr length] < [string length]) {
      return compressedStr;
   }
   
   return string;
}

int main(int argc, const char * argv[])
{
   @autoreleasepool {
      NSString *str = @"aabcccccaaa";
      
      NSString *compressedStr = compressedString(str);
      
      NSLog(@"Input:%@ Output:%@",str,compressedStr);
   }
    return 0;
}

