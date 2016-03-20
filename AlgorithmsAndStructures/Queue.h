//
//  Queue.h
//  AlgorithmsAndStructures
//
//  Created by Admin on 19.03.16.
//  Copyright © 2016 Anton Glezman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(void)enqueue:(id)object;
-(id)dequeue;
-(NSUInteger)count;

@end
