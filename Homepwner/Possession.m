//
//  Possession.m
//  RandomPosessions
//
//  Created by Chris Martin on 2/18/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize possessionName, serialNumber, valueInDollars, dateCreated;
@synthesize imageKey;

+ (id)randomPossession
{
	//Random array of adjectives
	NSArray *randomAdjectiveList = [NSArray arrayWithObjects: @"Fluffy", @"Rusty", @"Shiny", nil];

	//Random array of nouns
	NSArray *randomNounList = [NSArray arrayWithObjects: @"Bear", @"Spork", @"Mac", nil];

	//Get the index of a random word from the lists above
	int adjectiveIndex = (int)(rand() % [randomAdjectiveList count]);
	int nounIndex = (int)(rand() % [randomNounList count]);

	NSString *randomName = [NSString stringWithFormat:@"%@ %@", 
								[randomAdjectiveList objectAtIndex:adjectiveIndex], 
								[randomNounList objectAtIndex:nounIndex]];

	int randomValue = rand() % 100;

	NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c", 
										'0' + rand() % 10, 
										'A' + rand() % 26, 
										'0' + rand() % 10, 
										'A' + rand() % 26, 
										'0' + rand() % 10];

	//return the new random object
	Possession *randomPossession = 
		[[self alloc] initWithPossessionName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

	return [randomPossession autorelease];
}

//override NSObject default initializer
- (id)init
{
	return [self initWithPossessionName:@"Possession"];
}

- (id)initWithPossessionName: (NSString *)name
{
	
	return [self initWithPossessionName:name valueInDollars:0 serialNumber:@""];
}

- (id)initWithPossessionName: (NSString *)name
								valueInDollars: (int)value
								serialNumber: (NSString *)serialNum
{
	//call superclass designated initializer
	self =[super init];

	//make sure the superclass designated initializer succeeded
	if (self)
	{
		//set some values
		[self setPossessionName:name];
		[self setSerialNumber:serialNum];
		[self setValueInDollars:value];

		dateCreated = [[NSDate alloc] init];
	}

	//return the pointer to our object
	return self;
}

- (NSString *)description 
{
	return [NSString stringWithFormat:@"%@ (%@): Worth $%d, recorded on %@", 
										possessionName, 
										serialNumber, 
										valueInDollars, 
										dateCreated];
}

- (void)dealloc
{
	[possessionName release];
	[serialNumber release];
	[dateCreated release];
    [imageKey release];
	[super dealloc];
}
@end
