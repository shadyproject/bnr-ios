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

- (void)removePossession:(Possession *)p
{
    [allPossessions removeObjectIdenticalTo:p];
}

- (void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    if (from == to)
    { 
        return;
    }

    
    Possession *p = [allPossessions objectAtIndex:from];
    
    //retain it (retain count = 2)
    [p retain];
    
    //release it from the array (retain count = 1)
    [allPossessions removeObjectAtIndex:from];
    
    //add it back to the array at the new index
    [allPossessions insertObject:p atIndex:to];
    
    //release from (Retain count = 1 , only owner is now array)
    [p release];
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
