//
//  Sorting.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import "Sorting.h"

@implementation Sorting

-(id)init
{
    self = [super init];
    if (self)
    {
       
    }
    return self;
}

// Сортировка вставками
-(void)insertionSort:(NSMutableArray*)array
{
    for (int j = 1; j<[array count]; j++)
    {
        id key = array[j];
        int i = j - 1;
        while (i >= 0 && [array[i] intValue] > [key intValue])
        {
            array[i+1] = array[i];            
            i = i - 1;
        }
        array[i+1] = key;
    }
}

-(void)bubbleSort:(NSMutableArray*)array
{
    for (int i = 0; i<[array count]; i++)
    {
        for (int j = (int)[array count]-1; j>i; j--)
        {
            if ([array[j] intValue] < [array[j-1] intValue])
            {
                id tmp = array[j];
                array[j] = array[j-1];
                array[j-1] = tmp;
            }
        }
    }
}

@end
