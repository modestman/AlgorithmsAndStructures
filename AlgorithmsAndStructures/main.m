//
//  main.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 18.03.16.
//  Copyright (c) 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utils.h"
#import "Sorting.h"
#import "SomeProblems.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSLog(@"type a text:");
//        NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
//        NSData *inputData = [input availableData];        
//        NSString *str = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
//        NSLog(@"Text: %@", str);
        
        NSMutableArray *array = [Utils fillRandomIntArrayWithCapacity:10];
        [Utils printArray:array];
        
        Sorting *sorting = [[Sorting alloc] initWithComparator:^NSComparisonResult(NSNumber* obj1, NSNumber* obj2) {
            return [obj1 compare:obj2];
        }];
        
        //[sorting insertionSort:array];
        //[sorting bubbleSort:array];
        //[sorting heapSort:array];
        //[sorting quickSort:array];
        //NSArray *result = [sorting mergeSort:array];
        //[Utils printArray:result];
        
        NSString *str = @"a(())()";
        BOOL r = [SomeProblems checkParenthesisCorrectness:str];
        NSLog(@"%@", r ? @"true" : @"false");

    }
    return 0;
}
