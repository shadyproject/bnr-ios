//
//  PosessionStore.m
//  Homepwner
//
//  Created by Chris Martin on 3/19/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"

static PossessionStore *defaultStore = nil;

@implementation PossessionStore

+ (PossessionStore *)defaultStore
{
    if (!defaultStore) 
    {
        defaultStore = [[super allocWithZone:NULL] init];
    }
    
    return defaultStore;
}

//prevent creation of extra instances
+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    if (defaultStore) 
    {
        return defaultStore;
    }
    
    self = [super init];
    
    if (self) {
        allPossessions = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allPossessions
{
    return allPossessions;
}

- (Possession *)createPossession
{
    Possession *p = [Possession randomPossession];
    
    [allPossessions addObject:p];
    
    return p;
}

- (NSArray *)possessionsMatchingPredicate:(NSPredicate *)predicate
{
    //todo CSM make sure this is correct, or if we can just return it and not use autorelease
    NSArray *matches = [[self allPossessions] filteredArrayUsingPredicate:predicate]; 
    
    return matches;
}

- (NSArray *)possessionsWithValueGreaterThan:(NSNumber *)value
{
    NSPredicate *gtValue =  [NSPredicate predicateWithFormat:@"valueInDollars > %@", value];
    
    return [self possessionsMatchingPredicate:gtValue];
}

- (NSArray *)possessionsWithValueLessThanOrEqualTo:(NSNumber *)value
{
    NSPredicate *lteValue = [NSPredicate predicateWithFormat:@"valueInDollars <= %@", value];
    
    return [self possessionsMatchingPredicate:lteValue];
}

#pragma mark Retain/Release stuff
//override retain and release infrastructure so no one else can mess with our object lifetime
- (id)retain
{
    //do nothing
    return self;
}

- (oneway void)release
{
    //still nothing
}

- (NSUInteger)retainCount
{
    return NSUIntegerMax;
}

@end
