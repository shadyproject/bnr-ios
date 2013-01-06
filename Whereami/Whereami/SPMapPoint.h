//
//  SPMapPoint.h
//  Whereami
//
//  Created by Christopher Martin on 12/29/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SPMapPoint : NSObject <MKAnnotation>

- (id)initWithCoordinates:(CLLocationCoordinate2D)c title:(NSString *)t;

#pragma mark MKAnnotation Members
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;

#pragma mark Object Members
@property (nonatomic, retain) NSDate *dateCreated;

@end
