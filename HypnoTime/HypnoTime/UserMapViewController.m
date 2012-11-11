//
//  UserMapViewController.m
//  HypnoTime
//
//  Created by Chris Martin on 3/9/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "UserMapViewController.h"

@implementation UserMapViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) 
    {
        UITabBarItem *tbi = [self tabBarItem];
        
        [tbi setTitle:@"Map"];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self init];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
    [mapView setDelegate:self];
    [self setView:mapView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Loaded Map View");
    [mapView setShowsUserLocation:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [mapView release];
    mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark MKMapViewDelegate methods
- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coord = [userLocation coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    
    [mapView setRegion:region animated:YES];
}

- (void)dealloc
{
    [mapView release];
    mapView = nil;
}
@end
