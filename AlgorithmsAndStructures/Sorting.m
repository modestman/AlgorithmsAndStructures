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

// Сортировка пузырьком
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

// Сортировка слиянием
-(NSArray*)mergeSort:(NSArray*)array
{
    if ([array count] <= 1) return array;
    int mid = (int)[array count] / 2;
    NSArray *ar1 = [self mergeSort: [array subarrayWithRange:NSMakeRange(0, mid)]];
    NSArray *ar2 = [self mergeSort: [array subarrayWithRange:NSMakeRange(mid, [array count]-mid)]];
    return [self mergeArray1:ar1 andArray2:ar2];
}

-(NSArray*)mergeArray1:(NSArray*)array1 andArray2:(NSArray*)array2
{
    unsigned long length = [array1 count] + [array2 count];
    int a = 0, b = 0;
    NSMutableArray *merged = [[NSMutableArray alloc] initWithCapacity:length];
    for (int i = 0; i<length; i++)
    {
        if (a < [array1 count] && b < [array2 count])
        {
            if (array1[a] > array2[b])
                merged[i] = array2[b++];
            else
                merged[i] = array1[a++];
        }
        else
        {
            if (b < [array2 count])
                merged[i] = array2[b++];
            else
                merged[i] = array1[a++];
        }
    }
    return merged;
}

@end
