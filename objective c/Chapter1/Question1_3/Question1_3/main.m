//
//  main.m
//  Question1_3
//
//  Created by Ryan Moniz on 11/28/2013.
//  Copyright (c) 2013 Ryan Moniz. All rights reserved.
//
//  Given two strings, write a method to decide if one is a permutation
//  of the other.

#import <Foundation/Foundation.h>
#import "AssortedMethods.h"

NSString *sort(NSString *string) {
   NSArray *charArray = [[AssortedMethods sharedInstance] getCharacterArray:string];
   
   NSArray *content = [charArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
   
   return [content description];
}

BOOL permutation(NSString *word1, NSString *word2) {
   //sort the characters in ascending order by both words and then do a compare.
   return [sort(word1) isEqualToString:sort(word2)];
}

BOOL anagram(NSString *s, NSString *t) {
   if ([s length] != [t length]) //check that both words are the same length
      return false;
   
   int letters[256]; //assumping ascii characters only
   memset(letters, 0, 256);
   int num_unique_chars = 0;
   int num_completed_t = 0;

   for (int i=0; i<[s length]; i++) { // count number of each char in s.
      int value = ([s characterAtIndex:i] - 'a');
      if (letters[value] == 0)
         ++num_unique_chars;
      ++letters[value];
   }
   for (int i = 0; i < [t length]; ++i) {
      int value = ([t characterAtIndex:i] - 'a');
      if (letters[value] == 0) { // Found more of char c in t than in s.
         return false;
      }
      --letters[value];
      if (letters[value] == 0) {
         ++num_completed_t;
         if (num_completed_t == num_unique_chars) {
            // it's a match if t has been processed completely
            return true;
            //return i == [t length] - 1;
         }
      }
   }
   return false;
}

BOOL isPermuation(NSString *word1, NSString *word2) {
   if([word1 length] != [word2 length]) {
      return false;
   }
   
   BOOL result = false;
   
   for(int i=0; i<[word1 length]; i++) {
      unichar character = [word1 characterAtIndex:i];
      result = false; //reset each time
      for(int j=0; j<[word2 length]; j++) {
         unichar character2 = [word2 characterAtIndex:j];
         if (character == character2) {
            //found matching character
            result = true;
            break;
         }
      }
      
      if (result == false) {
         //if we complete the loop once and result is not true
         //no matching character was found so we can exit early.
         break;
      }
   }
   
   return result;
}

int main(int argc, const char * argv[])
{
   @autoreleasepool {
      NSString *pairs[3][2];
      pairs[0][0] = @"apple";
      pairs[0][1] = @"papel";

      pairs[1][0] = @"carrot";
      pairs[1][1] = @"tarroc";
      
      pairs[2][0] = @"hello";
      pairs[2][1] = @"llloh";
      
      
      for (int i=0; i<3; i++) {
         NSString *word1 = pairs[i][0];
         NSString *word2 = pairs[i][1];
//         NSLog(@"word1 = %@",word1);
//         NSLog(@"word2 = %@",word2);
         
         BOOL isAnagram = permutation(word1,word2);
         NSLog(@"%@ , %@ : %@)",word1,word2,isAnagram?@"True":@"False");
         NSLog(@"anagram(%@,%@): %@",word1,word2,anagram(word1,word2)? @"True":@"False");
         
         NSLog(@"isPermuation(%@,%@): %@",word1,word2,isPermuation(word1,word2)? @"True":@"False");
      }
   }
    return 0;
}

