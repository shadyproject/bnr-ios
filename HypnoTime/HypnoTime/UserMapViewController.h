//
//  UserMapViewController.h
//  HypnoTime
//
//  Created by Chris Martin on 3/9/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface UserMapViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
}
@end
