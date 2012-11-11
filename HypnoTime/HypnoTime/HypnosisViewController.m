//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Chris Martin on 3/8/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "HypnosisViewController.h"
#import "SPHypnosisView.h"

@implementation HypnosisViewController

- (id)init 
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) 
    {
        srandom(time(NULL));
        
        //Grab a tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        [tbi setTitle:@"Hypnosis"];
        
        UIImage *img = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:img];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //disregard params, nib name is an implementation detail
    return [self init];
}

//called automatically when the view is created
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Loaded view for Hypnosis View Controller");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Connecting to accelerometer");
    UIAccelerometer *a = [UIAccelerometer sharedAccelerometer];
    
    //receive an update every 1/10th of a second
    [a setUpdateInterval:0.1];
    [a setDelegate:self];
    
    [[self  view] becomeFirstResponder];
}
 
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}

- (void)loadView
{
    SPHypnosisView *hv = [[SPHypnosisView alloc] initWithFrame:CGRectZero];
    [hv setBackgroundColor:[UIColor whiteColor]];
   
    [self setView:hv];
    [hv release]; //setView retains it, so we can release it
}

#pragma mark UIAcceleromter protocol
- (void)accelerometer:(UIAccelerometer *)am didAccelerate:(UIAcceleration *)accel
{
    NSLog(@"X:%f, Y:%f, Z:%f", accel.x, accel.y, accel.z);
    
    SPHypnosisView *hv = (SPHypnosisView *)[self view];
    
    //apply a low pass filter to the data to make it smoother
    float xs = [hv xShift] * 0.8 + accel.x * 2.0;
    float ys = [hv yShift] * 0.8 + accel.y * 2.0;
    
    [hv setXShift:xs];
    [hv setYShift:ys];
    
    [hv setNeedsDisplay];
}

@end
