//
//  SPItemStore.m
//  Homepwner
//
//  Created by Christopher Martin on 2/6/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "SPItemStore.h"
#import "SPImageStore.h"
#import "SPItem.h"

@implementation SPItemStore

#pragma mark -
#pragma mark Singleton methods
+ (SPItemStore *)sharedStore {
    static SPItemStore *sharedStore = nil;
    
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}

#pragma mark -
#pragma mark Item Management MEthods
- (NSArray *)allItems {
    return allItems;
}

-(SPItem *)createItem{
    double order = (allItems.count == 0 ? 1.0 : [allItems.lastObject orderingValue] + 1.0);
    
    DLog(@"Adding after %d items, order %.2f", allItems.count, order);
    
    SPItem *item = [NSEntityDescription insertNewObjectForEntityForName:@"SPItem" inManagedObjectContext:context];
    
    item.orderingValue = order;
    
    [allItems addObject:item];
    
    return item;
}

-(void)removeItem:(SPItem *)item{
    NSString *key = item.imageKey;
    [[SPImageStore sharedStore] deleteImageForKey:key];
    
    [context deleteObject:item];
    [allItems removeObjectIdenticalTo:item];
}

-(void)moveItemAtIndex:(int)from toIndex:(int)to {
    
    if (from == to) {
        return;
    }
    
    SPItem *item = [allItems objectAtIndex:from];
    
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:item atIndex:to];
    
    double lowerBound = ( to > 0 ?
                         [[allItems objectAtIndex:to-1] orderingValue]
                         : [[allItems objectAtIndex:1] orderingValue] - 2.0);
    
    double upperBound = (to < allItems.count - 1 ?
                         [[allItems objectAtIndex:to + 1] orderingValue]
                         : [[allItems objectAtIndex:to -  1] orderingValue] + 2.0);
    
    double newOrderingValue = (lowerBound + upperBound) / 2.0;
    
    DLog(@"Moving to order %f", newOrderingValue);
    
    item.orderingValue = newOrderingValue;
}

#pragma mark -
#pragma mark AssetType methods
-(NSArray *)allAssetTypes{
    if (!allAssetTypes) {
        NSFetchRequest *req = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *desc = [[model entitiesByName] objectForKey:@"SPAssetType"];
        
        [req setEntity:desc];
        
        NSError *error = nil;
        NSArray *result = [context executeFetchRequest:req error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", error.localizedDescription];
        }
        
        allAssetTypes = [result mutableCopy];
    }
    
    if (allAssetTypes.count == 0) {
        NSManagedObject *type;
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"SPAssetType" inManagedObjectContext:context];
        [type setValue:@"Furniture" forKey:@"label"];
        [allAssetTypes addObject:type];
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"SPAssetType" inManagedObjectContext:context];
        [type setValue:@"Jewelry" forKey:@"label"];
        [allAssetTypes addObject:type];
        
        type = [NSEntityDescription insertNewObjectForEntityForName:@"SPAssetType" inManagedObjectContext:context];
        [type setValue:@"Electronics" forKey:@"label"];
        [allAssetTypes addObject:type];
    }
    
    return allAssetTypes;
}

#pragma mark -
#pragma mark Saving and Loading methods
-(NSString*)itemArchivePath{
    NSArray *docDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docDirs objectAtIndex:0];
    
    return [docDir stringByAppendingPathComponent:@"store.data"];
}

-(BOOL)saveChanges{
    NSError *error = nil;
    
    BOOL didSucceed = [context save:&error];
    
    if (!didSucceed) {
        DLog(@"Error while saving: %@", [error localizedDescription]);
    }
    
    return didSucceed;
}

-(void)loadAllItems{
    if (!allItems) {
        NSFetchRequest *req = [[NSFetchRequest alloc] init];
        NSEntityDescription *desc = [[model entitiesByName] objectForKey:@"SPItem"];
        [req setEntity:desc];
        
        NSSortDescriptor *sd =
            [NSSortDescriptor sortDescriptorWithKey:@"orderingValue" ascending:YES];
        
        [req setSortDescriptors:@[sd]];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:req error:&error];
        
        if (!result) {
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        allItems = [[NSMutableArray alloc] initWithArray:result];
        
    }
}

#pragma mark -
#pragma mark Overrides
+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedStore];
}

- (id)init {
    self = [super init];
    
    if (self) {
        //Read in the data model
        model = [NSManagedObjectModel mergedModelFromBundles:nil];
        NSPersistentStoreCoordinator *psc =
            [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
        
        //set up the storage path for the sql lite file
        NSString *path = [self itemArchivePath];
        NSURL *storeUrl = [NSURL fileURLWithPath:path];
        NSError *error = nil;
        
        if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error]) {
            [NSException raise:@"Open Failed" format:@"Reason %@", [error localizedDescription]];
        }
        
        //create our managed object context
        context =   [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:psc];
        [context setUndoManager:nil]; //we don't need undo
        
        [self loadAllItems];
    }

    return self;
}
@end
