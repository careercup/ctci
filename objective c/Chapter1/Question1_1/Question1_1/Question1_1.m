//
//  Question1_1.m
//  Question1_1
//
//  Created by davinorm on 4/25/15.
//  Copyright (c) 2015 David Norman. All rights reserved.
//

#import "Question1_1.h"

@implementation Question1_1

+(bool) isUniqueChars:(NSString *)string {
    if ([string length] > 256) { //is string greater than # of ASCII characters - The objective C way
        return NO;
    }
    
    NSMutableDictionary *valueDict = [[NSMutableDictionary alloc]init];
    //store an array of boolean values to indicate if the char is unique or not
    for (int i=0; i < [string length]; i++) {
        int value = ([string characterAtIndex:i] - 'a');
        if ( [valueDict objectForKey:[NSNumber numberWithInt:value]] != nil) {
            return NO; //duplicate
        }
        [valueDict setObject:@YES forKey:[NSNumber numberWithInt:value]];
    }
    
    //space = n
    //time = O(n)
    
    return YES;
}

@end
