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
-(id)initWithCoordinates:(CLLocationCoordinate2D)c title:(NSString *)t{
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

#pragma mark -
#pragma mark NSCoding methods
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:title forKey:@"title"];
    [aCoder encodeDouble:coordinate.latitude forKey:@"coordinateLatitude"];
    [aCoder encodeDouble:coordinate.longitude forKey:@"coordinateLongitude"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if (self) {
        title = [aDecoder decodeObjectForKey:@"title"];
        double lat = [aDecoder decodeDoubleForKey:@"coordinateLatitude"];
        double lon = [aDecoder decodeDoubleForKey:@"coordinateLongitude"];
        coordinate = CLLocationCoordinate2DMake(lat, lon);
    }
    
    return self;
}

@end
