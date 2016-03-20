//
//  SomeProblems.m
//  AlgorithmsAndStructures
//
//  Created by Admin on 19.03.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import "SomeProblems.h"
#import "Stack.h"

@implementation SomeProblems

/* Проверка корректности расстановки скобок в строке (())()
 *
 */
+(BOOL)checkParenthesisCorrectness:(NSString*)string
{
    Stack *stack = [Stack new];
    for (int i = 0; i<[string length]; i++)
    {
        unichar c = [string characterAtIndex:i];
        if (c == '(')
        {
            [stack push:@(c)];
        }
        else if (c == ')')
        {
            id o = [stack pop];
            if (!o) return NO;
        }
        else
        {
            
        }
    }
    return [stack count] == 0;
}


@end
