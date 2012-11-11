//
//  MapPoint.m
//  Whereami
//
//  Created by Chris Martin on 2/22/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint

@synthesize coordinate, title, subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subTitle:(NSString *)st
{
	self = [super init];
	if (self)
	{
		coordinate = c;
		[self setTitle:t];
		
		[self setSubtitle:st];
	}

	return self;
}

- (void)dealloc 
{
	[subtitle release];
	[title release];
	[super dealloc];
}



@end
