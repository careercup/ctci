//
//  AssortedMethods.h
//  
//
//  Created by Ryan Moniz on 11/27/2013.
//
//

#import <Foundation/Foundation.h>

@interface AssortedMethods : NSObject

+(AssortedMethods *)sharedInstance;

- (int)randomInt:(int)n;
- (int)randomIntInRange:(int)min to:(int)max;
- (BOOL)randomBoolean;
- (BOOL)randomBoolean:(int)percentTrue;
- (void)randomMatrix:(int **)array sizeOf:(int)m by:(int)n min:(int)min max:(int)max;
- (void)randomArray:(int *)array sizeOf:(int)size min:(int)min max:(int)max;
//- (LinkedListNode)randomLinkedList:(int)n min:(int)min max:(int)max;
//- (LinkedListNode)linkedListWithValue:(int)n value:(int)value;
- (NSString *)arrayToString:(int *)array size:(int)size;
- (NSString *)stringArrayToString:(NSArray *)array;
//- (NSString *)toFullBinaryString:(int)a;
//- (NSString *)toBaseNString:(int)a base:(int)base;
//- (void)printMatrix:(int[][])matrix;
//- (void)printMatrix:(BOOL[][])matrix;
//- (void)printIntArray:(int[])array;
//- (NSString *)charArrayToString:(char [])array;
//- (NSString *)listOfPointsToString:(NSArray *)pointsArray;
//- (TreeNode)randomBST(int)N min:(int)min max:(int)max;
//- (TreeNode)createTreeFromeArray:(int[])array;
//- (NSString *)getLongTextBlob;
//- (NSArray *)getLongTextBlobAsStringList;
//- (Trie)getTrieDictionary;
//- (NSArray *)getListOfWords;

@end
