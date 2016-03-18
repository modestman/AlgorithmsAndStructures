//
//  Sorting.h
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sorting : NSObject


/// Сортировка вставками
-(void)insertionSort:(NSMutableArray*)array;

/// Сортировка пузырьком
-(void)bubbleSort:(NSMutableArray*)array;

@end
