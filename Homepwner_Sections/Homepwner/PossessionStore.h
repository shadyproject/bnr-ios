//
//  PosessionStore.h
//  Homepwner
//
//  Created by Chris Martin on 3/19/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Possession;

@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}

+ (PossessionStore *)defaultStore;

- (NSArray *)allPossessions;
- (Possession *)createPossession;
- (NSArray *)possessionsWithValueLessThanOrEqualTo:(NSNumber *)value;
- (NSArray *)possessionsWithValueGreaterThan:(NSNumber *)value;
- (NSArray *)possessionsMatchingPredicate:(NSPredicate *)predicate;

@end
