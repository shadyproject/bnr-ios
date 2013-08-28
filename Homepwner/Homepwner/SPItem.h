//
//  SPItem.h
//  RandomPossessions
//
//  Created by Christopher Martin on 11/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPItem : NSObject <NSCoding>

#pragma mark Class Methods
+ (id) randomItem;

#pragma mark Initializers
- (id)initWithName:(NSString *)name
      serialNumber:(NSString *)num
       dollarValue:(int)value;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

@property (nonatomic, copy) NSString* imageKey;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, strong) NSData *thumbnailData;

-(void)setThubmnailDataFromImage:(UIImage *)img;

@end
