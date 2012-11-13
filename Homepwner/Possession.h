//
//  Possession.h
//  RandomPosessions
//
//  Created by Chris Martin on 2/18/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSObject
{
	NSString *possessionName;
	NSString *serialNumber;
	int valueInDollars;
	NSDate *dateCreated;
    NSString *imageKey;
}

+ (id)randomPossession;

- (id)initWithPossessionName:(NSString *)name
								valueInDollars: (int)value
								serialNumber: (NSString *)serialNum;

- (id)initWithPossessionName:(NSString *)name;

@property (nonatomic, copy) NSString *possessionName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;
@property (nonatomic, copy) NSString *imageKey;
@end
