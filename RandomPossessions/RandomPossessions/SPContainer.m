//
//  SPContainer.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/28/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPContainer.h"

@implementation SPContainer
#pragma mark Initializers
- (id)init
{
    return [self initWithName:@"Default Container" serialNumber:@"BOX" dollarValue:1];
}

- (id)initWithName:(NSString *)name serialNumber:(NSString *)num dollarValue:(int)value
{
    self = [super initWithName:name serialNumber:num dollarValue:value];
    if (self)
    {
        subItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)addSubItem:(SPItem *)item
{
    [subItems addObject:item];
}

- (int)totalValue
{
    int total = 0;
    
    for (SPItem *i in subItems)
    {
        total += [i valueInDollars];
    }
    
    total += [self valueInDollars];
    
    return total;
}

#pragma mark Overrides
- (NSString *)description
{
    return @"Overridden Description";
}
@end
