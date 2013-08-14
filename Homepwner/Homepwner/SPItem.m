//
//  SPItem.m
//  RandomPossessions
//
//  Created by Christopher Martin on 11/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPItem.h"

@implementation SPItem

#pragma mark Property Synthesizers
@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;
@synthesize imageKey;

#pragma mark Class Methods
+ (id)randomItem
{
    //set up some random adjectives
    NSArray *adjectives = [NSArray arrayWithObjects:@"Spikey", @"Tasty", @"Rough", nil];
    
    //and now, some nouns
    NSArray *nouns = [NSArray arrayWithObjects:@"Sofa", @"Table", @"Musket", nil];
    
    //get some random indexes
    NSInteger adjIdx = random() % [adjectives count];
    NSInteger nounIdx = random() % [nouns count];
    
    NSString *randomName =
        [NSString stringWithFormat:@"%@ %@", [adjectives objectAtIndex:adjIdx], [nouns objectAtIndex:nounIdx]];
    
    int randomValue = random() % 100;
    
    NSString *randomSerial = [NSString stringWithFormat:@"%c%c%c%c%c",
                              '0' + rand() % 10,
                              'A' + rand() % 26,
                              '0' + rand() % 10,
                              'A' + rand() % 26,
                              '0' + rand() % 10];
    
    SPItem *item = [[self alloc] initWithName:randomName serialNumber:randomSerial dollarValue:randomValue];
    
    return item;
}

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

#pragma mark Method Implementations
- (void)setContainedItem:(SPItem *)item
{
    containedItem = item;
    [item setContainer:self];
}

#pragma mark Overrides
- (NSString *)description
{
    NSString *desc =[NSString stringWithFormat:@"%@ (%@) Worth %i Created:%@",
                     itemName, serialNumber, valueInDollars, dateCreated];
    return desc;
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
