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

+ (SPItemStore *)sharedStore {
    static SPItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

- (NSArray *)allItems {
    return allItems;
}

- (SPItem *)createItem {
    SPItem *item = [[SPItem alloc] init];
    
    [allItems addObject:item];
    
    return item;
}

- (void)removeItem:(SPItem *)item {
    [allItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(int)from toIndex:(int)to {
    SPItem *item = [allItems objectAtIndex:from];
    
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:item atIndex:to];
}

-(NSString*)itemArchivePath{
    NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docDirs objectAtIndex:0];
    
    return [docDir stringByAppendingPathComponent:@"items.archive"];
}

-(BOOL)saveChanges{
    NSString *path = [self itemArchivePath];
    
    return [NSKeyedArchiver archiveRootObject:allItems toFile:path];
}

#pragma mark -
#pragma mark Overrides
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedStore];
}

- (id)init {
    self = [super init];
    
    if (self) {
        NSString *path = [self itemArchivePath];
        allItems = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        if (!allItems) {
            allItems = [[NSMutableArray alloc] init];
        }
    }

    return self;
}
@end
