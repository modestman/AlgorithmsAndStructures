//
//  Stack.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 19.03.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import "Stack.h"

@implementation Stack
{
    NSMutableArray *_array;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        _array = [NSMutableArray new];
    }
    return self;
}

-(void)push:(id)object
{
    [_array addObject:object];
}

-(id)pop
{
    id object = [_array lastObject];
    [_array removeLastObject];
    return object;
}

-(NSUInteger)count
{
    return [_array count];
}


@end
