//
//  MapPoint.h
//  Whereami
//
//  Created by Chris Martin on 2/22/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapPoint : NSObject <MKAnnotation>
{
	NSString *title;
	NSString *subtitle;
	CLLocationCoordinate2D coordinate;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t subTitle:(NSString *)st;

@property (nonatomic, readonly)CLLocationCoordinate2D coordinate;

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *subtitle;

@end
