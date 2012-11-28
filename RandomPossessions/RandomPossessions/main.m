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
        
        SPItem *item = [[SPItem alloc] initWithName:@"Orange Tweed Sofa" serialNumber:@"1" dollarValue:500];
        NSLog(@"Created SPItem: %@.", item);
        
        SPItem *otherItem = [[SPItem alloc] init];
        NSLog(@"Default SPItem: %@", otherItem);
        
        
        //destroy it
        items = nil;
    }
    return 0;
}

