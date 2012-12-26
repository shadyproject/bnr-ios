//
//  SPItem.h
//  RandomPossessions
//
//  Created by Christopher Martin on 11/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPItem : NSObject
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
    
    SPItem *containedItem;
    __weak SPItem *container;
}

#pragma mark Class Methods
+ (id) randomItem;

#pragma mark Initializers
- (id)initWithName:(NSString *)name
      serialNumber:(NSString *)num
       dollarValue:(int)value;

#pragma mark Accessors
- (NSString *)itemName;
- (void)setItemName:(NSString *)name;

- (NSString *)serialNumber;
- (void)setSerialNumber:(NSString *)num;

- (int)valueInDollars;
- (void)setValueInDollars:(int)value;

- (NSDate *)dateCreated;

- (void)setContainedItem:(SPItem *)item;
- (SPItem *)containedItem;

- (void)setContainer:(SPItem *)container;
- (SPItem *)container;

@end
