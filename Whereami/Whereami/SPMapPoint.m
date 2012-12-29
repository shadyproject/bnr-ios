//
//  SPMapPoint.m
//  Whereami
//
//  Created by Christopher Martin on 12/29/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPMapPoint.h"

@implementation SPMapPoint
@synthesize coordinate, title;

#pragma mark Initializers
- (id)initWithCoordinates:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    
    if (self)
    {
        coordinate = c;
        title = t;
    }
    
    return self;
}

- (id)init
{
    return [self initWithCoordinates:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Default Location"];
}

@end
