//
//  main.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/25/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        //create an array
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < 10; i++)
        {
            SPItem *item = [SPItem randomItem];
            [items addObject:item];
        }
        
        for (SPItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        //destroy the array when we're done
        items = nil;
    }
    return 0;
}

