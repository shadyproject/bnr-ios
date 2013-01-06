//
//  SPMapPoint.m
//  Whereami
//
//  Created by Christopher Martin on 12/29/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPMapPoint.h"

@implementation SPMapPoint
@synthesize coordinate, title, dateCreated;

#pragma mark Initializers
- (id)initWithCoordinates:(CLLocationCoordinate2D)c title:(NSString *)t
{
    self = [super init];
    
    if (self)
    {
        coordinate = c;
        title = t;
        dateCreated = [NSDate date];
    }
    
    return self;
}

- (id)init
{
    return [self initWithCoordinates:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Default Location"];
}

#pragma mark MKAnnotation members
- (NSString *)subtitle
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateStyle:NSDateFormatterLongStyle];
    
    NSString *st = [NSString stringWithFormat:@"Created on %@", [fmt stringFromDate:self.dateCreated]];
    
    return st;
}

@end
