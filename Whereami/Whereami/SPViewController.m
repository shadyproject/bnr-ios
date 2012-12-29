//
//  SPViewController.m
//  Whereami
//
//  Created by Christopher Martin on 12/27/12.
//  Copyright (c) 2012 Shadyproject. All rights reserved.
//

#import "SPViewController.h"

@interface SPViewController ()

@end

@implementation SPViewController

#pragma mark CLLocationDelegate Methods
/*- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"Got New Locations: %@", locations);
}*/

//FIXME This method is deprecated
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
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
        
        //we only want notifications every 50 meters
        [locationManager setDistanceFilter:50.0];
        
        //start looking for the location
        [locationManager startUpdatingLocation];
    }
    
    return self;
}

- (void)dealloc
{
    [locationManager setDelegate:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
