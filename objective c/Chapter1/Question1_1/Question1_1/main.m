//
//  main.m
//  Question1_1
//
//  Created by Ryan Moniz on 11/27/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//
//Implement an algorithm to determine if a string has all unique characters.
//What if you cannot use additional data structures?

#import <Foundation/Foundation.h>

BOOL isUniqueChars(NSString *string) {
   if ([string length] > 256) { //is string greater than # of ASCII characters
      return NO;
   }
   
   bool char_set[256];
   memset(char_set, 0, 256);
   //store an array of boolean values to indicate if the char is unique or not
   for (int i=0; i < [string length]; i++) {
      int value = ([string characterAtIndex:i] - 'a');
      if (char_set[value]) {
         return NO; //duplicate
      }
      char_set[value] = YES;
   }
   
   //space = n
   //time = O(n)
   
   return YES;
}

BOOL isUniqueChars2(NSString *string) {
   if ([string length] > 256) { //is string greater than # of ASCII characters
      return NO;
   }
   
   int checker = 0;
   //using 8 bits of an byte gives us 2^8 = 256 to store the result
   for (int i=0; i < [string length]; i++) {
      int value = ([string characterAtIndex:i] - 'a');
      if ((checker & (1 << value)) > 0) {
         return NO; //duplicate
      }
      checker |= (1 << value);
   }
   
   //space = n/8
   //time = O(n)
   
   return YES;
}

int main(int argc, const char * argv[])
{

   @autoreleasepool {
      NSArray *words = [NSArray arrayWithObjects:@"abcde",
                         @"hello",
                         @"apple",
                         @"kite",
                         @"padle",
                         nil];
      
      for (NSString *word in words) {
         NSLog(@"%@ \": \" %@ %@",word,isUniqueChars(word) ? @"TRUE":@"FALSE",isUniqueChars2(word)? @"TRUE":@"FALSE");
      }
       
   }
    return 0;
}

