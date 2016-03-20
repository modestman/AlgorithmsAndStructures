//
//  Queue.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 19.03.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import "Queue.h"

@implementation Queue
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

-(void)enqueue:(id)object
{
    [_array insertObject:object atIndex:0];
}

-(id)dequeue
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
