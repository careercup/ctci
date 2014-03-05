//
//  main.m
//  CompareBinaryToHex
//
//  Created by Ryan Moniz on 11/27/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//

//Suppose you were asked to write a function to check if the value of a binary
//number (passed as a string) equals the hexadecimal representation of a string.

#import <Foundation/Foundation.h>

int digitToValue(unichar c) {
   if (c >= '0' && c <= '9') {
      return c - '0';
   } else if (c >= 'A' && c <= 'F') {
      return 10 + c - 'A';
   } else if (c >= 'a' && c <= 'f') {
      return 10 + c - 'a';
   }
   return -1;
}

int convertToBase(NSString *number, int base) {
   if (base < 2 || (base > 10 && base != 16)) return -1; //check for if base is not 2, 10, or 16
   int value = 0;
   for (int i = (int)([number length] - 1);  i >= 0; i--) {
      int digit = digitToValue([number characterAtIndex:i]);
      if (digit < 0 || digit >= base) {
         return -1;
      }
      int exponent = (int)([number length] -1 -i);
      value += digit * pow(base, exponent);
   }
   return value;
}

BOOL compareBinaryToHex(NSString *binary, NSString *hex) {
   int n1 = convertToBase(binary, 2);
   int n2 = convertToBase(hex, 16);
   if (n1 < 0 || n2 < 0) {
      return NO;
   } else {
      return n1 == n2;
   }
}

int main(int argc, const char * argv[])
{
   @autoreleasepool {
      NSString *binary = @"111001011";
      NSString *hex = @"1CB";
      NSLog(@"Compare binary:%@ to hex:%@: result=%@",binary,hex,compareBinaryToHex(binary,hex)? @"True": @"False");
   }
    return 0;
}

