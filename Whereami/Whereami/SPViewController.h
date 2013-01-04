//
//  SPViewController.h
//  Whereami
//
//  Created by Christopher Martin on 12/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface SPViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>

@property CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet MKMapView *worldView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITextField *locationTitleField;


- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
@end
