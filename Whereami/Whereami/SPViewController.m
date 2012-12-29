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
    NSLog(@"Got new Locations: %@", locations);
}*/

//FIXME this method is deprecated
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@", newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Could not get location: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Changed heading: %@", newHeading);
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
        
        //get heading changes
        [locationManager setHeadingFilter:22.5];
        
        //start looking for the location
        [locationManager startUpdatingLocation];
    }
    
    return self;
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
