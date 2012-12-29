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

//required for MKAnnotation
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
//required for MKAnnotation
@property (nonatomic, copy) NSString *title;

@end
