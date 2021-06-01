//
//  main.m
//  Question1_1
//
//  Created by David Norman on 4/25/2015.
//  Copyright (c) 2015 David Norman. All rights reserved.
//
//Implement an algorithm to determine if a string has all unique characters.
//What if you cannot use additional data structures?

#import <Foundation/Foundation.h>
#import "Question1_1.h"

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
         NSLog(@"%@ \": \" %@",word,[Question1_1  isUniqueChars:word] ? @"TRUE":@"FALSE");
      }
       
   }
    return 0;
}

