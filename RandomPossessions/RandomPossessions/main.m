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
        
        //add some items
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];
        
        //add an item at a specific index
        [items insertObject:@"Zero" atIndex:0];
        
        //todo this should use fast enumeration
        for (int i = 0; i < [items count]; i++) {
            NSLog(@"Item: %@", [items objectAtIndex:i]);
        }
        
        SPItem *item = [[SPItem alloc] initWithName:@"Orange Tweed Sofa" serialNumber:@"1" dollarValue:500];
        NSLog(@"Created SPItem: %@.", item);
        
        SPItem *otherItem = [[SPItem alloc] init];
        NSLog(@"Default SPItem: %@", otherItem);
        
        
        //destroy it
        items = nil;
    }
    return 0;
}

