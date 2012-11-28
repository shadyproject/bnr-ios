//
//  SPItem.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPItem.h"

@implementation SPItem

#pragma mark Initializer Implementation
- (id)init
{
    return [self initWithName:@"Default Name" serialNumber:@"0" dollarValue:0];
}

- (id)initWithName:(NSString *)name serialNumber:(NSString *)num dollarValue:(int)value
{
    self = [super init];
    
    if (self)
    {
        itemName = name;
        serialNumber = num;
        valueInDollars = value;
    
        dateCreated = [NSDate date];
    }
    
    return self;
}

#pragma mark Accessor Implementation
- (NSString *)itemName
{
    return itemName;
}

- (void)setItemName:(NSString *)name
{
    itemName = name;
}

- (NSString *)serialNumber
{
    return serialNumber;
}

- (void)setSerialNumber:(NSString *)num
{
    serialNumber = num;
}

- (int)valueInDollars
{
    return valueInDollars;
}

- (void)setValueInDollars:(int)value
{
    valueInDollars = value;
}

- (NSDate *)dateCreated
{
    return dateCreated;
}

#pragma mark Overrides
- (NSString *)description
{
    NSString *desc =[NSString stringWithFormat:@"SPItem Name:%@ Serial:%@ Value:%i Created:%@",
                     itemName, serialNumber, valueInDollars, dateCreated];
    return desc;
}

@end
