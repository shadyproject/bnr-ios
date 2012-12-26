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
        
        SPItem *backpack = [[SPItem alloc] init];
        [backpack setItemName:@"Backpack"];
        [items addObject:backpack];
        
        SPItem *calculator = [[SPItem alloc] init];
        [calculator setItemName:@"Calculator"];
        [items addObject:calculator];
        
        [backpack setContainedItem:calculator];
        
       //destroy the array when we're done
        NSLog(@"Setting items to nil.");    
        items = nil;
    }
    return 0;
}

