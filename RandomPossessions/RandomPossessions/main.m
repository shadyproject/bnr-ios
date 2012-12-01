//
//  main.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/25/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPItem.h"
#import "SPContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        SPContainer *box = [[SPContainer alloc] init];
        [box addSubItem:[SPItem randomItem]];
        [box addSubItem:[SPItem randomItem]];
        
        SPContainer *antique = [[SPContainer alloc] initWithName:@"Really Old Box" serialNumber:@"000001" dollarValue:500];
        [antique addSubItem:[SPItem randomItem]];
        
        NSLog(@"%@", box);
        NSLog(@"%@", antique);
        
        [box addSubItem:antique];
        
        NSLog(@"%@", box);
    }
    return 0;
}

