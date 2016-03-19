//
//  Sorting.h
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sorting : NSObject
{
    NSComparator comparator;
}

-(id)initWithComparator:(NSComparator)cmp;

/// Сортировка вставками
-(void)insertionSort:(NSMutableArray*)array;

/// Сортировка пузырьком
-(void)bubbleSort:(NSMutableArray*)array;

/// Сортировка слиянием
-(NSArray*)mergeSort:(NSArray*)array;

/// Быстрая сортировка
-(void)quickSort:(NSMutableArray*)array;

/// Пирамидальная сортировка
-(void)heapSort:(NSMutableArray*)array;

@end
