//
//  SPAppDelegate.h
//  Whereami
//
//  Created by Chris Martin on 2/21/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SPAppDelegate : UIResponder 
	<UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
	CLGeocoder *geocoder;
	CLLocationManager *locationManager;
	IBOutlet MKMapView *worldView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UITextField *locationTitleField;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
- (void)makeAnnotation:(CLPlacemark *)p;

@end
