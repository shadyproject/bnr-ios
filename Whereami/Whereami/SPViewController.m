//
//  SPViewController.m
//  Whereami
//
//  Created by Christopher Martin on 12/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPViewController.h"
#import "SPMapPoint.h"

@interface SPViewController ()
@end

@implementation SPViewController

#pragma mark Synthesize properties
@synthesize locationManager;
@synthesize worldView, activityIndicator, locationTitleField;

#pragma mark CLLocationDelegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Got new Locations: %@", locations);
    
    CLLocation *loc = locations[0];
    
    NSTimeInterval t = [[loc timestamp] timeIntervalSinceNow];
    
    //ignore the location if it was made more than 3 minutes ago
    //since CLLocationManager will return a cached location first
    if (t < -180)
        return;
    
    [self foundLocation:loc];
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not get location: %@", error);
}

#pragma mark MKMapViewDelegate methods
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    //require method but we don't actually care about it
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
   
    [worldView setRegion:region animated:YES];
}

#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //todo implement me
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

#pragma mark Overrides
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        //create location manager
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [worldView setShowsUserLocation:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Our Methods
- (void)findLocation
{
    [locationManager startUpdatingLocation];
    
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    SPMapPoint *mp = [[SPMapPoint alloc] initWithCoordinates:coord title:[locationTitleField text]];
    
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:reg];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

#pragma mark -
#pragma mark UIViewController Overrides
-(BOOL)shouldAutorotate{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

//note that these only work in 6.0
//the 5.0 and below way of doing this is to override shouldAutorotateToInterfaceOrientation
-(NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

@end
