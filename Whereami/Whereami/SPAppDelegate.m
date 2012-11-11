//
//  SPAppDelegate.m
//  Whereami
//
//  Created by Chris Martin on 2/21/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "SPAppDelegate.h"
#import "MapPoint.h"

@implementation SPAppDelegate

@synthesize window = _window;

- (void)dealloc
{
    if ([locationManager delegate] == self)
    {
        [locationManager setDelegate:nil];
    }

    [geocoder release];
    [locationManager release];
    [_window release];
    [super dealloc];
}

- (void)makeAnnotation:(CLPlacemark *)p
{
    
}

- (void)findLocation 
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];

    NSString *sub = [NSString stringWithFormat:@"Added: %@", 
        [NSDateFormatter localizedStringFromDate:[NSDate date]
            dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle]];

    //MKMapView retains its annotations
    MapPoint *mp = [[[MapPoint alloc] initWithCoordinate:coord title:[locationTitleField text] subTitle:sub] autorelease];

    [geocoder reverseGeocodeLocation:loc 
                   completionHandler:^(NSArray *placemarks, NSError *error)
    {
        NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
        if (error)
        {
            NSLog(@"Geocode failed with error: %@", error);
            return;
        }
        NSLog(@"Received placemarks: %@", placemarks);
        CLPlacemark *p = [placemarks objectAtIndex:0];

        if (p != nil)
        {
            MapPoint *last = [[worldView annotations] lastObject];
            NSString *t = [NSString localizedStringWithFormat:@"%@, %@",[p locality], [p administrativeArea]];
            [last setTitle:t];
        }
    }];

    [worldView addAnnotation:mp];

    //zoom to this region
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];

    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

#pragma mark UIApplication delegate methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //create the location manager object
    locationManager = [[CLLocationManager alloc] init];

    //set ourselves as the delegate
    [locationManager setDelegate:self];

    //make sure we get all the results
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    //and get the heading too
    [locationManager setHeadingFilter:kCLHeadingFilterNone];

    //and make them as accurate as possible
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];

    //set up a geocoder
    geocoder = [[CLGeocoder alloc] init];

    //start looking for the location immediately
    /*if ([CLLocationManager locationServicesEnabled]) 
    {
        [locationManager startUpdatingLocation];
    }
    
    //and the heading too, if we can get it
    if ([CLLocationManager headingAvailable])
    {
        [locationManager startUpdatingHeading];
    }*/
    [worldView setShowsUserLocation:YES];
    //[worldView setUserTrackingMode: MKUserTrackingModeFollow animated:YES];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark CLLocationManager delegate methods
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"New Location: %@", newLocation);

    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];

    // CLLocationManagers will return the last found location of the
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it.
    if (t < -180) 
    {
        // This is cached data, you don't want it, keep looking
        return;
    }

    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"New Heading: %@", newHeading);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

#pragma mark MKMapViewDelegate methods
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

#pragma mark UITextFieldDelegate methods
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self findLocation];

    [textField resignFirstResponder];

    return YES;
}

#pragma mark CLGeocoder handlers


@end
