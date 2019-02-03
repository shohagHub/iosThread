//
//  ObjectiveCThreading.m
//  Threads
//
//  Created by Saleh Enam Shohag on 3/2/19.
//  Copyright © 2019 Saleh Enam Shohag. All rights reserved.
//

#import "ObjectiveCThreading.h"

@implementation ObjectiveCThreading

-(void)thread1{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self runHeavyTask1];
    });
    dispatch_block_t myBlock = ^{
        [self runHeavyTask2];
    };
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), myBlock);
}

-(void)runSerialQueueThread{
    dispatch_block_t task1Block = ^{
        [self runHeavyTask1];
    };
    dispatch_block_t task2Block = ^{
        [self runHeavyTask2];
    };
    
    dispatch_queue_t customSerialQueue = dispatch_queue_create("com.shohag", DISPATCH_QUEUE_SERIAL);
    dispatch_async(customSerialQueue, task1Block);
    dispatch_async(customSerialQueue, task2Block);
    
}

-(void)runHeavyTask1{
    int i, j;
    for(i = 0; i < 10000; i++){
        for(j = 0; j < 1000; j++){
            
        }
        NSLog(@"1");
    }
}

-(void)runHeavyTask2{
    int i, j;
    for(i = 0; i < 10000; i++){
        for(j = 0; j < 1000; j++){
            
        }
        NSLog(@"2");
    }
}

@end
