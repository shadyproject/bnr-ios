//
//  SPItemStore.h
//  Homepwner
//
//  Created by Christopher Martin on 2/6/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPItem;

@interface SPItemStore : NSObject
{
    NSMutableArray *allItems;
}

+ (SPItemStore *)sharedStore;

- (NSArray *)allItems;
- (SPItem *)createItem;
- (void)removeItem:(SPItem *)item;

@end
