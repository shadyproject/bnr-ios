//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Chris Martin on 3/8/12.
//  Copyright (c) 2012 Software Developer. All rights reserved.
//

#import "CurrentTimeViewController.h"

@implementation CurrentTimeViewController

- (id)init 
{
    self = [super initWithNibName:@"CurrentTimeViewController" bundle:nil];
    if (self) 
    {
        //Grab a tab bar item
        UITabBarItem *tbi = [self tabBarItem];
        
        UIImage *img = [UIImage imageNamed:@"Time.png"];
        
        [tbi setImage:img];
        [tbi setTitle:@"Time"];
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
    
    NSLog(@"Loaded view for Current Time View Controller");
    
    [[self view] setBackgroundColor:[UIColor yellowColor]];
}

- (void)viewDidUnload
{
    NSLog(@"CurrentTimeViewController view was unloaded");
    
    [super viewDidUnload];
    [timeLabel release];
    timeLabel = nil;
}

//called automatically
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"CurrentTimeView will appear");
    [super viewDidAppear:animated];
    [self showCurrentTime:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"CurrentTimeView will disapper");
    [super viewDidDisappear:animated];
    
}

- (IBAction)showCurrentTime:(id)sender
{
    NSDate *now = [NSDate date];
    
    // Static here means "only once." The *variable* formatter
    // is created when the program is first loaded into memory.
    // The first time this method runs, formatter will
    // be nil and the if-block will execute, creating
    // an NSDateFormatter object that formatter will point to.
    // Subsequent entry into this method will reuse the same
    // NSDateFormatter object. 
    static NSDateFormatter *formatter = nil;
    
    if (!formatter) 
    {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    [timeLabel setText:[formatter stringFromDate:now]];
}

- (void)dealloc
{
    [timeLabel release];
    [super dealloc];
}
@end
