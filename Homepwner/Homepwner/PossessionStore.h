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
- (void)removePossession:(Possession *)p;
- (void)movePossessionAtIndex:(int)from toIndex:(int)to;

@end
