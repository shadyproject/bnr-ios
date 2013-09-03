//
//  SPAssetType.h
//  Homepwner
//
//  Created by Christopher Martin on 9/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SPItem;

@interface SPAssetType : NSManagedObject

@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSSet *items;
@end

@interface SPAssetType (CoreDataGeneratedAccessors)

- (void)addItemsObject:(SPItem *)value;
- (void)removeItemsObject:(SPItem *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

@end
