//
//  Sorting.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import "Sorting.h"
#include <stdlib.h>

@implementation Sorting
{
    int heapSize;
}

-(id)initWithComparator:(NSComparator)cmp
{
    self = [super init];
    if (self)
    {
        comparator = cmp;
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
        while (i >= 0 && comparator(array[i], key) == NSOrderedDescending)
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
            if (comparator(array[j], array[j-1]) == NSOrderedAscending)
            {
                [self swap:array a:j b:j-1];
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
            if (comparator(array1[a], array2[b]) == NSOrderedDescending) // array1[a] > array2[b]
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

// Быстрая сортировка
-(void)quickSort:(NSMutableArray*)array
{
    [self quickSort:array start:0 end:(int)[array count]-1];
}

-(void)quickSort:(NSMutableArray*)array start:(int)start end:(int)end
{
    if ( start >= end )
    {
        return;
    }
    int pivot = [self partition:array start:start end:end];
    [self quickSort:array start:start end:pivot-1];
    [self quickSort:array start:pivot+1 end:end];
}

-(int)partition:(NSMutableArray*)array start:(int)start end:(int)end
{
    int index = start + arc4random_uniform(end - start + 1);
    [self swap:array a:index b:end]; // поместили опорный элемент в конец массива
    index = start;
    for (int i = start; i < end; i++)
    {
        NSComparisonResult cmpResult = comparator(array[i], array[end]); // сравниваем с опорным элементом
        if (cmpResult == NSOrderedAscending || cmpResult == NSOrderedSame) // array[i] <= array[end]
        {
            [self swap:array a:index b:i];
            index++;
        }
    }
    [self swap:array a:index b:end];
    return index;
}

-(void)swap:(NSMutableArray*)array a:(int)a b:(int)b
{
    id tmp = array[a];
    array[a] = array[b];
    array[b] = tmp;
}

// Пирамидальная сортировка (Сортировка с помощью кучи)
-(void)heapSort:(NSMutableArray*)array
{
    heapSize = (int)[array count];
    [self buildHeap:array];
    while (heapSize > 1)
    {
        [self swap:array a:0 b:heapSize-1];
        heapSize--;
        [self heapify:array i:0];
    }
}

// Переупорядочивает поддерево кучи начиная с узла i так, чтобы выполнялось
// основное свойство кучи - a[parent] >= a[child].
-(void)heapify:(NSMutableArray*)array i:(int)i
{
    int l = [self left:i];
    int r = [self right:i];
    int largest = i;
    if (l < heapSize && comparator(array[i], array[l]) == NSOrderedAscending) {
        largest = l;
    }
    if (r < heapSize && comparator(array[largest], array[r]) == NSOrderedAscending) {
        largest = r;
    }
    if (i != largest)
    {
        [self swap:array a:i b:largest];
        [self heapify:array i:largest];
    }
}

-(void)buildHeap:(NSMutableArray*)array
{
    int i = ((int)[array count]-1)/2;
    while(i >= 0)
    {
        [self heapify:array i:i];
        i--;
    }
}

// Возвращает индекс левого потомка текущего узла
-(int)left:(int)i
{
    return 2*i+1;
}

// Возвращает индекс правого потомка текущего узла
-(int)right:(int)i
{
    return 2*i+2;
}


@end
