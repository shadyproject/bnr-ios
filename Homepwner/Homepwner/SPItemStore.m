//
//  SPItemStore.m
//  Homepwner
//
//  Created by Christopher Martin on 2/6/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItemStore.h"
#import "SPItem.h"

@implementation SPItemStore

+ (SPItemStore *)sharedStore
{
    static SPItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

- (NSArray *)allItems
{
    return allItems;
}

- (SPItem *)createItem
{
    SPItem *item = [SPItem randomItem];
    
    [allItems addObject:item];
    
    return item;
}

- (NSArray *)itemsMatchingPredicate:(NSPredicate *)predicate
{
    NSArray *matches = [[self allItems] filteredArrayUsingPredicate:predicate];
    
    return matches;
}

- (NSArray *)itemsWithValueGreaterThan:(NSNumber *)value
{
    NSPredicate *gtValue =  [NSPredicate predicateWithFormat:@"valueInDollars > %@", value];
    
    return [self itemsMatchingPredicate:gtValue];
}

- (NSArray *)itemsWithValueLessThanOrEqualTo:(NSNumber *)value
{
    NSPredicate *lteValue = [NSPredicate predicateWithFormat:@"valueInDollars <= %@", value];
    
    return [self itemsMatchingPredicate:lteValue];
}


#pragma mark -
#pragma mark Overrides
+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }

    return self;
}
@end
