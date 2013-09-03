//
//  SPItemStore.h
//  Homepwner
//
//  Created by Christopher Martin on 2/6/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SPItem;

@interface SPItemStore : NSObject
{
    NSMutableArray *allItems;
    NSMutableArray *allAssetTypes;
    NSManagedObjectContext *context;
    NSManagedObjectModel *model;
}

+ (SPItemStore *)sharedStore;

#pragma mark -
#pragma mark ITem Management
-(void)loadAllItems;
-(NSArray *)allItems;
-(SPItem *)createItem;
-(void)removeItem:(SPItem *)item;
-(void)moveItemAtIndex:(int)from toIndex:(int)to;

#pragma mark -
#pragma mark Asset Type Management
-(NSArray *)allAssetTypes;

#pragma mark -
#pragma mark Persistence Methods
-(BOOL)saveChanges;
-(NSString*)itemArchivePath;
@end
