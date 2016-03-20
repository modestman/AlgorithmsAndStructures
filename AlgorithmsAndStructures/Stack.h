//
//  Stack.h
//  AlgorithmsAndStructures
//
//  Created by Admin on 19.03.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject

-(void)push:(id)object;
-(id)pop;
-(NSUInteger)count;

@end
