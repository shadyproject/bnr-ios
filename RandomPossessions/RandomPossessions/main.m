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
        
        SPItem *item = [[SPItem alloc] init];
        [item setItemName:@"Orange Tweed Couch"]; //i totally own one of these
        [item setSerialNumber:@"1"];
        [item setValueInDollars:400];
        
        NSLog(@"Created SPItem: %@.  Name: %@, Serial: %@, Value: %i, Created: %@",
              item, [item itemName], [item serialNumber], [item valueInDollars], [item dateCreated]);
        
        //destroy it
        items = nil;
    }
    return 0;
}

