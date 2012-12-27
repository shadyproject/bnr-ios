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

#pragma mark Properties
@property (nonatomic, strong) SPItem *containedItem;
@property (nonatomic, weak) SPItem *container;

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

@end
