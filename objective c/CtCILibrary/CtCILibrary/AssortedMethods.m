//
//  AssortedMethods.m
//  
//
//  Created by Ryan Moniz on 11/27/2013.
//
//

#import "AssortedMethods.h"

@implementation AssortedMethods

static AssortedMethods *instance;

+(AssortedMethods *)sharedInstance {
   if (instance == nil) {
      instance = [[AssortedMethods alloc] init];
   }
   return instance;
}

- (int)randomInt:(int)n {
   return (int)(random()*n);
}

- (int)randomIntInRange:(int)min to:(int)max {
   int value = (arc4random() % max) + min;
   return value;
}

- (BOOL)randomBoolean {
   return [self randomIntInRange:0 to:1] == 0;
}

- (BOOL)randomBoolean:(int)percentTrue {
   return [self randomIntInRange:1 to:100] <= percentTrue;
}

- (void)randomMatrix:(int **)array sizeOf:(int)m by:(int)n min:(int)min max:(int)max {
   for(int i=0; i < m; i++) {
      for(int j = 0; j < n; j++) {
         int value = [self randomIntInRange:min to:max];
         array[i][j] = value;
      }
   }
}

- (void)randomArray:(int *)array sizeOf:(int)size min:(int)min max:(int)max {
   for(int j= 0; j<size; j++) {
      int value = [self randomIntInRange:min to:max];
      array[j] = value;
   }
}

//- (LinkedListNode)randomLinkedList:(int)n min:(int)min max:(int)max {
//LinkedListNode root = new LinkedListNode(randomIntInRange(min, max), null, null);
//LinkedListNode prev = root;
//for (int i = 1; i < N; i++) {
//   int data = randomIntInRange(min, max);
//   LinkedListNode next = new LinkedListNode(data, null, null);
//   prev.setNext(next);
//   prev = next;
//}
//return root;
//}

//- (LinkedListNode)linkedListWithValue:(int)n value:(int)value {
//   LinkedListNode root = new LinkedListNode(value, null, null);
//   LinkedListNode prev = root;
//   for (int i = 1; i < N; i++) {
//      LinkedListNode next = new LinkedListNode(value, null, null);
//      prev.setNext(next);
//      prev = next;
//   }
//   return root;
//}

- (NSString *)arrayToString:(int *)array size:(int)size {
   NSMutableString *string = [[NSMutableString alloc] init];
   for (int i =0; i<size; i++) {
      [string appendFormat:@"%d\", \"",array[i]];
   }
   return string;
}

- (NSString *)stringArrayToString:(NSArray *)array {
   NSMutableString *string = [[NSMutableString alloc] init];
   for (NSString *str in array) {
      [string appendFormat:@"%@\",\"",str];
   }
   return (NSString *)string;
}

//- (NSString *)toFullBinaryString:(int)a {
//   String s = "";
//   for (int i = 0; i < 32; i++) {
//      Integer lsb = new Integer(a & 1);
//      s = lsb.toString() + s;
//      a = a >> 1;
//   }
//   return s;
//}

//- (NSString *)toBaseNString:(int)a base:(int)base {
//   NSMutableString *string = [[NSMutableString alloc] init];
//   while (true) {
//      int lastdigit = a % base;
//      string append = lastdigit + s;
//      a = a / base;
//      if (a == 0) break;
//   }
//   
//   return s;
//}

//- (void)printMatrix:(int[][])matrix {
//   
//}
//
//- (void)printMatrix:(BOOL[][])matrix {
//   
//}
//
//- (void)printIntArray:(int[])array {
//   
//}
//
//- (NSString *)charArrayToString:(char [])array {
//   
//}
//
//- (NSString *)listOfPointsToString:(NSArray *)pointsArray {
//   
//}
//
////- (TreeNode)randomBST(int)N min:(int)min max:(int)max {
//   
//}
//
////- (TreeNode)createTreeFromeArray:(int[])array {
//   
//}
//
//- (NSString *)getLongTextBlob {
//   
//}
//
//- (NSArray *)getLongTextBlobAsStringList {
//   
//}
//
////- (Trie)getTrieDictionary {
//   
//}
//
//- (NSArray *)getListOfWords {
//   
//}

- (NSArray *)getCharacterArray:(NSString *)string {
   NSMutableArray *charArray = [[NSMutableArray alloc] initWithCapacity:[string length]];
   for (int i=0; i<string.length; ++i) {
      NSString *charStr = [string substringWithRange:NSMakeRange(i, 1)];
      [charArray addObject:charStr];
   }
   return charArray;
}

@end
