//
//  SPItem.h
//  Homepwner
//
//  Created by Christopher Martin on 9/1/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SPItem : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic) int32_t valueInDollars;
@property (nonatomic) NSTimeInterval dateCreated;
@property (nonatomic, retain) NSString * imageKey;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic) double orderingValue;
@property (nonatomic, retain) NSManagedObject *assetType;

-(void)setThumbnailFromImage:(UIImage*)image;
@end
