//
//  Utils.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import "Utils.h"
#include <stdlib.h>

@implementation Utils

+(void)printArray:(NSArray*)array
{
    NSString *str = [array componentsJoinedByString:@", "];
    NSLog(@"%@", str);
}

+(NSMutableArray*)fillRandomIntArrayWithCapacity:(int)capacity
{
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:capacity];
    for (int i = 0; i<capacity; i++) {
        int r = arc4random_uniform(capacity);
        [array addObject:[NSNumber numberWithInt:r]];
    }
    return array;
}

@end
